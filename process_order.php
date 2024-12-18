<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
ob_start();

require_once 'inc/database.php';


if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


if (!isset($_SESSION['user'])) {
    die('Bạn cần đăng nhập trước khi đặt hàng.');
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $address = isset($_POST['address']) ? trim($_POST['address']) : '';
    $phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
    $note = isset($_POST['note']) ? trim($_POST['note']) : '';
    $payment_method = isset($_POST['payment_method']) ? trim($_POST['payment_method']) : '';
    $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
    $total_amount = 0;

   
    if (empty($cart)) {
        die('Giỏ hàng trống. Vui lòng thêm sản phẩm trước khi đặt hàng.');
    }

   
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

   
    if (empty($name) || empty($address) || empty($phone)) {
        die('Vui lòng nhập đầy đủ thông tin bắt buộc.');
    }

   
    $_SESSION['order_info'] = [
        'name' => $name,
        'address' => $address,
        'phone' => $phone,
        'note' => $note
    ];

   
    if ($payment_method === 'momo') {
        header('Location: thanhtoanmomo.php');
        exit();
    } else {
        
        $db = Database::getConnection();
        $user_id = $_SESSION['user']['id'];

        $db->begin_transaction();
        try {
           
            $status = 'Pending';
            $stmt = $db->prepare("INSERT INTO `orders` (customer_name, customer_address, customer_phone, note, total_amount, user_id, status) VALUES (?, ?, ?, ?, ?, ?, ?)");
            if (!$stmt) {
                throw new Exception($db->error);
            }
            $stmt->bind_param("ssssdis", $name, $address, $phone, $note, $total_amount, $user_id, $status);
            if (!$stmt->execute()) {
                throw new Exception($stmt->error);
            }

            $order_id = $db->insert_id;

         
            unset($_SESSION['cart']);
            unset($_SESSION['total']);
            unset($_SESSION['order_info']);

            $db->commit();

          
            ?>
            <!DOCTYPE html>
            <html lang="vi">
            <head>
                <meta charset="UTF-8">
                <meta name="viewport" content="width=device-width, initial-scale=1.0">
                <title>Đặt hàng thành công</title>
                <style>
                    body {
                        font-family: Arial, sans-serif;
                        line-height: 1.6;
                        margin: 0;
                        padding: 20px;
                        background-color: #f4f4f4;
                    }
                    .container {
                        max-width: 600px;
                        margin: 0 auto;
                        background: white;
                        padding: 20px;
                        border-radius: 5px;
                        box-shadow: 0 0 10px rgba(0,0,0,0.1);
                    }
                    h1 {
                        color: #2ecc71;
                        text-align: center;
                    }
                    .success-message {
                        text-align: center;
                        margin-bottom: 20px;
                    }
                    .order-details {
                        margin-bottom: 20px;
                    }
                    .button {
                        display: inline-block;
                        padding: 10px 20px;
                        background-color: #3498db;
                        color: white;
                        text-decoration: none;
                        border-radius: 5px;
                        margin-right: 10px;
                    }
                    .button:hover {
                        background-color: #2980b9;
                    }
                    .center {
                        text-align: center;
                    }
                </style>
            </head>
            <body>
                <div class="container">
                    <h1>Đặt hàng thành công!</h1>
                    <div class="success-message">
                        <p>Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ xử lý đơn hàng của bạn trong thời gian sớm nhất.</p>
                    </div>
                    <div class="order-details">
                        <p><strong>Mã đơn hàng:</strong> #<?php echo $order_id; ?></p>
                        <p><strong>Tổng tiền:</strong> <?php echo number_format($total_amount, 0, ',', '.'); ?> đ</p>
                    </div>
                    <div class="center">
                        <a href="index.php" class="button">Tiếp tục mua sắm</a>
                        <a href="order.php" class="button">Xem đơn hàng</a>
                    </div>
                </div>
            </body>
            </html>
            <?php
            exit();
        } catch (Exception $e) {
            $db->rollback();
            die('Có lỗi xảy ra trong quá trình xử lý đơn hàng: ' . $e->getMessage());
        } finally {
            $db->close();
        }
    }
} else {
    die('Yêu cầu không hợp lệ.');
}
?>
