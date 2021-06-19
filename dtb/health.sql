-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 19 2021 г., 06:51
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
-- Структура таблицы `appointments`
--

CREATE TABLE `appointments` (
  `id` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `uid` int(11) DEFAULT NULL,
  `guid` int(11) DEFAULT NULL,
  `date` date NOT NULL,
  `time` time NOT NULL,
  `sid` int(11) NOT NULL,
  `state` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `appointments`
--

INSERT INTO `appointments` (`id`, `did`, `uid`, `guid`, `date`, `time`, `sid`, `state`) VALUES
(1, 1, 1, NULL, '2021-12-12', '12:12:00', 1, 'подтверждён'),
(2, 1, 1, NULL, '2021-06-19', '03:00:21', 1, 'Ожидает подтвержения'),
(3, 1, 1, NULL, '2021-06-19', '03:00:39', 1, 'Ожидает подтвержения'),
(4, 1, 1, NULL, '2021-06-19', '03:47:05', 1, 'Ожидает подтвержения'),
(7, 1, NULL, 1, '2021-06-19', '03:53:03', 1, 'Ожидает подтвержения'),
(8, 1, 1, NULL, '2021-04-14', '12:12:00', 1, 'завершён');

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
-- Структура таблицы `depos`
--

CREATE TABLE `depos` (
  `id` int(11) NOT NULL,
  `depo` varchar(2000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `depos`
--

INSERT INTO `depos` (`id`, `depo`) VALUES
(1, 'Терапевтическое'),
(2, 'Гинекологическое ');

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
-- Структура таблицы `docsevices`
--

CREATE TABLE `docsevices` (
  `id` int(11) NOT NULL,
  `did` int(11) NOT NULL,
  `sid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `docsevices`
--

INSERT INTO `docsevices` (`id`, `did`, `sid`) VALUES
(1, 1, 1);

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
  `schedule` int(8) NOT NULL,
  `departament` int(11) NOT NULL,
  `room` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `doctors`
--

INSERT INTO `doctors` (`id`, `name`, `surename`, `patronymic`, `speciality`, `schedule`, `departament`, `room`) VALUES
(1, 'Иван', 'Иванов', 'Иванович', 1, 1, 1, 102),
(2, 'Сергеев', 'Сергей', 'Сергеевич', 1, 1, 1, 103);

-- --------------------------------------------------------

--
-- Структура таблицы `guests`
--

CREATE TABLE `guests` (
  `id` int(11) NOT NULL,
  `dateCreated` datetime NOT NULL,
  `name` varchar(200) NOT NULL,
  `phone` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `guests`
--

INSERT INTO `guests` (`id`, `dateCreated`, `name`, `phone`) VALUES
(1, '2021-06-19 00:00:00', 'Игорь', '76058928888');

-- --------------------------------------------------------

--
-- Структура таблицы `medcardhistory`
--

CREATE TABLE `medcardhistory` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `action` varchar(2048) NOT NULL,
  `textContent` varchar(5552) NOT NULL,
  `result` varchar(2048) NOT NULL,
  `doctor` int(11) NOT NULL,
  `appt` int(11) NOT NULL,
  `pdf` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `medcardhistory`
--

INSERT INTO `medcardhistory` (`id`, `uid`, `action`, `textContent`, `result`, `doctor`, `appt`, `pdf`) VALUES
(1, 2, 'pills', 'Lorem ipsum dolor sit amet, consectetur adipisicing elit. Iure esse suscipit praesentium illum debitis omnis, quaerat dolorum, dolor corrupti dicta voluptates eligendi aperiam expedita mollitia ea, maxime sunt voluptate optia\"', 'Без изменений', 1, 8, NULL);

-- --------------------------------------------------------

--
-- Структура таблицы `pfeed`
--

CREATE TABLE `pfeed` (
  `id` int(11) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `img` varchar(1000) DEFAULT NULL,
  `title` varchar(256) NOT NULL,
  `date` datetime NOT NULL,
  `type` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `pfeed`
--

INSERT INTO `pfeed` (`id`, `content`, `img`, `title`, `date`, `type`) VALUES
(1, 'Объявляется начало вакцинации против covid-19, вакцинация бесплатная и проводится с 11:00 до 16:00 каждый день. ', NULL, 'Вакцинация', '2021-12-12 00:00:00', 'Вакцинация'),
(2, 'Кампания здоровая еда в каждый дом открывается! Совместно с МАГАЗИН1 Мы предлагаем вам скидки на здоровую пищу в размере до 70%.', NULL, 'Акция совместно с МАГАЗИН1', '2021-12-11 00:00:00', 'Акция');

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
-- Структура таблицы `services`
--

CREATE TABLE `services` (
  `id` int(11) NOT NULL,
  `name` varchar(2000) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `price` int(11) NOT NULL,
  `room` int(11) DEFAULT NULL,
  `max` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `services`
--

INSERT INTO `services` (`id`, `name`, `description`, `price`, `room`, `max`) VALUES
(1, 'Приём к терапевту', 'Записаться на пирём к терапевту', 0, 101, 20);

-- --------------------------------------------------------

--
-- Структура таблицы `specialty`
--

CREATE TABLE `specialty` (
  `id` int(11) NOT NULL,
  `specialty` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `specialty`
--

INSERT INTO `specialty` (`id`, `specialty`) VALUES
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
(2, 'test1@test.ru', '$2y$10$KSRlzOGTsgbr8myIDI1q.e2cfPIW9pjC/jMznsDQS8Sv9IbXVKkq.', 'd1718923556331fc6addd384cbc33772b5506dd0d6c462815fa0fe4c859a715e0053284e3fc5bc994500ba730745c24b9d10511ae2d850f2435b1ba941d838f6061e0055f0e496dec981f9b3bd8bb896386069583a0ac249d4e60bc081d3a2cd96c60bf72d9a6621fef783d83f2d5b6c944cb55bdd3043f5150fa436083f8e86', NULL, 'testAdam', NULL, NULL),
(3, 'test2@test.ru', '$2y$10$cKh1cGuSx1VDlmtQ5wqyOeitcgMZF831zj4JBiXPg9n/CFdzWTX8S', '47e0db2df85fac0b4bed30c8c525867e81928950ecc53e235b994d276c7063f05f6c4dfba3a9c0641f859411dc2c8ffd1c3255c637ec06542c33a671de149026d0a0f591605e3a075e9232757d686e8af9f87d3fd77b6b6f8dab1c88e99f965566bc7a762be8be1626d44b67ac8f337d78ed51673a24f9d1eac7422f83e3ad3a', NULL, 'testEve', NULL, NULL);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `did` (`did`),
  ADD KEY `uid` (`uid`),
  ADD KEY `sid` (`sid`);

--
-- Индексы таблицы `depos`
--
ALTER TABLE `depos`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `dfeed`
--
ALTER TABLE `dfeed`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `docsevices`
--
ALTER TABLE `docsevices`
  ADD PRIMARY KEY (`id`),
  ADD KEY `did` (`did`),
  ADD KEY `sid` (`sid`);

--
-- Индексы таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `schedule` (`schedule`),
  ADD KEY `speciality` (`speciality`),
  ADD KEY `departament` (`departament`);

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
  ADD KEY `doctor` (`doctor`),
  ADD KEY `appt` (`appt`);

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
-- Индексы таблицы `services`
--
ALTER TABLE `services`
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
-- AUTO_INCREMENT для таблицы `appointments`
--
ALTER TABLE `appointments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `depos`
--
ALTER TABLE `depos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `dfeed`
--
ALTER TABLE `dfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `docsevices`
--
ALTER TABLE `docsevices`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `guests`
--
ALTER TABLE `guests`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `medcardhistory`
--
ALTER TABLE `medcardhistory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `pfeed`
--
ALTER TABLE `pfeed`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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
-- AUTO_INCREMENT для таблицы `services`
--
ALTER TABLE `services`
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `appointments`
--
ALTER TABLE `appointments`
  ADD CONSTRAINT `appointments_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `appointments_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `services` (`id`),
  ADD CONSTRAINT `appointments_ibfk_3` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `appointments_ibfk_4` FOREIGN KEY (`sid`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `docsevices`
--
ALTER TABLE `docsevices`
  ADD CONSTRAINT `docsevices_ibfk_1` FOREIGN KEY (`did`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `docsevices_ibfk_2` FOREIGN KEY (`sid`) REFERENCES `services` (`id`);

--
-- Ограничения внешнего ключа таблицы `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_ibfk_1` FOREIGN KEY (`schedule`) REFERENCES `schedules` (`id`),
  ADD CONSTRAINT `doctors_ibfk_2` FOREIGN KEY (`speciality`) REFERENCES `specialty` (`id`),
  ADD CONSTRAINT `doctors_ibfk_3` FOREIGN KEY (`departament`) REFERENCES `depos` (`id`);

--
-- Ограничения внешнего ключа таблицы `medcardhistory`
--
ALTER TABLE `medcardhistory`
  ADD CONSTRAINT `medcardhistory_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `medcardhistory_ibfk_2` FOREIGN KEY (`doctor`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `medcardhistory_ibfk_3` FOREIGN KEY (`appt`) REFERENCES `appointments` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
