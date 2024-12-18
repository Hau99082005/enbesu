-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 18, 2024 at 04:30 AM
-- Server version: 8.0.30
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `enbesu`
--

-- --------------------------------------------------------

--
-- Table structure for table `article`
--

CREATE TABLE `article` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `paragraph` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_article` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baigioithieu`
--

CREATE TABLE `baigioithieu` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pagraph` text COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `baiviet`
--

CREATE TABLE `baiviet` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pagraph` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_blog` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `banner`
--

CREATE TABLE `banner` (
  `id` int NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `banner`
--

INSERT INTO `banner` (`id`, `image`) VALUES
(1, 'Banner 01.jpg'),
(8, 'banner10.jpg'),
(9, 'banner1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `blog`
--

CREATE TABLE `blog` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pagaph` text COLLATE utf8mb4_general_ci NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Ngũ Cốc'),
(2, 'Hạt Dinh Dưỡng'),
(3, 'Mứt - Trái Cây Sấy');

-- --------------------------------------------------------

--
-- Table structure for table `categories_items`
--

CREATE TABLE `categories_items` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `contacts`
--

CREATE TABLE `contacts` (
  `id` int NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `message` text COLLATE utf8mb4_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `dangky`
--

CREATE TABLE `dangky` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dangky`
--

INSERT INTO `dangky` (`id`, `image`) VALUES
(1, 'đăng nhập.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `dangnhap`
--

CREATE TABLE `dangnhap` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dangnhap`
--

INSERT INTO `dangnhap` (`id`, `image`) VALUES
(1, 'đăng nhập.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `haianh`
--

CREATE TABLE `haianh` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `haianh`
--

INSERT INTO `haianh` (`id`, `image`) VALUES
(1, 'banner5.jpg'),
(2, 'banner4.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `info`
--

CREATE TABLE `info` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `price` decimal(10,3) NOT NULL,
  `price_old` decimal(10,3) NOT NULL,
  `pagraph` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_info` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `info`
--

INSERT INTO `info` (`id`, `image`, `name`, `price`, `price_old`, `pagraph`, `id_info`, `status`) VALUES
(1, '02 NCDD.jpg', 'Ngũ Cốc Dinh Dưỡng', '105.000', '120.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Thành phần:</b>\r\n<br>\r\n Óc chó đỏ, óc cho vàng, mắc ca, hạnh nhân, hạt điều, yến mạch, hạt sen, hạt mè,\r\ngạo lứt huyết rồng, đậu đỏ, đậu nành, đậu ngự, đậu trắng, đậu xanh, đậu đen xanh lòng.\r\n<br>\r\n<br>\r\n<b>Công Dụng:</b>\r\n<br>\r\n - Giàu chất xơ, protein và khoáng chất thiết yếu.\r\n<br> \r\n - Tăng sức đề kháng nhờ nguồn vitamin dồi dào.\r\n <br>\r\n - Cung cấp dinh dưỡng thiết yếu cho cơ thể.\r\n <br>\r\n - Thúc đẩy phát triển toàn diện ở trẻ em.\r\n<br> \r\n - Đặc biệt tốt đối với trẻ nhỏ, người lớn tuổi phụ nữ mang thai,\r\nngười suy dinh dưỡng, người bị bệnh tiểu đường hoặc tim mạch.\r\n<br><br>\r\n\r\n<b>Cách Dùng:</b>\r\n<br>\r\n - Cho 20-30g (2-3 muỗng) bột Ngũ Cốc Dinh Dưỡng vào ly, \r\nthêm đường hoặc sữa trộn đều cùng một ít nước ấm. \r\n <br>\r\n - Sau đó:\r\n<br>\r\n - Uống nóng: pha với 250ml nước sôi.\r\n<br>\r\n - Uống lạnh : pha với 100ml nước sôi, để nguội và thêm đá.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\n Nơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 82, 1),
(8, '01 NCTC.jpg', 'Ngũ Cốc Tăng Cân', '105.000', '120.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Thành phần:</b>\r\n<br>\r\n Óc chó đỏ, óc cho vàng, mắc ca, hạnh nhân, hạt điều, yến mạch, hạt sen, hạt mè,\r\ngạo lứt huyết rồng, đậu đỏ, đậu nành, đậu ngự, đậu trắng, đậu xanh, đậu đen xanh lòng.\r\n<br>\r\n<br>\r\n<b>Công Dụng:</b>\r\n<br>\r\n - Cung cấp lượng calo cao để hỗ trợ quá trình tăng cân hiệu quả.\r\n<br> \r\n - Sản phẩm bổ sung protein chất lượng, giúp phát triển cơ bắp,\r\nđồng thời cung cấp vitamin và khoáng chất thiết yếu cho cơ thể.\r\n<br> \r\n - Đặc biệt, Ngũ Cốc Tăng Cân còn chứa lượng chất xơ phong phú,\r\ngiúp hỗ trợ tiêu hoá hoạt động ổn định, giúp cơ thể hấp thu chất\r\ndinh dưỡng tốt hơn.\r\n<br>\r\n - Ngoài ra, sản phẩm dễ dàng được sử dụng\r\nnhờ tính tiện lợi để bổ sung năng lượng nhanh chóng.\r\n<br>\r\n<br>\r\n<b>Cách Dùng:</b> \r\n<br>\r\n - Cho 20-30g (2-3 muỗng) bột Ngũ Cốc Tăng Cân vào ly, \r\nthêm đường hoặc sữa trộn đều cùng một ít nước ấm. \r\n<br> \r\n Sau đó:\r\n<br>\r\n  - Uống nóng: pha với 250ml nước sôi.\r\n<br>\r\n  - Uống lạnh : pha với 100ml nước sôi, để nguội và thêm đá.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\n Nơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 83, 1),
(9, '03 NCLS.jpg', 'Ngũ Cốc Lợi Sữa', '105.000', '120.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Thành phần:</b>\r\n<br>\r\n- Óc chó đỏ, óc cho vàng, mắc ca, hạnh nhân, hạt điều, yến mạch, hạt sen, hạt mè,\r\ngạo lứt huyết rồng, đậu đỏ, đậu nành, đậu ngự, đậu trắng, đậu xanh, đậu đen xanh lòng.\r\n<br>\r\n<br>\r\n<b>Công Dụng:</b>\r\n<br>\r\n - Giúp phụ nữ mang thai, sau sinh gia tăng nguồn\r\nsữa tự nhiên, đồng thời bổ sung vitamin, khoáng \r\nchất và chất xơ cần thiết cho sức khỏe tổng thể. \r\n<br> \r\n - Với hương vị thơm ngon và dinh dưỡng vượt trội, \r\nsản phẩm hỗ trợ mẹ khỏe mạnh hơn và đảm bảo\r\nbé yêu được cung cấp nguồn sữa dồi dào và chất lượng. \r\n<br>\r\n<br>\r\n<b>Cách Dùng:</b> \r\n <br>\r\n- Cho 20-30g (2-3 muỗng) bột Ngũ Cốc Lợi Sữa vào ly, \r\nthêm đường hoặc sữa trộn đều cùng một ít nước ấm. \r\n<br> Sau đó:\r\n<br>\r\n- Uống nóng: pha với 250ml nước sôi.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\n Nơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 84, 1),
(10, '04 NCKDN.jpg', 'Ngũ Cốc Không Đậu Nành', '105.000', '120.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Thành phần:</b>\r\n<br>\r\n - Óc chó đỏ, óc cho vàng, mắc ca, hạnh nhân, hạt điều, yến mạch, hạt sen, hạt mè,\r\ngạo lứt huyết rồng, đậu đỏ, đậu ngự, đậu trắng, đậu xanh, đậu đen xanh lòng.\r\n<br>\r\n<br>\r\n<b>Công Dụng:</b>\r\n<br>\r\n - Giàu chất xơ, protein và khoáng chất thiết yếu.\r\n<br>\r\n - Tăng sức đề kháng nhờ nguồn vitamin dồi dào.\r\n<br>\r\n - Cung cấp dinh dưỡng thiết yếu cho cơ thể.\r\n<br>\r\n - Thúc đẩy phát triển toàn diện ở trẻ em.\r\n<br>\r\n - Phù hợp với người dị ứng đậu nành, không \r\nmuốn bổ sung đậu nành vào chế độ dinh dưỡng. \r\n<br>\r\n<br>\r\n<b>Cách Dùng:</b> \r\n<br>\r\n- Cho 20-30g (2-3 muỗng) bột Ngũ Cốc Không Đậu Nành vào ly, \r\nthêm đường hoặc sữa trộn đều cùng một ít nước ấm. \r\n<br>\r\nSau đó:\r\n<br>\r\n- Uống nóng: pha với 250ml nước sôi.\r\n<br>\r\n- Uống lạnh : pha với 100ml nước sôi, để nguội và thêm đá.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 85, 1),
(11, '05 HDRM.jpg', 'Hạt Điều Rang Muối', '143.000', '165.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\nHạt điều rang muối Enbesu size A Cồ, dễ tróc vỏ, có hương vị đậm đà, giòn tan, thơm ngon và đặc biệt \r\nkhông sử dụng chất bảo quản hay phẩm màu nhân tạo,\r\ngiúp đảm bảo sức khỏe cho người dùng.\r\n<br>\r\nSản phẩm được đóng túi zip hút chân không, tiện lợi,\r\ncó thể dùng như một loại snack vừa cung cấp thêm năng lượng \r\nvà dưỡng chất tốt cho một ngày làm việc hoặc một buổi tập luyện.\r\n<br>\r\n<br>\r\n<b>Thành phần:</b>\r\n<br>\r\nHạt Điều : 99.5%\r\n<br>\r\nMuối I-ốt:  0.5%\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 86, 1),
(12, '06 HDXH.jpg', 'Hạt Điều Xếp Hoa', '105.000', '135.000', '<b>Khối Lượng:</b> 500 gram\r\n<br><br>\r\nHạt điều rang muối Enbesu size A Cồ, dễ tróc vỏ, có hương vị đậm đà, giòn tan, thơm ngon\r\n<br>\r\nĐặc Biệt không sử dụng chất bảo quản hay phẩm màu nhân tạo, giúp đảm bảo sức khỏe cho người dùng.\r\n<br>\r\nSản phẩm được xếp hoa, đóng hộp\r\n<span style=\"color: red; font-weight: bold;\">Chúc Mừng Năm Mới 2025</span>\r\nvừa để sử dụng, vừa để làm quà tết biếu tặng, trưng bày đầy ý nghĩa\r\n<br><br>\r\n<b>Thành phần:</b>\r\n<br>\r\nHạt Điều : 99.5%\r\n<br>\r\nMuối I-ốt: 0.5%\r\n<br><br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br><br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br><br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br><br>\r\n<b>\r\n<span style=\"color: red; font-weight: bold;\">\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br><br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 87, 1),
(13, '07 HDSNV.jpg', 'Hạt Điều Sấy Nguyên Vị', '154.000', '180.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\nHạt điều sấy nguyên vị Enbesu, có hương vị nguyên bản, giòn tan, thơm ngon\r\n<br>\r\nĐặc biệt không sử dụng chất bảo quản hay phẩm màu nhân tạo,\r\ngiúp đảm bảo sức khỏe cho người dùng.\r\n<br>\r\nSản phẩm được đóng hộp \r\n<span style=\"color: red; font-weight: bold;\">Chúc Mừng Năm Mới 2025</span>\r\nvừa để sử dụng, vừa để làm quà tết biếu tặng, trưng bày đầy ý nghĩa<br>\r\n<br>\r\n<b>Thành phần:</b>\r\n<br>\r\nHạt Điều : 99.5%\r\n<br>\r\nMuối I-ốt:  0.5%\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 88, 1),
(14, '08 HMCT.jpg', 'Hạt Mắc Ca Trung', '120.000', '140.000', '<b>Hạt Mắc Ca Đắk Lắk, Size Trung \" 22-27mm\"</b>\r\n<br>\r\n<br>\r\n<b>Nguồn nguyên liệu tiêu chuẩn:</b>\r\n<br>\r\nĐáp ứng tiêu chí Mắc Ca sạch, hạt chuẩn già để có thành phẩm thơm ngon và giữ được dinh dưỡng trong từng hạt.\r\n<br>\r\nChọn hạt bằng quy trình thủ công, soi từng hạt để đảm bảo hạt già đều, không sâu non, loại bỏ 99% hạt kém chất lượng.\r\n<br>\r\nSử dụng phương pháp sấy lạnh khép kín, cho chất lượng đồng đều, \r\n<br>\r\nTránh được tình trạng hôi dầu.\r\n<br>\r\nHạt mới thu hoạch trong năm, nói không với hạt cũ,\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 89, 1),
(15, '09 HMCD.jpg', 'Hạt Mắc Ca Đại', '134.000', '150.000', '<b>Hạt Mắc Ca Đắk Lắk, Size Đại \" 27-34mm \"</b>\r\n<br>\r\n<br>\r\n<b>Nguồn nguyên liệu tiêu chuẩn:</b>\r\n<br>\r\nĐáp ứng tiêu chí Mắc Ca sạch, hạt chuẩn già để có thành phẩm thơm ngon và giữ được dinh dưỡng trong từng hạt.\r\n<br>\r\nChọn hạt bằng quy trình thủ công, soi từng hạt để đảm bảo hạt già đều, không sâu non, loại bỏ 99% hạt kém chất lượng.\r\n<br>\r\nSử dụng phương pháp sấy lạnh khép kín, cho chất lượng đồng đều, \r\n<br>\r\nTránh được tình trạng hôi dầu.\r\n<br>\r\nHạt mới thu hoạch trong năm, nói không với hạt cũ,\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 90, 1),
(16, '10 HNRB.jpg', 'Hạnh Nhân Rang Bơ', '129.000', '155.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\n<span style=\"color: red; font-weight: bold;\"> Vỏ Mỏng, Mùi Thơm, Vị Đậm Đà </span>\r\n<br>\r\n<br>\r\nHạnh nhân Mỹ rang bơ Enbesu có thiết kế bao bì đẹp mắt, tiện lợi,\r\nphù hợp làm thức ăn vặt tốt cho sức khỏe, giữ dáng, đẹp da, \r\nphù hợp mang theo khi đi du lịch, quà tặng cho những người thân yêu.\r\n<br>\r\n<br>\r\n<b>Xuất Xứ:</b> chính ngạch Mỹ\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 12 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 91, 1),
(17, '11 GRNL 100.jpg', 'Granola 100%', '156.000', '180.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Ngũ Cốc Nguyên Hạt Granola 100% </b>( Siêu Hạt)\r\n<br>\r\n<br>\r\n<b>Thành Phần:</b>\r\n<br>\r\nHạnh nhân, bí xanh, hạt điều, nhân óc chó, nho, nam việt quất, xoài, mật ong.\r\n<br>\r\n<br>\r\n<b>Hướng Dẫn Sử Dụng:</b>\r\n<br>\r\nDùng trực tiếp, ngon hơn khi kết hợp cùng sữa chua.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\n Nơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 92, 1),
(18, '12 GRNL 85.jpg', 'Granola 85%', '149.000', '170.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Ngũ Cốc Nguyên Hạt Granola 85% </b> (15% yến mạch)\r\n<br>\r\n<br>\r\n<b>Thành Phần:</b>\r\n<br>\r\nHạnh nhân, bí xanh, hạt điều, nhân óc chó, nho, nam việt quất, xoài, yến mạch, mật ong.\r\n<br>\r\n<br>\r\n<b>Hướng Dẫn Sử Dụng:</b>\r\n<br>\r\nDùng trực tiếp, ngon hơn khi kết hợp cùng sữa chua.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\n Nơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 93, 1),
(19, '13 GRNL 70.jpg', 'Granola 70%', '138.000', '155.000', '<b>Khối Lượng:</b> 500 gram\r\n<br>\r\n<br>\r\n<b>Ngũ Cốc Nguyên Hạt Granola 70% </b> (30% yến mạch)\r\n<br>\r\n<br>\r\n<b>Thành Phần:</b>\r\n<br>\r\nHạnh nhân, bí xanh, hạt điều, nhân óc chó, nho, nam việt quất, xoài, yến mạch, mật ong.\r\n<br>\r\n<br>\r\n<b>Hướng Dẫn Sử Dụng:</b>\r\n<br>\r\nDùng trực tiếp, ngon hơn khi kết hợp cùng sữa chua.\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\n Nơi thoáng mát, tránh ánh nắng trực tiếp.\r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 94, 1),
(20, '14 CLRM.jpg', 'Chà Là Rời Mật', '86.000', '100.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nChà Là rời mật tự nhiên quả dẻo và thơm ngọt chứa Nhiều Vitamin, khoáng chất.\r\n<br>Quả chà là rời mật được biết đến như một món ăn nhẹ có giá trị dinh dưỡng cao\r\n<br>và có tác dụng tốt đối với sức khỏe. Lượng đường ( glucide) trong quả chà là chiếm tới 64 – 69%, \r\nchúng gấp 3 – 5 lần lượng đường có trong các loại hoa quả tươi.\r\n<br>Với hàm lượng glucose cao, chà là có tác dụng nhanh chóng xua tan mệt mỏi \r\nđối với người lao động trí óc và chân tay, \r\nvận động viên, giáo viên, học sinh,\r\n<br>Sử dụng chà là như một món ăn nhẹ hay ăn kèm món tráng miệng sẽ giúp cân bằng năng lượng hàng ngày.\r\n<br><br>\r\n<b>Xuất Xứ:</b> Iran\r\n<br><br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\nHạn Sử Dụng: 06 tháng.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 95, 1),
(21, '15 HDC.jpg', 'Hạt Dẻ Cười', '198.000', '225.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nHạt dẻ cười được xem là loại hạt giàu chất dinh dưỡng\r\n<br>Ít muối sấy khô với hương vị độc đáo, hạt đều, nhân đầy, thơm ngon,\r\n<br>được chế biến theo quy trình công nghệ cao,\r\nđảm bảo vệ sinh an toàn thực phẩm theo tiêu chuẩn của Mỹ\r\n<br>\r\n<br>\r\nHạt dẻ cười cung cấp rất nhiều lợi ích cho sức khỏe được đóng hũ tiện dụng,\r\nthuận lợi mang theo mỗi khi đi xa hay dành làm quà tặng cho người thân trong những dịp lễ\r\n<br>\r\n<br>\r\n<b>Xuất Xứ:</b> chính ngạch Mỹ\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 12 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở túi.\r\n<br>\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 96, 1),
(22, '16 N3M.jpg', 'Nho 3 Màu Sấy', '82.000', '95.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nNho 3 màu là một món ăn ngon miệng và tốt cho sức khỏe,\r\n<br>được lựa chọn từ những quả nho không hạt tươi ngon với 3 loại nho đen, đỏ, vàng,\r\n<br>ở những khu vườn nho hữu cơ lớn tại Chile, được chứng nhận là giống nho chất lượng, chứa hàm lượng giá trị dinh dưỡng cao.\r\n<br>Quy trình chế biến đảm bảo vệ sinh an toàn thực phẩm, không chứa thêm các phụ gia hay chất bảo quản độc hại ảnh hưởng đến sức khỏe người dùng.\r\n<br><br>\r\n<b>Xuất Xứ:</b> Chile\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 97, 1),
(23, '17 NV.jpg', 'Nho Vàng Sấy', '72.000', '85.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nNho vàng Mỹ được sấy từ trái nho vàng tươi, bằng công nghệ hiện đại để đảm bảo giữ được màu sắc cũng như giá trị dinh dưỡng của sản phẩm.\r\n<br>Thông thường, các loại trái cây sấy sẽ có vị ngọt đậm hơn so với trái cây tươi. \r\n<br>Nho khô vàng cũng vậy, sản phẩm có vị ngọt đậm đà, không có vị chua hay chát như các loại nho khác.\r\n<br>Nho khô vàng không có hạt, thịt dày, ăn dẻo.\r\n<br><br>\r\n<b>Xuất Xứ:</b> Mỹ\r\n<br>\r\n<br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 98, 1),
(24, '18 XDCN.jpg', 'Xoài Dẻo Chua Ngọt', '95.000', '110.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nXoài sấy dẻo chua ngọt sử dụng phương pháp sấy lạnh nên có vị ngọt thanh, chua nhẹ cũng như hương vị đặc trưng của trái xoài tươi.\r\n<br>Xoài sấy không quá khô, dẻo dẻo, dai dai, vẫn giữ đc màu vàng tự nhiên của trái xoài, không có chất bảo quản nào khác.\r\n<br>Đảm bảo đạt tiêu chuẩn an toàn vệ sinh thực phẩm, mà còn giữ nguyên độ ẩm, dưỡng chất của trái cây tự nhiên.\r\n<br><br>\r\n<b>Xuất Xứ:</b> Việt Nam\r\n<br><br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 99, 1),
(25, '19 XDMO.jpg', 'Xoài Dẻo Muối Ớt', '100.000', '115.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nXoài sấy dẻo muối ớt sử dụng phương pháp sấy lạnh kết hợp tẩm muối ớt, nên có vị ngọt thanh, chua nhẹ kết hợp cùng vị mặn - cay của muối - ớt.\r\n<br>Sản phẩm không quá khô, dẻo dẻo, dai dai, vẫn giữ đc màu vàng tự nhiên của trái xoài, không có chất bảo quản nào khác.\r\n<br>Đảm bảo đạt tiêu chuẩn an toàn vệ sinh thực phẩm, mà còn giữ nguyên độ ẩm, dưỡng chất của trái cây tự nhiên.\r\n<br><br>\r\n<b>Xuất Xứ:</b> Việt Nam\r\n<br><br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 06 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 100, 1),
(26, '20 HDM.jpg', 'Hướng Dương Mộc', '61.000', '70.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nHướng Dương rang mộc có Lớp vỏ đẹp mắt, căng đầy, có độ mẩy, hạt hướng dương bên trong không bị vỡ, sứt mẻ.\r\n<br>\r\nHương vị nguyên bản, 100% tự nhiên.\r\n<br>\r\nGiòn tan, thơm béo, giàu dinh dưỡng.\r\n<br>\r\n<br>\r\n<b>Xuất Xứ:</b> Việt Nam\r\n<br><br>\r\n<b>Hạn Sử Dụng:</b> 12 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 101, 1),
(27, '21 HDD.jpg', 'Hướng Dương Vị Dừa', '63.000', '70.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nHướng Dương vị dừa có Lớp vỏ đẹp mắt, căng đầy, có độ mẩy, hạt hướng dương bên trong không bị vỡ, sứt mẻ.\r\n<br>\r\nHương vị dừa, 100% tự nhiên.\r\n<br>\r\nGiòn tan, thơm béo, giàu dinh dưỡng.\r\n<br>\r\n<br>\r\n<b>Xuất Xứ:</b> Việt Nam\r\n<br><br>\r\n<b>Hạn Sử Dụng:</b> 12 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 102, 1),
(28, '22 CCDL.jpg', 'Bột Ca Cao Đắc Lắk', '182.000', '200.000', '<b>Khối Lượng:</b> 500 gram.\r\n<br>\r\n<br>\r\nBột cacao nguyên chất 100%, không trộn đường, sữa hay bất kỳ hương liệu nào\r\nsẽ là lựa chọn tuyệt hảo nhất để bạn có thể thưởng thức trọn vẹn một tách cacao đúng vị.\r\n<br>Thơm nồng, đắng, hơi béo và chút dư âm chua nhẹ.\r\n<br>Đối với những tín đồ yêu thích cacao nguyên chất và đặc biệt trong chế độ ăn kiêng, người bệnh tiểu đường thì sản phẩm bột cacao nguyên chất Enbesu hoàn toàn an tâm sử dụng.\r\n<br>Điều đặc biệt trong sản phẩm của Enbesu\r\n<br> bột cacao nguyên chất giàu bơ cacao – tỷ lệ bơ cacao còn lại 18%. \r\n<br>Vậy nên tách cacao của bạn khi pha sẽ có mùi thơm dịu rất dễ chịu. Khác hoàn toàn so với các loại bột cacao giá rẻ hiện nay trên thị trường.\r\n<br><br>\r\n<b>Xuất Xứ:</b> Việt Nam\r\n<br><br>\r\n<b>Bảo Quản:</b>\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\n<b>Hạn Sử Dụng:</b> 12 tháng.\r\n<br>\r\nSử dụng trong vòng 30 ngày sau khi mở nắp.\r\n<br>\r\n<b>Thông tin cảnh báo:</b>\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng.\r\n<br>\r\n<br>\r\n<b>\r\n<span style=\"color: red;\"\r\n<br>\r\nCAM KẾT CHỈ BÁN HÀNG CHẤT LƯỢNG.\r\n<br>\r\nCAM KẾT BAO ĐỔI TRẢ.\r\n<br>\r\nCHO KIỂM TRA HÀNG TRƯỚC KHI THANH TOÁN.\r\n</span>\r\n</b>\r\n<br>\r\n<br>\r\n<b>CN ĐKKD Số:</b> 40A8032106\r\n<br>\r\n<b>CN ĐK ATTP Số:</b> 12/2022/NNPTNT-ĐL\r\n<br>\r\n<b>Địa Chỉ:</b> Thôn 3, Hòa Phú, Buôn Ma Thuột, Đắk Lắk.', 103, 1),
(29, '24 MSG-500.jpg', 'Mít Sấy Giòn - 500G', '125.000', '175.000', 'Khối Lượng: 500 gram.\r\n<br>\r\n<br>\r\nSử dụng phương pháp sấy Thăng Hoa, giúp sản phẩm giữ trọn chất dinh dưỡng và mùi vị vốn có của quả Mít\r\n<br>\r\nĐược tuyển chọn từ những quả Mít to, chín già, đạt chất lượng xuất khẩu\r\n<br>\r\n<br>\r\nBảo Quản:\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\nHạn Sử Dụng: 06 tháng.\r\n<br>\r\n<br>\r\nThông tin cảnh báo:\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng', 128, 1),
(30, '23 MSG-200.jpg', 'Mít Sấy Giòn - 200G', '57.000', '80.000', 'Khối Lượng: 200 gram.\r\n<br>\r\n<br>\r\nSử dụng phương pháp sấy Thăng Hoa, giúp sản phẩm giữ trọn chất dinh dưỡng và mùi vị vốn có của quả Mít\r\n<br>\r\nĐược tuyển chọn từ những quả Mít to, chín già, đạt chất lượng xuất khẩu\r\n<br>\r\n<br>\r\nBảo Quản:\r\n<br>\r\nNơi thoáng mát, tránh ánh nắng trực tiếp.  \r\n<br>\r\n<br>\r\nHạn Sử Dụng: 06 tháng.\r\n<br>\r\n<br>\r\nThông tin cảnh báo:\r\n<br>\r\nKhông sử dụng sản phẩm khi bị ẩm mốc hoặc hết hạn sử dụng', 129, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int NOT NULL,
  `customer_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `customer_phone` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `customer_address` text COLLATE utf8mb4_general_ci NOT NULL,
  `note` text COLLATE utf8mb4_general_ci,
  `total_amount` decimal(10,3) NOT NULL,
  `status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_id` int NOT NULL,
  `payment_method` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'COD',
  `payment_status` varchar(50) COLLATE utf8mb4_general_ci DEFAULT 'Chưa thanh toán'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `customer_name`, `customer_phone`, `customer_address`, `note`, `total_amount`, `status`, `created_at`, `user_id`, `payment_method`, `payment_status`) VALUES
(124, 'NGUYỄN PHƯƠNG ĐÔNG', '0369287898', 'CÔNG TY TNHH TÔN NAM KIM PHÚ MỸ', 'GIAO TẠI NKPM', '84000.000', 'Pending', '2024-11-30 04:08:04', 1, 'COD', 'Chưa thanh toán'),
(132, 'Okvip', '0366983678', 'Okvip', 'Okvip', '344000.000', 'Pending', '2024-12-09 15:29:52', 1, 'COD', 'Chưa thanh toán'),
(141, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '105000.000', 'Cancelled', '2024-12-17 16:01:24', 16, 'COD', 'Chưa thanh toán'),
(142, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '105000.000', 'Cancelled', '2024-12-18 01:58:35', 16, 'COD', 'Chưa thanh toán'),
(143, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '366000.000', 'Cancelled', '2024-12-18 02:08:44', 16, 'COD', 'Chưa thanh toán'),
(149, 'Phùng Hữu Long', '0382333246', 'Chưa cập nhật địa chỉ', NULL, '105000.000', 'Cancelled', '2024-12-18 02:53:09', 16, 'COD', 'Chưa thanh toán'),
(150, 'Phùng Hữu Long', '0382333246', 'Chưa cập nhật địa chỉ', NULL, '105000.000', 'Cancelled', '2024-12-18 02:53:49', 16, 'COD', 'Chưa thanh toán'),
(151, 'Phùng Hữu Long', '0382333246', 'Chưa cập nhật địa chỉ', NULL, '105000.000', 'Cancelled', '2024-12-18 03:01:21', 16, 'COD', 'Chưa thanh toán'),
(152, 'Phùng Hữu Long', '0382333246', 'Chưa cập nhật địa chỉ', NULL, '105000.000', 'Processing', '2024-12-18 03:05:18', 16, 'COD', 'Chưa thanh toán'),
(153, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '210000.000', 'Cancelled', '2024-12-18 03:16:33', 16, 'COD', 'Chưa thanh toán'),
(154, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '210000.000', 'Cancelled', '2024-12-18 03:17:30', 16, 'COD', 'Chưa thanh toán'),
(155, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '210000.000', 'Cancelled', '2024-12-18 03:17:41', 16, 'COD', 'Chưa thanh toán'),
(156, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '359000.000', 'Cancelled', '2024-12-18 03:18:00', 16, 'COD', 'Chưa thanh toán'),
(157, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '508000.000', 'Cancelled', '2024-12-18 03:28:03', 16, 'COD', 'Chưa thanh toán'),
(158, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '508000.000', 'Cancelled', '2024-12-18 03:33:23', 16, 'COD', 'Chưa thanh toán'),
(159, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '508000.000', 'Cancelled', '2024-12-18 03:33:29', 16, 'COD', 'Chưa thanh toán'),
(160, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '508000.000', 'Cancelled', '2024-12-18 03:35:17', 16, 'COD', 'Chưa thanh toán'),
(161, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '508000.000', 'Cancelled', '2024-12-18 03:40:19', 16, 'COD', 'Chưa thanh toán'),
(162, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '657000.000', 'Processing', '2024-12-18 03:59:40', 16, 'MoMo', 'Đã thanh toán'),
(163, 'Phùng Hữu Long', '0382333246', '427 Nguyễn Tất Thành', '', '105000.000', 'Pending', '2024-12-18 04:14:08', 16, 'COD', 'Chưa thanh toán');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int NOT NULL,
  `order_id` int NOT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `quantity`, `price`) VALUES
(121, 124, 100, 1, '84.000'),
(132, 132, 129, 1, '57.000'),
(133, 132, 103, 1, '182.000'),
(134, 132, 83, 1, '105.000'),
(151, 141, 83, 1, '105.000'),
(152, 142, 83, 1, '105.000'),
(153, 143, 83, 2, '105.000'),
(154, 143, 92, 1, '156.000');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `image` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `price` decimal(10,3) NOT NULL DEFAULT '0.000',
  `price_old` decimal(10,3) NOT NULL,
  `quantity` int NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `id_category` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `image`, `price`, `price_old`, `quantity`, `status`, `id_category`) VALUES
(82, 'Ngũ Cốc Dinh Dưỡng', '02 NCDD.jpg', '105.000', '120.000', 0, 1, 1),
(83, 'Ngũ Cốc Tăng Cân', '01 NCTC.jpg', '105.000', '120.000', 0, 1, 1),
(84, 'Ngũ Cốc Lợi Sữa', '03 NCLS.jpg', '105.000', '120.000', 0, 1, 1),
(85, 'Ngũ Cốc Không Đậu Nành', '04 NCKDN.jpg', '105.000', '120.000', 0, 1, 1),
(86, 'Hạt Điều Rang Muối', '05 HDRM.jpg', '143.000', '165.000', 0, 1, 2),
(87, 'Hạt Điều Xếp Hoa', '06 HDXH.jpg', '105.000', '135.000', 0, 1, 2),
(88, 'Hạt Điều Sấy Nguyên Vị', '07 HDSNV.jpg', '154.000', '180.000', 0, 1, 2),
(89, 'Hạt Mắc Ca Trung', '08 HMCT.jpg', '120.000', '140.000', 0, 1, 2),
(90, 'Hạt Mắc Ca Đại', '09 HMCD.jpg', '134.000', '150.000', 0, 1, 2),
(91, 'Hạnh Nhân Rang Bơ', '10 HNRB.jpg', '129.000', '155.000', 0, 1, 2),
(92, 'Granola 100%', '11 GRNL 100.jpg', '156.000', '180.000', 0, 1, 1),
(93, 'Granola 85%', '12 GRNL 85.jpg', '149.000', '170.000', 0, 1, 1),
(94, 'Granola 70%', '13 GRNL 70.jpg', '138.000', '155.000', 0, 1, 1),
(95, 'Chà Là Rời Mật', '14 CLRM.jpg', '86.000', '100.000', 0, 1, 3),
(96, 'Hạt Dẻ Cười', '15 HDC.jpg', '198.000', '225.000', 0, 1, 2),
(97, 'Nho 3 Màu Sấy', '16 N3M.jpg', '82.000', '95.000', 0, 1, 3),
(98, 'Nho Vàng Sấy', '17 NV.jpg', '72.000', '85.000', 0, 1, 3),
(99, 'Xoài Dẻo Chua Ngọt', '18 XDCN.jpg', '95.000', '110.000', 0, 1, 3),
(100, 'Xoài Dẻo Muối Ớt', '19 XDMO.jpg', '100.000', '115.000', 0, 1, 3),
(101, 'Hướng Dương Mộc', '20 HDM.jpg', '61.000', '70.000', 0, 1, 2),
(102, 'Hướng Dương Vị Dừa', '21 HDD.jpg', '63.000', '70.000', 0, 1, 2),
(103, 'Bột Ca Cao Đắc Lắk', '22 CCDL.jpg', '182.000', '200.000', 0, 1, 2),
(128, 'Mít Sấy Giòn - 500G', '23 MSG-200.jpg', '125.000', '150.000', 0, 1, 3),
(129, 'Mít Sấy Giòn - 200G', '24 MSG-500.jpg', '57.000', '68.000', 0, 1, 3);

-- --------------------------------------------------------

--
-- Table structure for table `the`
--

CREATE TABLE `the` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pagraph` text COLLATE utf8mb4_general_ci NOT NULL,
  `id_the` int DEFAULT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `the`
--

INSERT INTO `the` (`id`, `image`, `title`, `pagraph`, `id_the`, `status`) VALUES
(1, '', 'Chính sách thẻ thành viên Enbesu', 'Hiện tại, Enbesu đang lưu hành 2 loại thẻ “Thẻ Member và Thẻ VIP”, được quy định như sau:', 1, 1),
(2, '', 'THẺ MEMBER', '– Được tích điểm 2% trên mỗi hóa đơn mua hàng\r\n– Được sử dụng điểm để thanh toán trực tiếp tại cửa hàng\r\n– Áp dụng tiêu điểm trên các cửa hàng có biển hiệu Enbesu member\r\n– Được hưởng các chương trình ưu đãi khác theo chính sách của công ty\r\n– Điều kiện mở thẻ: khi hóa đơn mua hàng từ 500k', 1, 1),
(3, '', ' THẺ VIP', '– Được tích điểm 5% trên mỗi hóa đơn mua hàng\r\n– Được hưởng mọi quyền lợi như thẻ member\r\n– Điều kiện mở thẻ\r\n+ Với các khách hàng cũ: Tổng giá trị giao dịch từ tháng 3/2018- tháng 3/2019 phải đạt mức từ 50.000.000đ\r\n+ Với các khách hàng VIP trong thời gian tới: Tổng giá trị giao dịch trong 12 tháng phải đạt từ 50.000.000đ', 1, 1),
(4, '', 'QUY ĐỊNH SỬ DỤNG THẺ ', '1. Điểm trong thẻ không được quy đổi thành tiền mặt (1 điểm ~1000đ)\r\n2. Khi sử dụng thẻ, khách hàng xuất trình thẻ hoặc đọc số điện thoại cho nhân viên thu ngân khi thanh toán\r\n3. Thời hạn thẻ sử dụng trong vòng 1 năm\r\n4. Điều kiện duy trì thẻ: doanh thu tích luỹ trong vòng 1 năm tiếp theo phải đạt mức khách VIP theo quy định tại thời điểm đó của Enbesu\r\n', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `thethanhvien`
--

CREATE TABLE `thethanhvien` (
  `id` int NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `pagraph` text COLLATE utf8mb4_general_ci NOT NULL,
  `day` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `thethanhvien`
--

INSERT INTO `thethanhvien` (`id`, `image`, `title`, `pagraph`, `day`) VALUES
(1, 'đăng nhập.jpg', 'Chính sách thẻ thành viên enbesu', 'Hiện tại, enbesu đang lưu hành 2 loại thẻ “Thẻ Member và Thẻ VIP”, được quy định...', '2024-11-18');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int NOT NULL,
  `name` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `phone` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `role` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `password`, `role`) VALUES
(1, 'hau', '12345', '', 'admin'),
(9, 'Lê Hậu', '0367722389', 'Hau2005@', ''),
(10, 'Đặng Vinh Quang', '0359333635', '123', ''),
(11, '0369287898', '0369287898', 'scorpius92', ''),
(12, 'Quang', '0368929395', '123', ''),
(13, 'lê hậu', '0367722388', '123', ''),
(14, 'Thanh Hiền ', '0812160274', 'Hienyt276', ''),
(15, 'Okvip', '0366980764', '12345678', ''),
(16, 'Phùng Hữu Long', '0382333246', 'L@ng1998', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `article`
--
ALTER TABLE `article`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_article_baigioithieu` (`id_article`);

--
-- Indexes for table `baigioithieu`
--
ALTER TABLE `baigioithieu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_blog_baiviet` (`id_blog`);

--
-- Indexes for table `banner`
--
ALTER TABLE `banner`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `blog`
--
ALTER TABLE `blog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories_items`
--
ALTER TABLE `categories_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contacts`
--
ALTER TABLE `contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dangky`
--
ALTER TABLE `dangky`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dangnhap`
--
ALTER TABLE `dangnhap`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `haianh`
--
ALTER TABLE `haianh`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `info`
--
ALTER TABLE `info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_info_products` (`id_info`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_users_order` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_category` (`id_category`);

--
-- Indexes for table `the`
--
ALTER TABLE `the`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_the_thethanhvien` (`id_the`);

--
-- Indexes for table `thethanhvien`
--
ALTER TABLE `thethanhvien`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `article`
--
ALTER TABLE `article`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `baigioithieu`
--
ALTER TABLE `baigioithieu`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `baiviet`
--
ALTER TABLE `baiviet`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT for table `banner`
--
ALTER TABLE `banner`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `blog`
--
ALTER TABLE `blog`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `categories_items`
--
ALTER TABLE `categories_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `contacts`
--
ALTER TABLE `contacts`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `dangky`
--
ALTER TABLE `dangky`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dangnhap`
--
ALTER TABLE `dangnhap`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `haianh`
--
ALTER TABLE `haianh`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `info`
--
ALTER TABLE `info`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=164;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=155;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=130;

--
-- AUTO_INCREMENT for table `the`
--
ALTER TABLE `the`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `thethanhvien`
--
ALTER TABLE `thethanhvien`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_baigioithieu` FOREIGN KEY (`id_article`) REFERENCES `baigioithieu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `baiviet`
--
ALTER TABLE `baiviet`
  ADD CONSTRAINT `fk_blog_baiviet` FOREIGN KEY (`id_blog`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `info`
--
ALTER TABLE `info`
  ADD CONSTRAINT `fk_info_products` FOREIGN KEY (`id_info`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_users_order` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `fk_order_items_product` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`);

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_category`) REFERENCES `categories` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `the`
--
ALTER TABLE `the`
  ADD CONSTRAINT `fk_the_thethanhvien` FOREIGN KEY (`id_the`) REFERENCES `thethanhvien` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
