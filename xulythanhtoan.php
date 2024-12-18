<?php
session_start();
require_once 'inc/database.php';

// Debug mode
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Lấy thông tin từ MoMo gửi về
$resultCode = isset($_GET['resultCode']) ? $_GET['resultCode'] : null;
$order_id = isset($_GET['order_id']) ? $_GET['order_id'] : null;
$amount = isset($_GET['amount']) ? $_GET['amount'] : null;
$transId = isset($_GET['transId']) ? $_GET['transId'] : null;

// Debug: In thông tin nhận được
echo "<pre>";
echo "GET Params:\n";
print_r($_GET);
echo "</pre>";

// Kiểm tra kết quả thanh toán
if ($resultCode == 0 && $order_id) { // Thanh toán thành công
    // Kiểm tra session
    if (!isset($_SESSION['user'])) {
        $_SESSION['error'] = 'Phiên làm việc đã hết hạn';
        header('Location: checkout.php');
        exit();
    }
    
    $user_id = $_SESSION['user']['id'];
    
    // Kết nối database
    $db = Database::getConnection();
    if (!$db) {
        die('Không thể kết nối cơ sở dữ liệu');
    }
    
    $db->begin_transaction();
    try {
        // Kiểm tra đơn hàng có tồn tại và thuộc về user không
        $check_stmt = $db->prepare("SELECT id FROM orders WHERE id = ? AND user_id = ?");
        $check_stmt->bind_param('ii', $order_id, $user_id);
        $check_stmt->execute();
        $check_result = $check_stmt->get_result();
        
        if ($check_result->num_rows === 0) {
            throw new Exception('Đơn hàng không tồn tại hoặc không thuộc về bạn');
        }
        
        // Cập nhật trạng thái đơn hàng và trạng thái thanh toán
        $stmt = $db->prepare("UPDATE orders SET status = 'Processing', payment_status = 'Đã thanh toán' WHERE id = ?");
        if (!$stmt) {
            throw new Exception($db->error);
        }
        $stmt->bind_param('i', $order_id);
        if (!$stmt->execute()) {
            throw new Exception($stmt->error);
        }
        
        // Xóa session không cần thiết
        unset($_SESSION['cart']);
        unset($_SESSION['total']);
        unset($_SESSION['order_info']);
        
        $db->commit();
        
        // Chuyển hướng về trang đơn hàng với thông báo thành công
        $_SESSION['message'] = 'Thanh toán thành công! Cảm ơn bạn đã mua hàng.';
        $_SESSION['message_type'] = 'success';
        
    } catch (Exception $e) {
        $db->rollback();
        $_SESSION['message'] = 'Có lỗi xảy ra: ' . $e->getMessage();
        $_SESSION['message_type'] = 'danger';
    } finally {
        $db->close();
    }
} else {
    // Thanh toán thất bại
    $_SESSION['message'] = 'Thanh toán thất bại. Vui lòng thử lại sau.';
    $_SESSION['message_type'] = 'danger';
}

// Chuyển hướng về trang đơn hàng
header('Location: order.php');
exit();
