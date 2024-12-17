<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);
ob_start();

// Bắt đầu session
session_start();

// Kiểm tra nếu người dùng đã đăng nhập, lấy user_id từ session
if (!isset($_SESSION['user_id'])) {
    die('Bạn cần đăng nhập trước khi đặt hàng.');
}

require_once 'inc/database.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $name = isset($_POST['name']) ? trim($_POST['name']) : '';
    $address = isset($_POST['address']) ? trim($_POST['address']) : '';
    $phone = isset($_POST['phone']) ? trim($_POST['phone']) : '';
    $note = isset($_POST['note']) ? trim($_POST['note']) : '';
    $cart = isset($_SESSION['cart']) ? $_SESSION['cart'] : [];
    $total_amount = 0;

    // Kiểm tra giỏ hàng
    if (empty($cart)) {
        die('Giỏ hàng trống. Vui lòng thêm sản phẩm trước khi đặt hàng.');
    }

    // Tính tổng tiền
    foreach ($cart as $item) {
        $total_amount += $item->quantity * $item->price * 1000;
    }

    // Kiểm tra thông tin bắt buộc
    if (empty($name) || empty($address) || empty($phone)) {
        die('Vui lòng nhập đầy đủ thông tin bắt buộc.');
    }

    // Lấy user_id từ session
    $user_id = $_SESSION['user_id'];

    // Kết nối đến cơ sở dữ liệu
    $db = Database::getConnection();
    if (!$db) {
        die('Không thể kết nối cơ sở dữ liệu.');
    }

    $db->begin_transaction();
    try {
        // Thêm đơn hàng vào bảng `orders`
        $stmt = $db->prepare("INSERT INTO `orders` (customer_name, customer_address, customer_phone, note, total_amount, user_id, created_at) VALUES (?, ?, ?, ?, ?, ?, NOW())");
        if (!$stmt) {
            throw new Exception('Lỗi chuẩn bị câu lệnh: ' . $db->error);
        }
        $stmt->bind_param('ssssdii', $name, $address, $phone, $note, $total_amount, $user_id);
        if (!$stmt->execute()) {
            throw new Exception('Lỗi thực thi câu lệnh: ' . $stmt->error);
        }
        $order_id = $stmt->insert_id;

        // Thêm các sản phẩm vào bảng `order_items`
        $stmt_item = $db->prepare("INSERT INTO `order_items` (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)");
        if (!$stmt_item) {
            throw new Exception('Lỗi chuẩn bị câu lệnh (order_items): ' . $db->error);
        }
        foreach ($cart as $item) {
            $stmt_item->bind_param('iiid', $order_id, $item->id, $item->quantity, $item->price);
            if (!$stmt_item->execute()) {
                throw new Exception('Lỗi thực thi câu lệnh (order_items): ' . $stmt_item->error);
            }
        }

        // Xóa giỏ hàng sau khi hoàn tất đơn hàng
        unset($_SESSION['cart']);
        $db->commit();

        // Hiển thị thông báo thành công
        echo <<<HTML
        <!DOCTYPE html>
        <html lang="vi">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Đặt hàng thành công</title>
            <style>
                body {
                    margin: 0;
                    padding: 0;
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    height: 100vh;
                    background: radial-gradient(circle, #4caf50, #2e7d32);
                    font-family: 'Poppins', sans-serif;
                    overflow: hidden;
                }
                .success-container {
                    text-align: center;
                    background: white;
                    padding: 50px;
                    border-radius: 15px;
                    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
                    transform: scale(0.8);
                    animation: fadeInScale 0.6s ease-out forwards;
                }
                .success-icon {
                    font-size: 90px;
                    color: #4caf50;
                    margin-bottom: 20px;
                    animation: bounceIn 1s ease-out, spin 2s linear infinite;
                }
                .message {
                    font-size: 28px;
                    font-weight: bold;
                    color: #333;
                    margin-bottom: 10px;
                    animation: slideIn 1s ease-in-out;
                }
                .details {
                    font-size: 18px;
                    color: #555;
                    margin-bottom: 30px;
                    line-height: 1.6;
                    animation: fadeIn 1.5s ease-in-out;
                }
                .btn {
                    display: inline-block;
                    padding: 15px 30px;
                    background: #4caf50;
                    color: white;
                    text-decoration: none;
                    font-size: 18px;
                    font-weight: bold;
                    border-radius: 25px;
                    transition: all 0.3s ease;
                    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
                }
                .btn:hover {
                    background: #388e3c;
                    transform: scale(1.1);
                    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
                }
                @keyframes fadeInScale {
                    0% {
                        opacity: 0;
                        transform: scale(0.5);
                    }
                    100% {
                        opacity: 1;
                        transform: scale(1);
                    }
                }
                @keyframes bounceIn {
                    0% {
                        transform: scale(0.5);
                        opacity: 0;
                    }
                    60% {
                        transform: scale(1.2);
                        opacity: 1;
                    }
                    100% {
                        transform: scale(1);
                    }
                }
                @keyframes slideIn {
                    0% {
                        opacity: 0;
                        transform: translateY(-20px);
                    }
                    100% {
                        opacity: 1;
                        transform: translateY(0);
                    }
                }
                @keyframes fadeIn {
                    0% {
                        opacity: 0;
                    }
                    100% {
                        opacity: 1;
                    }
                }
                @media (max-width: 600px) {
                    .success-icon {
                        font-size: 70px; /* Giảm kích thước icon trên điện thoại */
                    }
                    .success-container {
                        padding: 30px;
                    }
                }
            </style>
            <script>
                setTimeout(() => {
                    window.location.href = "index.php";
                }, 8000);
            </script>
        </head>
        <body>
            <div class="success-container">
                <div class="success-icon">✔</div>
                <div class="message">Đặt hàng thành công!</div>
                <div class="details">Cảm ơn bạn đã đặt hàng. Chúng tôi sẽ liên hệ với bạn sớm để xác nhận đơn hàng.</div>
                <a href="index.php" class="btn">Quay lại trang chủ</a>
            </div>
        </body>
        </html>
        HTML;

    } catch (Exception $e) {
        $db->rollback();
        die('Có lỗi xảy ra trong quá trình xử lý đơn hàng: ' . $e->getMessage());
    } finally {
        $db->close();
    }
} else {
    die('Yêu cầu không hợp lệ.');
}
?>
