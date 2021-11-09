-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 09, 2021 at 07:49 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `zomato`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `details` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `pincode` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `user_id`, `details`, `phone`, `pincode`) VALUES
(3, 1, 'House No 158, Uppal South End\r\nW block', '8420166148', '122018'),
(4, 1, 'Shapoorji Pallonji Sukhobrishti Complex Road\r\nJ13', '8420166148', '700135'),
(5, 7, 'xyz', '123232132', '13131');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `user_id`, `product_id`, `quantity`) VALUES
(6, 1, 8, 1);

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `coupon_id` int(11) NOT NULL,
  `coupon_name` varchar(255) NOT NULL,
  `coupon_value` int(11) NOT NULL,
  `coupon_status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `discount`
--

INSERT INTO `discount` (`coupon_id`, `coupon_name`, `coupon_value`, `coupon_status`) VALUES
(1, 'OCTFUN', 10, 'active'),
(2, 'FESTIVE20', 20, 'active'),
(3, 'SEPT15', 15, 'expired');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `address` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `payment_method` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `user_id`, `amount`, `order_date`, `address`, `status`, `payment_method`) VALUES
('617028b357cf9', 1, 98568, '2021-10-20', 3, 1, 'UPI'),
('617031fc48e9f', 1, 220, '2021-10-20', 3, 1, 'Debit Card'),
('618a7d9b1cb4b', 7, 699, '2021-11-09', 5, 1, 'Credit Card'),
('618abce9c8163', 7, 900, '2021-11-09', 5, 1, 'Debit Card');

-- --------------------------------------------------------

--
-- Table structure for table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `order_id` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `order_details`
--

INSERT INTO `order_details` (`id`, `order_id`, `product_id`, `quantity`) VALUES
(61, '617028b357cf9', 16, 1),
(62, '617028b357cf9', 7, 2),
(63, '617028b357cf9', 8, 3),
(64, '617031fc48e9f', 20, 2),
(65, '618a7d9b1cb4b', 3, 1),
(66, '618abce9c8163', 78, 0),
(67, '618abce9c8163', 78, 0),
(68, '618abce9c8163', 78, 2),
(69, '618abce9c8163', 78, 1);

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  `details` text NOT NULL,
  `bg_img` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`product_id`, `name`, `brand`, `category`, `price`, `details`, `bg_img`) VALUES
(78, 'Chicken Biryani', 'Arsalan', 'Non Veg', 300, 'Rich in Flavours', '\"https://st.depositphotos.com/3147737/4962/i/600/depositphotos_49622201-stock-photo-hyderabadi-biryani-a-popular-chicken.jpg\"'),
(79, 'Palak Paneer', 'Zaika Restaurant', 'Veg', 250, 'Very Tasty', '\"https://www.awesomecuisine.com/wp-content/uploads/2008/02/palak_paneer_recipe.jpg\"'),
(80, 'Kaju Barfi', 'Mitali Sweets', 'Desserts', 90, 'Made with Love', '\"https://st4.depositphotos.com/18645588/20488/i/1600/depositphotos_204888166-stock-photo-kaju-barfee-kaju-sweet.jpg\"'),
(81, 'Chicken Rezala', 'Zaika Restaurant', 'Non Veg', 250, 'Recommended', '\"http://1.bp.blogspot.com/-PhkFtO7VlBQ/U4JO2R-Hd0I/AAAAAAAAFYU/4yS8GIV0eNc/s1600/chicken.mughlai.white.gravy.recipe.jpg\"'),
(82, 'Pulao', 'Al Jazeera', 'Veg', 270, 'Flavoured Rice', '\"https://www.recipehub.in/wp-content/uploads/2019/09/veg-pulao9website.jpg\"'),
(83, 'Rasogulla', 'Mitali Sweets', 'Desserts', 80, 'Best of Kolkata', '\"https://biharpost.in/wp-content/uploads/2015/01/rasgulla-.jpg\"'),
(84, 'Mutton kosha', 'Ratan Tata', 'Non Veg', 175, 'bangalir favourite ekhon online', '\"https://kitchenofdebjani.com/wp-content/uploads/2019/09/Kosha-Mangsho.jpg\"'),
(85, 'Alur dum', 'Afgan Dhaba', 'Veg', 50, '1 plate with out service tax', '\"https://www.vegrecipesofindia.com/wp-content/uploads/2012/04/kashmiri-dum-aloo-recipe-11a.jpg\"'),
(86, 'Tarka', 'Afgan Dhaba', 'Veg', 75, '1 plate with out service tax', '\"https://veggiedesserts.com/wp-content/uploads/2021/04/tarka-dal-tadka-2.jpg\"'),
(87, 'Chicken Momo', 'Zaika Restaurant', 'Non Veg', 175, 'zomato service', '\"http://www.theterracekitchen.in/wp-content/uploads/2019/07/048.-Chicken-Momos_545X545.png\"'),
(88, 'Chilli Chicken', 'Zaika Restaurant', 'Non Veg', 135, 'zomato service', '\"https://static.toiimg.com/photo/53094926.cms\"'),
(89, 'Gajar ka Halwa', 'Mitali Sweets', 'Desserts', 75, 'with kesar for better taste', '\"https://indianvegrecipe.com/wp-content/uploads/2020/01/carrot-halwa-recipe.jpg\"'),
(90, 'Gulab Jamun', 'Mitali Sweets', 'Desserts', 35, 'taste good with 5pcs', '\"https://www.cookingcarnival.com/wp-content/uploads/2020/10/Gulab-jamun.jpg\"');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `review_title` varchar(255) NOT NULL,
  `review_text` text NOT NULL,
  `review_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `user_id`, `product_id`, `rating`, `review_title`, `review_text`, `review_date`) VALUES
(1, 1, 8, 4, 'Nice Product', 'wrhwrh\r\nweg\r\nweg\r\nwrh\r\nwrh\r\nwrh', '2021-10-21'),
(2, 1, 8, 1, 'Pathetic Quality', 'wrwrhw\r\nwr\r\nhwr\r\nhr\r\neh\r\nreherh', '2021-10-22'),
(3, 7, 78, 5, 'Tasty', 'Quality is too good', '2021-11-09');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `user_id` int(10) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `name`, `email`, `password`) VALUES
(1, 'Nitish Singh', 'nitish@gmail.com', 'nitish1234'),
(3, 'Ankit', 'ankit@gmail.com', 'ankit1234'),
(4, 'Abhinav', 'abhinav@gmail.com', '12345'),
(5, 'Neha Jain', 'nehajain@gmail.com', '123456'),
(7, 'Pritam Roy', 'pr.ronnie1234@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Table structure for table `wishlist`
--

CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `wishlist`
--

INSERT INTO `wishlist` (`id`, `user_id`, `product_id`) VALUES
(16, 1, 8),
(18, 1, 7),
(19, 1, 23);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- Indexes for table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=70;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
