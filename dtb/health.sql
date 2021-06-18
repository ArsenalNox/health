-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 18 2021 г., 21:12
-- Версия сервера: 10.3.16-MariaDB
-- Версия PHP: 7.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `health`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` int(11) NOT NULL,
  `desc` int(11) NOT NULL,
  `severity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `dfeed`
--

CREATE TABLE `dfeed` (
  `id` int(11) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `dfeed`
--

INSERT INTO `dfeed` (`id`, `content`, `img`, `title`, `date`) VALUES
(1, 'Первое описание просто болезни на просто человеческом языке', NULL, 'Бяка', '2021-12-12 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `guests`
--

CREATE TABLE `guests` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `dateExpiers` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `pfeed`
--

CREATE TABLE `pfeed` (
  `id` int(11) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pfeed`
--

INSERT INTO `pfeed` (`id`, `content`, `img`, `title`, `date`) VALUES
(1, 'Первое описание просто болезни на просто человеческом языке', NULL, 'Бяка', '2021-12-12 00:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `uid` varchar(2000) NOT NULL,
  `pwd` varchar(2048) NOT NULL,
  `category` int(11) NOT NULL,
  `token` varchar(256) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `uid`, `pwd`, `category`, `token`) VALUES
(1, 'test', '$2y$10$.oFInMWyYOZgV9CsP1HFDOsja3XM4y8yfjnNhg4v3TbWDpNueWyW6', 1, '58596faf56ae9025fd538cc9941e71eca7653e6c61ad9efe7ebe40cadb67f72d879e7e32e8cfa0fda046d9e01b3ca3ffc7135dbd2e700a598bb5b6ea8fa2b816156b3c7c1568c87ed4d51dafb1ac439cffd140fc4996451ed36bbadb8a22dd718a2693a0884cf9daf1dd405e7016867d0aa558e869eb13047d0d50d7d0637c9d');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dfeed`
--
ALTER TABLE `dfeed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `pfeed`
--
ALTER TABLE `pfeed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `dfeed`
--
ALTER TABLE `dfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `pfeed`
--
ALTER TABLE `pfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
