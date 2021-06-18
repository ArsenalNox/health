-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 18 2021 г., 22:35
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
-- Структура таблицы `doctors`
--

CREATE TABLE `doctors` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL,
  `surename` varchar(200) NOT NULL,
  `patronymic` varchar(200) NOT NULL,
  `speciality` int(8) NOT NULL,
  `schedule` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `surename`, `patronymic`, `speciality`, `schedule`) VALUES
(1, 'Иван', 'Иванов', 'Иванович', 1, 1);

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
-- Структура таблицы `medcardhistory`
--

CREATE TABLE `medcardhistory` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `action` varchar(2048) NOT NULL,
  `target` varchar(2048) NOT NULL,
  `result` varchar(2048) NOT NULL,
  `doctor` int(11) NOT NULL
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
-- Структура таблицы `schedules`
--

CREATE TABLE `schedules` (
  `id` int(11) NOT NULL,
  `mons` time NOT NULL,
  `mone` time NOT NULL,
  `tues` time NOT NULL,
  `tuee` time NOT NULL,
  `weds` time NOT NULL,
  `wede` time NOT NULL,
  `thus` time NOT NULL,
  `thue` time NOT NULL,
  `fris` time NOT NULL,
  `frie` time NOT NULL,
  `sats` time NOT NULL,
  `sate` time NOT NULL,
  `suns` time NOT NULL,
  `sune` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `schedules`
--

INSERT INTO `schedules` (`id`, `mons`, `mone`, `tues`, `tuee`, `weds`, `wede`, `thus`, `thue`, `fris`, `frie`, `sats`, `sate`, `suns`, `sune`) VALUES
(1, '08:00:00', '22:00:00', '08:00:00', '22:00:00', '08:00:00', '22:00:00', '08:00:00', '22:00:00', '08:00:00', '22:00:00', '08:00:00', '22:00:00', '08:00:00', '22:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `specialty`
--

CREATE TABLE `specialty` (
  `id` int(11) NOT NULL,
  `name` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `specialty`
--

INSERT INTO `specialty` (`id`, `name`) VALUES
(1, 'Терапевт');

-- --------------------------------------------------------

--
-- Структура таблицы `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pwd` varchar(2048) NOT NULL,
  `token` varchar(256) DEFAULT 'NULL',
  `category` int(11) DEFAULT NULL,
  `name` varchar(2000) NOT NULL,
  `surename` varchar(2000) DEFAULT NULL,
  `patronymic` varchar(2000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `users`
--

INSERT INTO `users` (`id`, `email`, `pwd`, `token`, `category`, `name`, `surename`, `patronymic`) VALUES
(1, 'test@test.ru', '$2y$10$.oFInMWyYOZgV9CsP1HFDOsja3XM4y8yfjnNhg4v3TbWDpNueWyW6', '334d0b2c27c24a02bc12982915169aed27e753f3ab97212ece8c9407baff9d6ed151aec7190fce7adfb534adc92e116aefd84e7bff25c908759bbf1b21f273db7be50a017e1a89f505e636e2f5b928f0018fe39870c430be50dc58c23f02aaf0e24101e42ba782701bf5c962aaf78c8d37c4952702e54cff721082626b0d52ef', 1, 'test', '', ''),
(2, 'test1@test.ru', '$2y$10$KSRlzOGTsgbr8myIDI1q.e2cfPIW9pjC/jMznsDQS8Sv9IbXVKkq.', 'a88eae7b0d43fee0cd76053b490332e7dab48526df0aff8198488ed9a0b4eebfca23e0e775620adaeddf94ec977aca1110c86bf1a26dd49a8784ab9e0c89c9ff091e71c0c304d89287a8d56457bd3c4c05d0cbff6d18938a89fe7c5fe60594a2b0aaafe5a704d998d1ca4290db5838046e21c85cc93e07f8652214f045ade996', NULL, 'testAdam', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `dfeed`
--
ALTER TABLE `dfeed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule` (`schedule`),
  ADD KEY `speciality` (`speciality`);

--
-- Индексы таблицы `guests`
--
ALTER TABLE `guests`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `medcardhistory`
--
ALTER TABLE `medcardhistory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `uid` (`uid`),
  ADD KEY `doctor` (`doctor`);

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
-- Индексы таблицы `schedules`
--
ALTER TABLE `schedules`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `specialty`
--
ALTER TABLE `specialty`
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
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `medcardhistory`
--
ALTER TABLE `medcardhistory`
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
-- AUTO_INCREMENT для таблицы `schedules`
--
ALTER TABLE `schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `specialty`
--
ALTER TABLE `specialty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`schedule`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`speciality`) REFERENCES `specialty` (`id`);

--
-- Ограничения внешнего ключа таблицы `medcardhistory`
--
ALTER TABLE `medcardhistory`
  ADD CONSTRAINT `medcardhistory_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `medcardhistory_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `doctors` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
