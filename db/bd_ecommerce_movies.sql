-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24-Jul-2022 às 21:51
-- Versão do servidor: 10.4.24-MariaDB
-- versão do PHP: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `bd_ecommerce_movies`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `favorite`
--

CREATE TABLE `favorite` (
  `favorite_id` int(11) NOT NULL,
  `favorite_user_id` int(11) NOT NULL,
  `favorite_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `gender`
--

CREATE TABLE `gender` (
  `gender_id` int(11) NOT NULL,
  `gender_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `link_gender`
--

CREATE TABLE `link_gender` (
  `link_gender_id` int(11) NOT NULL,
  `link_gender_gender_id` int(11) NOT NULL,
  `link_gender_product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `link_info`
--

CREATE TABLE `link_info` (
  `link_info_id` int(11) NOT NULL,
  `link_info_product_id` int(11) NOT NULL,
  `link_info_chapter` int(2) DEFAULT NULL,
  `link_info_episode` int(4) DEFAULT NULL,
  `link_info_subtitle` varchar(50) DEFAULT NULL,
  `link_info_description` varchar(500) NOT NULL,
  `link_info_img` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `link_pay_type`
--

CREATE TABLE `link_pay_type` (
  `link_pay_type_id` int(11) NOT NULL,
  `link_pay_type_pay_type_id` int(11) NOT NULL,
  `link_pay_type_product_id` int(11) NOT NULL,
  `link_pay_type_value` double(4,2) NOT NULL,
  `link_pay_type_promotion` tinyint(1) NOT NULL,
  `link_pay_type_promotion_value` double(4,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `pay_type`
--

CREATE TABLE `pay_type` (
  `pay_type_id` int(11) NOT NULL,
  `pay_type_icon` varchar(20) NOT NULL,
  `pay_type_description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL,
  `product_title` varchar(50) NOT NULL,
  `product_type` char(1) NOT NULL,
  `product_indicated_to` char(3) NOT NULL,
  `product_description` varchar(500) NOT NULL,
  `product_subtitle` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_email` varchar(50) NOT NULL,
  `user_password` varchar(200) NOT NULL,
  `user_token` varchar(100) DEFAULT NULL,
  `user_date` date NOT NULL,
  `user_img` longblob NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`favorite_id`),
  ADD KEY `favorite_product_id` (`favorite_product_id`),
  ADD KEY `favorite_user_id` (`favorite_user_id`);

--
-- Índices para tabela `gender`
--
ALTER TABLE `gender`
  ADD PRIMARY KEY (`gender_id`);

--
-- Índices para tabela `link_gender`
--
ALTER TABLE `link_gender`
  ADD PRIMARY KEY (`link_gender_id`),
  ADD KEY `link_gender_gender_id` (`link_gender_gender_id`),
  ADD KEY `link_gender_product_id` (`link_gender_product_id`);

--
-- Índices para tabela `link_info`
--
ALTER TABLE `link_info`
  ADD PRIMARY KEY (`link_info_id`),
  ADD KEY `more_info_product_id` (`link_info_product_id`);

--
-- Índices para tabela `link_pay_type`
--
ALTER TABLE `link_pay_type`
  ADD PRIMARY KEY (`link_pay_type_id`),
  ADD KEY `link_pay_type_pay_type_id` (`link_pay_type_pay_type_id`),
  ADD KEY `link_pay_type_product_id` (`link_pay_type_product_id`);

--
-- Índices para tabela `pay_type`
--
ALTER TABLE `pay_type`
  ADD PRIMARY KEY (`pay_type_id`);

--
-- Índices para tabela `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`);

--
-- Índices para tabela `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `favorite`
--
ALTER TABLE `favorite`
  MODIFY `favorite_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `gender`
--
ALTER TABLE `gender`
  MODIFY `gender_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `link_gender`
--
ALTER TABLE `link_gender`
  MODIFY `link_gender_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `link_info`
--
ALTER TABLE `link_info`
  MODIFY `link_info_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `link_pay_type`
--
ALTER TABLE `link_pay_type`
  MODIFY `link_pay_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `pay_type`
--
ALTER TABLE `pay_type`
  MODIFY `pay_type_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`favorite_product_id`) REFERENCES `product` (`product_id`),
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`favorite_user_id`) REFERENCES `user` (`user_id`);

--
-- Limitadores para a tabela `link_gender`
--
ALTER TABLE `link_gender`
  ADD CONSTRAINT `link_gender_ibfk_1` FOREIGN KEY (`link_gender_gender_id`) REFERENCES `gender` (`gender_id`),
  ADD CONSTRAINT `link_gender_ibfk_2` FOREIGN KEY (`link_gender_product_id`) REFERENCES `product` (`product_id`);

--
-- Limitadores para a tabela `link_info`
--
ALTER TABLE `link_info`
  ADD CONSTRAINT `link_info_ibfk_1` FOREIGN KEY (`link_info_product_id`) REFERENCES `product` (`product_id`);

--
-- Limitadores para a tabela `link_pay_type`
--
ALTER TABLE `link_pay_type`
  ADD CONSTRAINT `link_pay_type_ibfk_1` FOREIGN KEY (`link_pay_type_pay_type_id`) REFERENCES `pay_type` (`pay_type_id`),
  ADD CONSTRAINT `link_pay_type_ibfk_2` FOREIGN KEY (`link_pay_type_product_id`) REFERENCES `product` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
