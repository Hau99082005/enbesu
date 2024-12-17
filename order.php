<?php
ob_start();
require_once 'inc/database.php';

$user_id = isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null;

if (!$user_id) {
    die('Vui lòng đăng nhập để xem đơn hàng.');
}

$db = Database::getConnection();
$query = "SELECT o.id, o.customer_name, o.customer_address, o.customer_phone, o.total_amount, o.created_at, o.status
          FROM orders o 
          WHERE o.user_id = ? 
          ORDER BY o.created_at DESC";

$stmt = $db->prepare($query);
$stmt->bind_param('i', $user_id);
$stmt->execute();
$result = $stmt->get_result();

echo '
<div class="container mt-5">
    <h2>Đơn hàng của tôi</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Mã đơn hàng</th>
                <th>Họ tên</th>
                <th>Địa chỉ</th>
                <th>Số điện thoại</th>
                <th>Tổng tiền</th>
                <th>Ngày đặt</th>
                <th>Trạng thái</th>
            </tr>
        </thead>
        <tbody>';

while ($row = $result->fetch_assoc()) {
    echo '
    <tr>
        <td>' . $row['id'] . '</td>
        <td>' . htmlspecialchars($row['customer_name']) . '</td>
        <td>' . htmlspecialchars($row['customer_address']) . '</td>
        <td>' . htmlspecialchars($row['customer_phone']) . '</td>
        <td>' . number_format($row['total_amount'], 0, ',', '.') . ' đ</td>
        <td>' . $row['created_at'] . '</td>
        <td>' . $row['status'] . '</td>
    </tr>';
}

echo '
        </tbody>
    </table>
</div>';

$stmt->close();
$db->close();
?>
