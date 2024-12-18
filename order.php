<?php
ob_start();
require_once 'inc/database.php';


if (session_status() === PHP_SESSION_NONE) {
    session_start();
}


if (!isset($_SESSION['user'])) {
    die('Vui lòng đăng nhập để xem đơn hàng.');
}
$user_id = $_SESSION['user']['id'];


if (isset($_POST['cancel_order']) && isset($_POST['order_id'])) {
    $order_id = $_POST['order_id'];
    
   
    $check_query = "SELECT status FROM orders WHERE id = ? AND user_id = ? AND status = 'Pending'";
    $db = Database::getConnection();
    $check_stmt = $db->prepare($check_query);
    $check_stmt->bind_param('ii', $order_id, $user_id);
    $check_stmt->execute();
    $check_result = $check_stmt->get_result();
    
    if ($check_result->num_rows > 0) {
      
        $update_query = "UPDATE orders SET status = 'Cancelled' WHERE id = ?";
        $update_stmt = $db->prepare($update_query);
        $update_stmt->bind_param('i', $order_id);
        
        if ($update_stmt->execute()) {
            $_SESSION['message'] = 'Hủy đơn hàng thành công';
            $_SESSION['message_type'] = 'success';
        } else {
            $_SESSION['message'] = 'Có lỗi xảy ra khi hủy đơn hàng';
            $_SESSION['message_type'] = 'danger';
        }
    }
    
   
    header('Location: order.php');
    exit();
}

_header('Đơn hàng của tôi');
_navbar();

$db = Database::getConnection();


$query = "SELECT o.id, o.customer_name, o.customer_address, o.customer_phone, 
                 o.total_amount, o.created_at, o.status, o.payment_method, o.payment_status
          FROM orders o 
          WHERE o.user_id = ? 
          ORDER BY o.created_at DESC";

$stmt = $db->prepare($query);
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();


if (isset($_SESSION['message'])) {
    echo '<div class="container mt-3">
            <div class="alert alert-' . $_SESSION['message_type'] . ' alert-dismissible fade show" role="alert">
                ' . $_SESSION['message'] . '
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
          </div>';
    unset($_SESSION['message']);
    unset($_SESSION['message_type']);
}

echo '
<div class="container mt-5 mb-5">
    <div class="row">
        <div class="col-12">
            <div class="card">
                <div class="card-header bg-primary text-white">
                    <h2 class="mb-0">Đơn hàng của tôi</h2>
                </div>
                <div class="card-body">
                    <div class="table-responsive">
                        <table class="table table-hover">
                            <thead class="thead-light">
                                <tr>
                                    <th scope="col">Mã đơn hàng</th>
                                    <th scope="col">Ngày đặt</th>
                                    <th scope="col">Họ tên</th>
                                    <th scope="col">Địa chỉ</th>
                                    <th scope="col">Số điện thoại</th>
                                    <th scope="col">Tổng tiền</th>
                                    <th scope="col">Phương thức</th>
                                    <th scope="col">Trạng thái TT</th>
                                    <th scope="col">Trạng thái ĐH</th>
                                    <th scope="col">Thao tác</th>
                                </tr>
                            </thead>
                            <tbody>';

while ($row = $result->fetch_assoc()) {
  
    $statusClass = '';
    $displayStatus = '';
    switch($row['status']) {
        case 'Pending':
            $statusClass = 'badge bg-warning';
            $displayStatus = 'Đang chờ xử lý';
            break;
        case 'Processing':
            $statusClass = 'badge bg-info';
            $displayStatus = 'Đang xử lý';
            break;
        case 'Cancelled':
            $statusClass = 'badge bg-danger';
            $displayStatus = 'Đã hủy';
            break;
        default:
            $statusClass = 'badge bg-secondary';
            $displayStatus = $row['status'];
    }

 
    $payment_status_class = '';
    switch($row['payment_status']) {
        case 'Đã thanh toán':
            $payment_status_class = 'badge bg-success';
            break;
        case 'Chưa thanh toán':
            $payment_status_class = 'badge bg-warning';
            break;
        default:
            $payment_status_class = 'badge bg-secondary';
    }

    echo '<tr>
        <td>' . $row['id'] . '</td>
        <td>' . date('d/m/Y H:i', strtotime($row['created_at'])) . '</td>
        <td>' . htmlspecialchars($row['customer_name']) . '</td>
        <td>' . htmlspecialchars($row['customer_address']) . '</td>
        <td>' . htmlspecialchars($row['customer_phone']) . '</td>
        <td><strong class="text-success">' . number_format($row['total_amount'], 0, ',', '.') . ' đ</strong></td>
        <td>' . $row['payment_method'] . '</td>
        <td><span class="' . $payment_status_class . '">' . $row['payment_status'] . '</span></td>
        <td><span class="' . $statusClass . '">' . $displayStatus . '</span></td>
        <td>';
  
    if ($row['status'] === 'Pending' && $row['payment_status'] === 'Chưa thanh toán') {
        echo '<div class="btn-group" role="group">
                <form action="cancel_order.php" method="POST" class="d-inline" 
                      onsubmit="return confirm(\'Bạn có chắc chắn muốn hủy đơn hàng này không?\')">
                    <input type="hidden" name="order_id" value="' . $row['id'] . '">
                    <button type="submit" class="btn btn-danger btn-sm">
                        <i class="fas fa-times-circle"></i> Hủy
                    </button>
                </form>
                <a href="order_detail.php?id=' . $row['id'] . '" class="btn btn-info btn-sm ms-1">
                    <i class="fas fa-info-circle"></i> Chi tiết
                </a>
              </div>';
    } else {
        echo '<a href="order_detail.php?id=' . $row['id'] . '" class="btn btn-info btn-sm">
                <i class="fas fa-info-circle"></i> Chi tiết
              </a>';
    }
    echo '</td>
    </tr>';
}

if ($result->num_rows == 0) {
    echo '<tr><td colspan="10" class="text-center">Bạn chưa có đơn hàng nào</td></tr>';
}

echo '
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>';

$stmt->close();
$db->close();

_footer();
?>
