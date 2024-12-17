<?php
session_start();
ob_start();

// Kiểm tra tổng tiền
$total = isset($_SESSION['total']) ? $_SESSION['total'] : 0;
if ($total <= 0) {
    die("Tổng tiền không hợp lệ. Vui lòng kiểm tra lại giỏ hàng.");
}

// Thêm 2% phí
$amount = $total + ($total * 0.02);

// Thông tin MoMo
$endpoint = "https://test-payment.momo.vn/v2/gateway/api/create";
$partnerCode = "MOMOBKUN20180529";
$accessKey = "klm05TvNBzhg7h7j";
$secretKey = "at67qH6mk8w5Y1nAyMoYKMWACiEi2bsa";
$orderInfo = "Thanh toán MoMo QR";
$orderId = time();
$redirectUrl = "http://localhost/giohang.php";
$ipnUrl = "http://localhost/index.php";
$requestId = time();
$requestType = "captureWallet";
$extraData = "";

// Tạo signature
$rawHash = "accessKey=$accessKey&amount=$amount&extraData=$extraData&ipnUrl=$ipnUrl&orderId=$orderId&orderInfo=$orderInfo&partnerCode=$partnerCode&redirectUrl=$redirectUrl&requestId=$requestId&requestType=$requestType";
$signature = hash_hmac("sha256", $rawHash, $secretKey);

// Dữ liệu gửi đến MoMo
$data = array(
    'partnerCode' => $partnerCode,
    'partnerName' => "Test",
    'storeId' => "MomoTestStore",
    'requestId' => $requestId,
    'amount' => $amount,
    'orderId' => $orderId,
    'orderInfo' => $orderInfo,
    'redirectUrl' => $redirectUrl,
    'ipnUrl' => $ipnUrl,
    'lang' => 'vi',
    'extraData' => $extraData,
    'requestType' => $requestType,
    'signature' => $signature
);

// Gửi yêu cầu đến MoMo
$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $endpoint);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
curl_setopt($ch, CURLOPT_POST, 1);
curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
curl_setopt($ch, CURLOPT_HTTPHEADER, ['Content-Type: application/json']);

$result = curl_exec($ch);
curl_close($ch);

// Xử lý phản hồi
$response = json_decode($result, true);
if (isset($response['payUrl'])) {
    header('Location: ' . $response['payUrl']);
} else {
    echo "Thanh toán thất bại. Chi tiết lỗi: " . $response['message'];
}
?>
