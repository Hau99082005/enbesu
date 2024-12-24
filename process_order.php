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
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        body {
            font-family: 'Roboto', Arial, sans-serif;
            background-color: #f9fafb;
            color: #333;
            line-height: 1.6;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .container {
            max-width: 500px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            text-align: center;
            padding: 30px;
            position: relative;
        }
        .checkmark {
            width: 80px;
            height: 80px;
            border-radius: 50%;
            background-color: #2ecc71;
            display: inline-block;
            position: relative;
            margin: 0 auto 20px;
        }
        .checkmark::after {
            content: '';
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(45deg);
            width: 25px;
            height: 50px;
            border: solid #fff;
            border-width: 0 6px 6px 0;
            animation: draw 0.5s ease-in-out forwards;
        }
        @keyframes draw {
            0% {
                height: 0;
                width: 0;
            }
            100% {
                height: 50px;
                width: 25px;
            }
        }
        h1 {
            font-size: 24px;
            color: #2ecc71;
            margin-bottom: 10px;
        }
        .success-message {
            font-size: 16px;
            color: #555;
            margin-bottom: 20px;
        }
        .order-details {
            background: #f4f4f4;
            padding: 15px;
            border-radius: 8px;
            margin-bottom: 20px;
        }
        .order-details p {
            margin: 5px 0;
        }
        .order-details strong {
            color: #333;
        }
        .button {
            display: inline-block;
            padding: 12px 20px;
            font-size: 14px;
            font-weight: bold;
            text-decoration: none;
            color: #fff;
            border-radius: 5px;
            background: #3498db;
            margin: 0 10px;
            transition: background 0.3s;
        }
        .button:hover {
            background: #2980b9;
        }
        .center {
            margin-top: 20px;
        }
        @media (max-width: 768px) {
            .container {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="checkmark"></div>
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
