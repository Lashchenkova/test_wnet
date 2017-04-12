-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Квт 12 2017 р., 16:48
-- Версія сервера: 10.1.21-MariaDB
-- Версія PHP: 7.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `test_wnet`
--

-- --------------------------------------------------------

--
-- Структура таблиці `obj_contracts`
--

CREATE TABLE `obj_contracts` (
  `id_contract` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `date_sign` date NOT NULL,
  `staff_number` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `obj_contracts`
--

INSERT INTO `obj_contracts` (`id_contract`, `id_customer`, `number`, `date_sign`, `staff_number`) VALUES
(1, 1, '12', '2017-04-12', '234'),
(2, 2, '34', '2017-04-12', '234'),
(3, 4, '555', '2017-04-11', '56'),
(4, 3, '2', '2017-04-02', '42'),
(5, 8, '74', '2017-04-29', '345'),
(6, 7, '68', '2017-04-09', '345'),
(7, 5, '3', '2017-04-08', '13'),
(8, 6, '424', '2017-04-01', '11');

-- --------------------------------------------------------

--
-- Структура таблиці `obj_customers`
--

CREATE TABLE `obj_customers` (
  `id_customer` int(11) NOT NULL,
  `name_customer` varchar(250) NOT NULL,
  `company` enum('company_1','company_2','company_3') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `obj_customers`
--

INSERT INTO `obj_customers` (`id_customer`, `name_customer`, `company`) VALUES
(1, 'customer1', 'company_1'),
(2, 'customer7', 'company_1'),
(3, 'customer8', 'company_1'),
(4, 'customer2', 'company_1'),
(5, 'customer3', 'company_2'),
(6, 'customer4', 'company_3'),
(7, 'customer5', 'company_3'),
(8, 'customer6', 'company_2');

-- --------------------------------------------------------

--
-- Структура таблиці `obj_services`
--

CREATE TABLE `obj_services` (
  `id_service` int(11) NOT NULL,
  `id_contract` int(11) NOT NULL,
  `title_service` varchar(250) NOT NULL,
  `status` enum('work','connecting','disconnected') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп даних таблиці `obj_services`
--

INSERT INTO `obj_services` (`id_service`, `id_contract`, `title_service`, `status`) VALUES
(1, 1, 'service1', 'work'),
(2, 8, 'service2', 'disconnected'),
(3, 2, 'service3', 'connecting'),
(4, 7, 'service4', 'connecting'),
(5, 4, 'service6', 'work'),
(6, 5, 'service5', 'disconnected'),
(7, 1, 'service7', 'work'),
(8, 1, 'service9', 'disconnected');

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `obj_contracts`
--
ALTER TABLE `obj_contracts`
  ADD PRIMARY KEY (`id_contract`),
  ADD KEY `id_customer` (`id_customer`);

--
-- Індекси таблиці `obj_customers`
--
ALTER TABLE `obj_customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Індекси таблиці `obj_services`
--
ALTER TABLE `obj_services`
  ADD PRIMARY KEY (`id_service`),
  ADD KEY `id_contract` (`id_contract`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `obj_contracts`
--
ALTER TABLE `obj_contracts`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблиці `obj_customers`
--
ALTER TABLE `obj_customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT для таблиці `obj_services`
--
ALTER TABLE `obj_services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `obj_contracts`
--
ALTER TABLE `obj_contracts`
  ADD CONSTRAINT `obj_contracts_ibfk_1` FOREIGN KEY (`id_customer`) REFERENCES `obj_customers` (`id_customer`);

--
-- Обмеження зовнішнього ключа таблиці `obj_services`
--
ALTER TABLE `obj_services`
  ADD CONSTRAINT `obj_services_ibfk_1` FOREIGN KEY (`id_contract`) REFERENCES `obj_contracts` (`id_contract`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
