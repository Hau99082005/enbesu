<?php
ob_start();
require_once 'inc/database.php';

// Bắt đầu session nếu chưa có
if (session_status() === PHP_SESSION_NONE) {
    session_start();
}

// Debug mode
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Kiểm tra đăng nhập và thông tin đơn hàng
if (!isset($_SESSION['user']) || !isset($_SESSION['order_info'])) {
    header('Location: checkout.php');
    exit();
}

// Lấy thông tin đơn hàng từ session
$order_info = $_SESSION['order_info'];
$cart = $_SESSION['cart'];

// Debug: In thông tin
echo "<pre>";
echo "Thông tin đơn hàng: \n";
print_r($order_info);
echo "\nGiỏ hàng: \n";
print_r($cart);
echo "</pre>";

// Tính tổng tiền
$total_amount = 0;
foreach ($cart as $item) {
    if (is_object($item)) {
        $total_amount += $item->quantity * $item->price * 1000;
    } else {
        $decoded_item = json_decode($item);
        if ($decoded_item) {
            $total_amount += $decoded_item->quantity * $decoded_item->price * 1000;
        }
    }
}

echo "<p>Tổng tiền: " . number_format($total_amount, 0, ',', '.') . " VND</p>";

// Lưu đơn hàng vào database trước khi thanh toán
$db = Database::getConnection();
$user_id = $_SESSION['user']['id'];
$db->begin_transaction();

try {
    // Thêm đơn hàng vào bảng orders với payment_method và payment_status
    $status = 'Pending';  // Sử dụng giá trị enum đúng
    $payment_method = 'MoMo';
    $payment_status = 'Chưa thanh toán';
    
    $stmt = $db->prepare("INSERT INTO orders (customer_name, customer_address, customer_phone, note, total_amount, user_id, status, payment_method, payment_status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
    if (!$stmt) {
        throw new Exception($db->error);
    }
    
    $stmt->bind_param("ssssdisss", 
        $order_info['name'],
        $order_info['address'],
        $order_info['phone'],
        $order_info['note'],
        $total_amount,
        $user_id,
        $status,
        $payment_method,
        $payment_status
    );
    
    if (!$stmt->execute()) {
        throw new Exception($stmt->error);
    }
    
    $order_id = $db->insert_id;
    echo "<p>Đã tạo đơn hàng ID: " . $order_id . "</p>";
    
    $db->commit();
    
    // Cấu hình thanh toán MoMo
    $endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
    $partnerCode = "MOMOBKUN20180529";
    $accessKey = "klm05TvNBzhg7h7j";
    $secretKey = "at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa";
    $orderInfo = "Thanh toán đơn hàng #" . $order_id;
    
    // Lấy URL hiện tại
    $protocol = isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? 'https://' : 'http://';
    $host = $_SERVER['HTTP_HOST'];
    $baseUrl = $protocol . $host . dirname($_SERVER['PHP_SELF']);
    
    // Tạo URL redirect và IPN với tham số order_id
    $redirectUrl = rtrim($baseUrl, '/') . "/xulythanhtoan.php?order_id=" . $order_id;
    $ipnUrl = rtrim($baseUrl, '/') . "/xulythanhtoan.php?order_id=" . $order_id;
    
    $amount = (string)$total_amount;
    $orderId = (string)time() . "_" . $order_id;
    $requestId = (string)time();
    $extraData = "";
    $requestType = "captureWallet";
    $partnerName = "Test";
    $storeId = "MomoTestStore";
    $orderGroupId = "";
    $autoCapture = true;
    $lang = "vi";

    // Tạo chữ ký với URL đã có tham số order_id
    $rawHash = "accessKey=" . $accessKey .
        "&amount=" . $amount .
        "&extraData=" . $extraData .
        "&ipnUrl=" . $ipnUrl .
        "&orderId=" . $orderId .
        "&orderInfo=" . $orderInfo .
        "&partnerCode=" . $partnerCode .
        "&redirectUrl=" . $redirectUrl .
        "&requestId=" . $requestId .
        "&requestType=" . $requestType;
        
    echo "<p>Raw Hash: " . $rawHash . "</p>";
    
    $signature = hash_hmac("sha256", $rawHash, $secretKey);

    $data = [
        'partnerCode' => $partnerCode,
        'partnerName' => $partnerName,
        'storeId' => $storeId,
        'requestId' => $requestId,
        'amount' => $amount,
        'orderId' => $orderId,
        'orderInfo' => $orderInfo,
        'redirectUrl' => $redirectUrl,
        'ipnUrl' => $ipnUrl,
        'lang' => $lang,
        'extraData' => $extraData,
        'requestType' => $requestType,
        'signature' => $signature,
        'autoCapture' => $autoCapture,
        'orderGroupId' => $orderGroupId
    ];

    // Debug: In ra request
    echo "<pre>";
    echo "Request to MoMo:\n";
    print_r($data);
    echo "</pre>";

    // Gọi API MoMo
    $ch = curl_init($endpoint);
    curl_setopt($ch, CURLOPT_CUSTOMREQUEST, "POST");
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json',
        'Content-Length: ' . strlen(json_encode($data)))
    );
    curl_setopt($ch, CURLOPT_TIMEOUT, 5);
    curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
    curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);

    $result = curl_exec($ch);
    
    // Debug: In ra response
    echo "<pre>";
    echo "Response from MoMo:\n";
    if ($result === FALSE) {
        echo "CURL Error: " . curl_error($ch);
    } else {
        print_r(json_decode($result, true));
    }
    echo "</pre>";
    
    curl_close($ch);

    $jsonResult = json_decode($result, true);
    if (isset($jsonResult['payUrl'])) {
        // Chuyển hướng đến trang thanh toán MoMo
        header('Location: ' . $jsonResult['payUrl']);
        exit();
    } else {
        throw new Exception("Không nhận được payUrl từ MoMo. Response: " . $result);
    }

} catch (Exception $e) {
    $db->rollback();
    die('Có lỗi xảy ra: ' . $e->getMessage());
} finally {
    $db->close();
}
?>
