-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th5 14, 2024 lúc 12:31 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `do_an_2_1`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `address_history`
--

CREATE TABLE `address_history` (
  `id` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `province` varchar(255) NOT NULL,
  `district` varchar(255) NOT NULL,
  `town` varchar(255) NOT NULL,
  `place_detail` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6),
  `default` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `address_history`
--

INSERT INTO `address_history` (`id`, `id_user`, `province`, `district`, `town`, `place_detail`, `created_at`, `default`) VALUES
(1, 1, 'Thừa Thiên Huế', 'Phong Điền', 'Phong Sơn', 'Cổ Bi 3', '0000-00-00 00:00:00.000000', 0),
(2, 1, 'Tỉnh Lào Cai', 'Huyện Si Ma Cai', 'Xã Nàn Sán', ' ', '2024-05-13 20:27:29.215900', 0),
(3, 1, 'Tỉnh Lào Cai', 'Huyện Bắc Hà', 'Xã Nậm Mòn', ' sd', '2024-05-13 20:28:37.259565', 0),
(8, 16, 'Thành phố Đà Nẵng', 'Quận Ngũ Hành Sơn', 'Phường Hoà Quý', ' Vku', '2024-05-14 16:57:54.785963', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill_item`
--

CREATE TABLE `bill_item` (
  `id` int(255) NOT NULL,
  `id_address_receiver` int(255) NOT NULL,
  `price` int(30) NOT NULL,
  `is_payment` tinyint(1) NOT NULL DEFAULT 0,
  `is_vnpay` tinyint(1) NOT NULL,
  `time_pay` datetime(6) DEFAULT NULL,
  `created_at` datetime(6) NOT NULL DEFAULT current_timestamp(6)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `bill_item`
--

INSERT INTO `bill_item` (`id`, `id_address_receiver`, `price`, `is_payment`, `is_vnpay`, `time_pay`, `created_at`) VALUES
(6, 8, 240000, 0, 0, NULL, '2024-05-14 16:58:07.000000'),
(7, 8, 206000, 1, 1, NULL, '2024-05-14 16:58:56.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `id` int(255) NOT NULL,
  `id_item` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `amount` int(10) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `cart`
--

INSERT INTO `cart` (`id`, `id_item`, `id_user`, `amount`, `created_at`) VALUES
(22, 5, 2, 1, '2023-12-08 23:46:14.000000'),
(23, 24, 2, 1, '2023-12-09 13:24:19.000000'),
(24, 24, 2, 3, '2023-12-09 13:24:33.000000'),
(50, 32, 6, 1, '2024-05-12 14:58:08.000000'),
(56, 13, 1, 1, '2024-05-13 21:56:53.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `flash_sale`
--

CREATE TABLE `flash_sale` (
  `id` int(255) NOT NULL,
  `id_item` int(255) NOT NULL,
  `time_start` datetime(6) NOT NULL,
  `time_end` datetime(6) NOT NULL,
  `percent` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='1';

--
-- Đang đổ dữ liệu cho bảng `flash_sale`
--

INSERT INTO `flash_sale` (`id`, `id_item`, `time_start`, `time_end`, `percent`) VALUES
(1, 1, '2023-10-30 19:23:15.000000', '2024-11-20 19:23:15.000000', 30),
(2, 4, '2023-10-30 19:43:58.000000', '2024-07-18 19:43:58.000000', 50),
(3, 6, '2023-10-30 19:43:58.000000', '2024-06-27 19:43:58.000000', 40),
(4, 0, '2023-10-09 21:10:24.000000', '2024-07-18 21:10:24.000000', 60),
(5, 5, '2023-10-17 15:09:29.000000', '2024-05-29 15:09:29.000000', 25);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `item`
--

CREATE TABLE `item` (
  `id` int(255) NOT NULL,
  `id_shop` int(255) NOT NULL,
  `id_category` int(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `price` int(15) NOT NULL,
  `img` varchar(255) NOT NULL,
  `descrip` varchar(255) NOT NULL,
  `sold` int(10) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `item`
--

INSERT INTO `item` (`id`, `id_shop`, `id_category`, `name`, `price`, `img`, `descrip`, `sold`, `created_at`) VALUES
(1, 1, 2, 'Hủ Tiếu', 20000, 'https://45cm.s3.ap-southeast-1.amazonaws.com/images-ch/do-an-thuc-pham/mua-ban-do-an-thuc-pham/23/99298906/600/6bc106112124b0dffb54322a641aae4d-2791641722533958361.jpg', 'Hủ tiếu là một món ăn đặc sản của vùng Nam Bộ Việt Nam, được biết đến với hương vị đặc trưng và phong phú.', 1080, '2004-01-10 00:00:00.000000'),
(2, 1, 2, 'Bún Đậu', 35000, 'https://static.vinwonders.com/production/bun-dau-mam-tom-ha-noi-1.jpg', 'Bún đậu mắm tôm Hà Nội là món ăn dân dã, quen thuộc của người dân Thủ đô. Với hương vị đậm đà, hấp dẫn đặc trưng của mắm tôm, đậu, bún rau thơm cùng nhiều nguyên liệu khác, bún đậu đã trở thành món ăn “quốc dân”, được lòng cả du khách trong và ngoài nước.', 400, '2023-10-08 00:00:00.000000'),
(3, 1, 2, 'Bún Giò', 20000, 'https://vcdn-giadinh.vnecdn.net/2021/01/02/Anh-6-7105-1609558348.jpg', 'Món bún giò là một phần không thể thiếu trong ẩm thực Việt Nam, và có nhiều biến thể khác nhau tùy thuộc vào vùng miền và khẩu vị cá nhân.', 15741, '2023-09-04 00:00:00.000000'),
(4, 1, 2, 'Cơm Chiên', 40000, 'https://i.ytimg.com/vi/_cdBAMq5KZ0/maxresdefault.jpg', 'Cơm chiên dương châu đơn giản giòn ngon, nhìn bắt mắt, nhiều dinh dưỡng, mời các bạn cùng vào bếp, NGUYÊN LIỆU:, - 3 chén cơm , - 1 cây lạp xưởng, - 1 cái trứng vịt, - 1/3 củ cà rốt, - 1 ít đậu cô ve, ', 78, '2023-11-08 00:00:00.000000'),
(5, 1, 2, 'Cơm Gà', 45000, 'https://images.foody.vn/res/g80/791257/prof/s/file_restaurant_photo_zj7d_16195-88cb1e38-210427122724.jpg', 'Cơm gà xối mỡ ngon, gà thịt trong nóng da ngoài giòn và thấm mùi nước mắm tỏi. Cơm thì cũng khá nhiều, ăn đủ no. Vật dụng đầy đủ, nói chung sẽ ủng hộ tiếp.', 0, '2023-08-15 00:00:00.000000'),
(6, 1, 2, 'Ốc Nướng ', 50000, 'https://i-giadinh.vnecdn.net/2022/11/22/Thanh-pham-1-1-6930-1669103895.jpg', 'Làm sốt tiêu xanh: Đây là bí quyết làm nên món ốc bươu nướng ngon hay không. Phi hành, tỏi cùng chút mỡ lợn cho dậy mùi thơm. Cho vào hạt tiêu đập dập, ớt xay cùng 2 muỗng canh dầu hào, 2 muỗng canh tương ớt, 1', 54, '2023-07-04 00:00:00.000000'),
(7, 1, 2, 'Vịt Nướng', 150000, 'https://i.ytimg.com/vi/Fvy0_SprvjA/maxresdefault.jpg', 'Mách bạn CÁCH ƯỚP VỊT NƯỚNG ngon đậm vị như NHÀ HÀNG - Bí quyết pha nước chấm vịt ngon', 7777, '2023-04-19 00:00:00.000000'),
(8, 1, 2, 'Bánh Mỳ', 15000, 'https://daotaobeptruong.vn/wp-content/uploads/2021/01/banh-mi-viet-nam.jpg', '“Bánh mì”, cái tên thân thương đã in sâu trong tâm trí của bao người con đất Việt, trở thành niềm tự hào của dân tộc và là một trong những đại diện cho tinh hoa ẩm thực Việt. Trải qua bao thăng trầm lịch sử, bánh mì Việt Nam giờ đây đã vượt ra khỏi biên g', 658, '2024-01-11 00:00:00.000000'),
(9, 1, 2, 'Cá Viên Chiên', 20000, 'https://images.foody.vn/res/g100006/1000051064/prof/s1242x600/file_restaurant_photo_etep_16507-d9fb24f0-220423193357.jpeg', 'Cá viên chiên là một món ăn ngon và hấp dẫn, thường được phục vụ làm món nhẹ, món ăn nhẹ hoặc một phần của bữa tối. Với vị ngon đậm đà của cá và sự giòn rụm của lớp vỏ chiên, mỗi miếng cá viên là một trải nghiệm thú vị cho vị giác. Chiếc cá viên ăn kèm vớ', 15444, '2023-10-03 00:00:00.000000'),
(10, 1, 2, 'Cơm Trứng', 50000, 'https://cdn.tgdd.vn/Files/2021/08/13/1374974/cach-lam-mon-com-chien-trung-kieu-nhat-omurice-thom-ngon-dep-mat-tai-nha-202108131539047554.jpg', 'Nếu bạn có 1 tình yêu mãnh liệt dành cho nền ẩm thực Nhật Bản thì chắc hẳn cũng sẽ biết đến món Omurice, một thể loại cơm chiên trứng kiểu Nhật nổi tiếng với hương vị thơm ngon, béo ngậy mà cách làm thì vô cùng đơn giản. Hãy theo dõi bài viết về cách làm ', 14872, '2023-10-02 00:00:00.000000'),
(11, 1, 1, 'Quần dài Jogger cao cấp các loại', 300000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lk9e8s3u93fs6d_tn', 'From quần dễ mặc, kiểu dáng năng động, hiện đại ', 12345, '2023-10-30 00:00:00.000000'),
(12, 1, 1, 'Bộ Dl0R họa tiết In Hình Hổ Cực Chất', 456900, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhmxzmpd6l518e', '100% cotton cao cấp, thấm hút mồ hôi rất tốt, thoáng mát, mềm mịn, thoáng mát, không xù lông', 45678, '2023-10-01 00:00:00.000000'),
(13, 1, 1, 'Bộ DlO R Nam sơmi cộc hoạ tiết vân dệt kín áo', 678000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-liwosfv809g2e2', ' Mặc ở nhà, mặc đi chơi hoặc khi vận động thể thao. Phù hợp khi mix đồ với nhiều loại.', 56433, '2028-10-26 00:00:00.000000'),
(14, 1, 1, 'Quần Đát vân cao tần cực đẹp', 125000, 'https://down-vn.img.susercontent.com/file/b4769d13bb6c55a1b00b901477495066', 'Chất thể thao thoáng mát, in vân camo và logo hãng cao tần  rất sang', 566700, '2023-07-18 00:00:00.000000'),
(15, 1, 1, 'Bộ D rew in hình mặt cười Nam Nữ', 556776, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lipjekgfev2qab', 'Áo chất cotton khô, dày dặn, thoáng mát, phối hoạ tiết hình mặt cười', 678900, '2023-10-03 00:00:00.000000'),
(16, 1, 1, 'Áo Thun Cổ Tròn Đính Đá Phản Quang Chrome Heart Unisex', 300000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lhzx1q83pgapb8', 'Áo thun cổ tròn chrome heart phản quang đính đá', 657800, '2023-10-09 00:00:00.000000'),
(17, 1, 1, 'Áo phông nam L.V có 3 màu', 120000, 'https://down-vn.img.susercontent.com/file/vn-11134207-7qukw-lfo6hiagsbcla4', 'Áo phông nam L.V có 3 màu - Áo Thun Cổ Tròn Cho Nam', 677989, '2023-04-02 00:00:00.000000'),
(18, 1, 2, 'Mì Quảng Đà Nẵng ', 25000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/Mi-Quang-1-e1502212606133.png', 'Mì Quảng là món ăn bạn không thể bỏ lỡ khi đi du lịch Đà Nẵng', 56677, '2023-04-02 00:00:00.000000'),
(19, 1, 2, 'Bún bò Đà Nẵng ', 30000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/Bun-bo-Da-Nang-e1502212665175.png', 'Bún bò là một món ăn đặc trưng của người Huế nhưng khi đến với Đà Nẵng thì món bún này có chút thay đổi để phù hợp với khẩu vị người Đà Nẵng', 56678, '2023-10-03 00:00:00.000000'),
(20, 1, 2, 'Bún mắm nêm Đà Nẵng', 25000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/Bun-mam-nem-Da-Nang-e1502212828557.png', 'Khí hậu Đà Nẵng nắng nóng nên dường như các loại bún trộn đã trở thành những món ăn được người dân nơi đây vô cùng yêu thích', 6778, '2031-10-07 00:00:00.000000'),
(21, 1, 2, 'Bún thịt nướng Đà Nẵng ', 25000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/Bun-thit-nuong-e1502212886226.png', 'Thịt thái lát mỏng, tẩm ướt gia vị thơm ngon rồi nướng trên than hồng, không bị khô mà ăn mềm ướt, ngọt mặn, trộn cùng bún ăn rất vừa miệng.', 766, '2023-07-24 00:00:00.000000'),
(22, 1, 2, 'Bánh canh Đà Nẵng ', 30000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/Banh-canh-Da-Nang-e1502212960763.png', 'Bánh canh là một món ăn bình dị, dân dã nhưng không kém phần thơm ngon, đậm đà', 76655, '2018-10-23 00:00:00.000000'),
(23, 1, 2, 'Bún chả cá Đà Nẵng', 20000, 'https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2017/08/Nem-lui-Da-Nang-e1502213598536.png', 'Là món ăn đặc trưng của miền Trung nhưng có lẽ bún chả cá ngon nhất là ở Đà Nẵng. Bún được chế biến từ loại chả làm từ thịt cá băm nhuyễn nguyên chất, mang lại vị ngọt tự nhiên, đậm đà.', 5566, '2022-11-24 00:00:00.000000'),
(24, 1, 1, ' Áo bó thể thao tay dài Body Unique Apparel', 40000, 'https://salt.tikicdn.com/cache/w300/ts/product/99/93/b7/2f81d4018ac73ea72ed4ae628ce4b3f1.jpg', 'Áo được làm từ vải thun thể thao cao cấp co giãn tốt, giúp thấm hút mồ hôi tốt, đồng thời không nhăn và không bị co rút khi giặt hay vận động nhiều lúc tập luyện. Ngoài ra, bề mặt áo được thiết kế dạng trơn dập vân tạo nên sự sang trọng và mạnh mẽ', 5556, '2023-10-03 00:00:00.000000'),
(25, 1, 1, 'Set bộ đồ quần áo thể thao nam Basic', 89000, 'https://lzd-img-global.slatic.net/g/p/d6d531d8476a9dfd599b5c31037e48f3.jpg_550x550.jpg', 'Set bộ đồ thể thao cho nam này bao gồm cả quần và áo thể thao dành cho nam, đến từ thương hiệu Vansydical chuyên về các sản phẩm hàng thể thao nội địa Trung Quốc.', 667, '2023-04-10 00:00:00.000000'),
(26, 1, 1, 'Áo thun thể thao nam Nike Pro Combat ', 70000, 'https://cf.shopee.vn/file/6d1e065ff1cdd2ea31ebeae87b765fd6', 'Áo thể thao nam Nike Pro Combat được sản xuất dành riêng cho các loại hình thể thao cần hoạt động nhiều như đá banh, tập gym, chơi bóng chuyền, bóng rổ,…Áo được thiết kế ôm sát cơ thể và ôm bó vào người làm tăng cơ bắp cho bạn.', 677, '2023-10-03 00:00:00.000000'),
(27, 1, 1, 'Áo thun thể thao nam Eros', 60000, 'https://www.sporter.vn/wp-content/uploads/2017/07/Ao-eros-xam-1.jpg', 'Áo thể thao nam này được thiết kế với kiểu dáng rất cá tính và nổi bật, bắt mắt, cực kỳ phù hợp với những bạn nào có phong cách thể thao trẻ trung, hiện đại và cá tính.', 665, '2023-10-03 00:00:00.000000'),
(29, 1, 4, 'Bộ Sản Phẩm Dưỡng Ẩm Cơ Bản Kiehl\'s Hydration Starter Kit', 290000, 'https://www.kiehls.com.vn/on/demandware.static/-/Sites-kiehls-vn-ng-Library/vi_VN/dw599352e0/images/optimize/Tos_Team/bo-skincare-cho-da-dau-mun/bo-skincare-cho-da-dau-mun-8.jpg', 'Được lấy cảm hứng từ mùa lễ hội của nghệ sĩ Marylou Faure, Bộ Sản Phẩm Dưỡng Ẩm Cơ Bản Kiehl\'s Hydration Starter Kit đã ra đời', 456, '2023-10-03 00:00:00.000000'),
(31, 1, 5, 'The Little Prince (Hoàng Tử Bé)', 50000, 'https://atpsoftware.vn/wp-content/uploads//2023/04/cuon-sach-ban-chay-nhat-moi-thoi-dai-1.png', 'Câu chuyện kể về một chàng hoàng tử nhỏ bé sống trên một quả thiên thạch tí hon và cách anh giải quyết các vấn đề về sự cô đơn, tình yêu, tình bạn và sự mất mát.', 123, '2023-10-03 00:00:00.000000'),
(32, 1, 5, 'Harry Potter and the Sorcerer\'s Stone (Harry Potter và Hòn đá Phù thủy)', 129000, 'https://atpsoftware.vn/wp-content/uploads//2023/04/cuon-sach-ban-chay-nhat-moi-thoi-dai-2.png', 'Nội dung của truyện nói về từng quá trình trưởng thành của cậu bé phù thủy trẻ tuổi Harry Potter cùng những người bạn thân thiết đã cùng nhau chiến đấu nhằm chống lại các thế lực nguy hiểm hắc ám.', 234, '2023-10-03 00:00:00.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order`
--

CREATE TABLE `order` (
  `id` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `id_item` int(255) NOT NULL,
  `id_bill` int(255) NOT NULL,
  `amount` int(6) NOT NULL,
  `money` int(100) NOT NULL,
  `is_shop_confirm` tinyint(1) NOT NULL DEFAULT 0,
  `fls_percent` int(6) DEFAULT NULL,
  `is_rate` int(1) NOT NULL DEFAULT 0,
  `created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order`
--

INSERT INTO `order` (`id`, `id_user`, `id_item`, `id_bill`, `amount`, `money`, `is_shop_confirm`, `fls_percent`, `is_rate`, `created_at`) VALUES
(1, 16, 17, 6, 2, 240000, 0, NULL, 0, '2024-05-14 16:58:07'),
(2, 16, 25, 7, 2, 178000, 1, NULL, 1, '2024-05-14 16:58:56'),
(3, 16, 1, 7, 2, 40000, 0, 30, 0, '2024-05-14 16:58:56');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `rate_item`
--

CREATE TABLE `rate_item` (
  `id` int(255) NOT NULL,
  `id_item` int(255) NOT NULL,
  `id_user` int(255) NOT NULL,
  `rate_star` float NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `rate_item`
--

INSERT INTO `rate_item` (`id`, `id_item`, `id_user`, `rate_star`, `comment`, `created_at`) VALUES
(1, 1, 1, 5, 'ngon', '2023-10-30 00:00:00.000000'),
(2, 2, 1, 4, 'rẽ', '2023-10-24 00:00:00.000000'),
(3, 3, 1, 3.5, 'khá mặn', '2023-10-02 00:00:00.000000'),
(4, 4, 1, 2, 'nhiều dầu mỡ', '2023-10-17 00:00:00.000000'),
(5, 5, 1, 1.5, 'gà bị cháy', '2023-10-18 00:00:00.000000'),
(7, 7, 1, 5, 'vịt ngon', '2023-10-05 00:00:00.000000'),
(8, 8, 1, 4.5, 'tuyệt vời', '2023-10-01 00:00:00.000000'),
(9, 9, 1, 3, 'xiên bẩn', '2023-10-22 00:00:00.000000'),
(10, 1, 2, 4, 'phục vụ tận tình', '2023-10-10 00:00:00.000000'),
(11, 1, 6, 5, 'ngon và rẽ', '2023-10-14 00:00:00.000000'),
(13, 22, 1, 3.5, 'khá ngon', '2024-05-09 15:32:16.000000'),
(14, 5, 5, 2, 'gà ngon', '2024-05-09 19:27:42.000000'),
(15, 5, 2, 2.5, 'chê', '2024-05-09 19:53:05.000000'),
(16, 5, 6, 4.5, 'ngon', '2024-05-09 19:54:14.000000'),
(17, 23, 1, 4, 'ổn', '2024-05-09 21:29:21.000000'),
(19, 25, 16, 3.5, 'Dep', '2024-05-14 17:01:56.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `shop`
--

CREATE TABLE `shop` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `follower` int(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `descrip` varchar(255) NOT NULL,
  `address` varchar(100) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `shop`
--

INSERT INTO `shop` (`id`, `username`, `phone`, `follower`, `email`, `img`, `password`, `descrip`, `address`, `token`, `created_at`) VALUES
(1, 'Duy Bình', '0982038250', 999, 'duybinh10012004@gmail.com', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ-XvvMFfz2sf5o2MNsvg8TYgY3YeL0YgJmmA&usqp=CAU', 'zxc123', 'uy tín', 'Huế', 'sad', '2023-12-27 21:52:48.000000'),
(2, 'Bình Gold', '02144', 8250, 'binhgold@gmail.com', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQGnO-v5vKBqcZr5qj6WxEiYk1GLmeCTGu8AA&usqp=CAU', 'zxc123', 'ok', 'Huế', 'sd', '2023-12-15 21:53:35.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `status_transport`
--

CREATE TABLE `status_transport` (
  `id` int(255) NOT NULL,
  `id_order` int(255) NOT NULL,
  `place` varchar(255) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `status_transport`
--

INSERT INTO `status_transport` (`id`, `id_order`, `place`, `created_at`) VALUES
(2, 2, 'Chuẩn bị hàng', '2024-05-14 17:00:15.000000'),
(3, 2, 'Ha No', '2024-05-14 17:00:42.000000'),
(4, 2, 'Đang giao hàng', '2024-05-14 17:01:33.000000'),
(5, 2, 'Đã nhận hàng', '2024-05-14 17:01:41.000000');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(100) NOT NULL,
  `address` varchar(100) NOT NULL,
  `img` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `phone`, `email`, `password`, `address`, `img`, `created_at`) VALUES
(1, 'Duy Bình', '0982038250', 'duybinh@gmail.com', '$2y$12$IpI7EXALflilg1FWTjoFBOsGywlTI9Yl0fJWLP.CEzbGi33EkBBsu', 'Huế', 'https://www.w3schools.com/w3images/avatar2.png', '2023-12-13 18:18:03.000000'),
(2, 'Huy Lỏ', '0982038251', 'duybinh1@gmail.com', '$2y$12$IpI7EXALflilg1FWTjoFBOsGywlTI9Yl0fJWLP.CEzbGi33EkBBsu', 'Thua Thien Hue', 'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg', NULL),
(5, 'Thánh Review', '0982038258', 'f@gmail.com', '$2y$10$dfY2oeP.RCCPqwhKq4i1RugfMM1J2Ji.KQKpEpgrPnYCTWL2IqH1C', 'Hue', 'https://cdn1.vectorstock.com/i/1000x1000/31/95/user-sign-icon-person-symbol-human-avatar-vector-12693195.jpg', NULL),
(6, 'Dinn', '0982038463', 'd@gmail.com', '$2y$10$EBWj7rhAV4i0Tnyc9wZuTOt/JCyPCYRvbE9mt46fmqROMG/tRoYvy', 'Hue', NULL, NULL),
(16, 'duybinh11', '0982039999', 'ndb@gmail.com', '$2y$10$dAYlhrofGlzXTUR1hhxxsemDh1zRLwp6cSExbK7t4YDTzDfkB9Imy', 'Hue', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `vnpay`
--

CREATE TABLE `vnpay` (
  `id` int(255) NOT NULL,
  `id_bill` int(255) NOT NULL,
  `money` int(15) NOT NULL,
  `bank_code` varchar(15) NOT NULL,
  `is_payment` varchar(1) NOT NULL,
  `created_at` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `vnpay`
--

INSERT INTO `vnpay` (`id`, `id_bill`, `money`, `bank_code`, `is_payment`, `created_at`) VALUES
(1715680735, 7, 206000, 'NCB', '1', '2024-05-14 16:59:44.000000');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `address_history`
--
ALTER TABLE `address_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `bill_item`
--
ALTER TABLE `bill_item`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `flash_sale`
--
ALTER TABLE `flash_sale`
  ADD PRIMARY KEY (`id`),
  ADD KEY `flash_sale_ibfk_1` (`id_item`);

--
-- Chỉ mục cho bảng `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_shop` (`id_shop`);

--
-- Chỉ mục cho bảng `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_user` (`id_user`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_bill` (`id_bill`);

--
-- Chỉ mục cho bảng `rate_item`
--
ALTER TABLE `rate_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_item` (`id_item`),
  ADD KEY `id_user` (`id_user`);

--
-- Chỉ mục cho bảng `shop`
--
ALTER TABLE `shop`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`id`),
  ADD UNIQUE KEY `phone` (`id`),
  ADD UNIQUE KEY `email` (`id`);

--
-- Chỉ mục cho bảng `status_transport`
--
ALTER TABLE `status_transport`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_order` (`id_order`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bill` (`id_bill`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `address_history`
--
ALTER TABLE `address_history`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT cho bảng `bill_item`
--
ALTER TABLE `bill_item`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=66;

--
-- AUTO_INCREMENT cho bảng `flash_sale`
--
ALTER TABLE `flash_sale`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `item`
--
ALTER TABLE `item`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT cho bảng `order`
--
ALTER TABLE `order`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `rate_item`
--
ALTER TABLE `rate_item`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT cho bảng `shop`
--
ALTER TABLE `shop`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT cho bảng `status_transport`
--
ALTER TABLE `status_transport`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1715680736;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `address_history`
--
ALTER TABLE `address_history`
  ADD CONSTRAINT `address_history_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `item`
--
ALTER TABLE `item`
  ADD CONSTRAINT `item_ibfk_1` FOREIGN KEY (`id_shop`) REFERENCES `shop` (`id`);

--
-- Các ràng buộc cho bảng `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`id_bill`) REFERENCES `bill_item` (`id`);

--
-- Các ràng buộc cho bảng `rate_item`
--
ALTER TABLE `rate_item`
  ADD CONSTRAINT `rate_item_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item` (`id`),
  ADD CONSTRAINT `rate_item_ibfk_2` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `status_transport`
--
ALTER TABLE `status_transport`
  ADD CONSTRAINT `status_transport_ibfk_1` FOREIGN KEY (`id_order`) REFERENCES `order` (`id`);

--
-- Các ràng buộc cho bảng `vnpay`
--
ALTER TABLE `vnpay`
  ADD CONSTRAINT `vnpay_ibfk_1` FOREIGN KEY (`id_bill`) REFERENCES `bill_item` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
