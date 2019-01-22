-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Oca 2019, 15:02:09
-- Sunucu sürümü: 10.1.37-MariaDB
-- PHP Sürümü: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `otel`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `gender` set('KADIN','ERKEK','','') NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(50) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `customer_addresses`
--

CREATE TABLE `customer_addresses` (
  `id` int(11) NOT NULL,
  `title` int(150) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `line1` varchar(255) NOT NULL,
  `line2` varchar(255) DEFAULT NULL,
  `state` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `country` varchar(50) NOT NULL,
  `is_default` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reservations`
--

CREATE TABLE `reservations` (
  `id` int(11) NOT NULL,
  `room_id` int(5) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `started_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ended_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `reservation_payment`
--

CREATE TABLE `reservation_payment` (
  `id` int(11) NOT NULL,
  `reservation_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `price` decimal(25,4) NOT NULL,
  `full_adress` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` tinyint(4) NOT NULL,
  `paymet_type` varchar(25) NOT NULL,
  `cc_no` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_no` int(5) NOT NULL,
  `room_type_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `room_types`
--

CREATE TABLE `room_types` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `bed_count` int(1) NOT NULL,
  `room_count` int(1) NOT NULL,
  `price` decimal(25,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(150) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '0',
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `phone` (`phone`),
  ADD KEY `password` (`password`);

--
-- Tablo için indeksler `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Tablo için indeksler `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_id` (`room_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Tablo için indeksler `reservation_payment`
--
ALTER TABLE `reservation_payment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `reservation_id` (`reservation_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `id` (`id`);

--
-- Tablo için indeksler `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_no` (`room_no`),
  ADD KEY `room_type_id` (`room_type_id`);

--
-- Tablo için indeksler `room_types`
--
ALTER TABLE `room_types`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `email_index` (`email`),
  ADD KEY `password` (`password`),
  ADD KEY `username` (`username`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `customer_addresses`
--
ALTER TABLE `customer_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reservations`
--
ALTER TABLE `reservations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `reservation_payment`
--
ALTER TABLE `reservation_payment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `room_types`
--
ALTER TABLE `room_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`id`) REFERENCES `reservation_payment` (`customer_id`);

--
-- Tablo kısıtlamaları `customer_addresses`
--
ALTER TABLE `customer_addresses`
  ADD CONSTRAINT `customer_addresses_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`);

--
-- Tablo kısıtlamaları `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`room_id`) REFERENCES `rooms` (`id`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`id`) REFERENCES `reservation_payment` (`reservation_id`);

--
-- Tablo kısıtlamaları `room_types`
--
ALTER TABLE `room_types`
  ADD CONSTRAINT `room_types_ibfk_1` FOREIGN KEY (`id`) REFERENCES `rooms` (`room_type_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
