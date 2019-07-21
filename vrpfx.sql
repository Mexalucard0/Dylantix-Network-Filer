-- phpMyAdmin SQL Dump
-- version 4.6.6deb4
-- https://www.phpmyadmin.net/
--
-- Vært: localhost:3306
-- Genereringstid: 20. 07 2019 kl. 22:12:24
-- Serverversion: 10.3.15-MariaDB-1:10.3.15+maria~stretch
-- PHP-version: 7.0.33-0+deb9u3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `vrpfx`
--

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `logging`
--

CREATE TABLE `logging` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) NOT NULL,
  `bank` int(11) NOT NULL,
  `weapons` text NOT NULL,
  `inventory` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `phone_app_chat`
--

CREATE TABLE `phone_app_chat` (
  `id` int(11) NOT NULL,
  `channel` varchar(20) NOT NULL,
  `message` varchar(255) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `phone_calls`
--

CREATE TABLE `phone_calls` (
  `id` int(11) NOT NULL,
  `owner` varchar(10) NOT NULL COMMENT 'Num tel proprio',
  `num` varchar(10) NOT NULL COMMENT 'Num reférence du contact',
  `incoming` int(11) NOT NULL COMMENT 'Défini si on est à l''origine de l''appels',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `accepts` int(11) NOT NULL COMMENT 'Appels accepter ou pas'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `phone_messages`
--

CREATE TABLE `phone_messages` (
  `id` int(11) NOT NULL,
  `transmitter` varchar(10) NOT NULL,
  `receiver` varchar(10) NOT NULL,
  `message` varchar(255) NOT NULL DEFAULT '0',
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `isRead` int(11) NOT NULL DEFAULT 0,
  `owner` int(11) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `phone_users_contacts`
--

CREATE TABLE `phone_users_contacts` (
  `id` int(11) NOT NULL,
  `identifier` varchar(60) CHARACTER SET utf8mb4 DEFAULT NULL,
  `number` varchar(10) CHARACTER SET utf8mb4 DEFAULT NULL,
  `display` varchar(64) CHARACTER SET utf8mb4 NOT NULL DEFAULT '-1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `rollback`
--

CREATE TABLE `rollback` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `before_wallet` int(11) NOT NULL,
  `after_wallet` int(11) NOT NULL,
  `before_bank` int(11) NOT NULL,
  `after_bank` int(11) NOT NULL,
  `before_weapons` text NOT NULL,
  `after_weapons` text NOT NULL,
  `before_inventory` text NOT NULL,
  `after_inventory` text NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_srv_data`
--

CREATE TABLE `vrp_srv_data` (
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_users`
--

CREATE TABLE `vrp_users` (
  `id` int(11) NOT NULL,
  `last_login` varchar(100) DEFAULT NULL,
  `whitelisted` tinyint(1) DEFAULT NULL,
  `banned` tinyint(1) DEFAULT NULL,
  `DmvTest` int(11) DEFAULT 0,
  `warnings` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_business`
--

CREATE TABLE `vrp_user_business` (
  `user_id` int(11) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `capital` int(11) DEFAULT NULL,
  `laundered` int(11) DEFAULT NULL,
  `reset_timestamp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_data`
--

CREATE TABLE `vrp_user_data` (
  `user_id` int(11) NOT NULL,
  `dkey` varchar(100) NOT NULL,
  `dvalue` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_homes`
--

CREATE TABLE `vrp_user_homes` (
  `user_id` int(11) NOT NULL,
  `home` varchar(255) DEFAULT NULL,
  `number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_identities`
--

CREATE TABLE `vrp_user_identities` (
  `user_id` int(11) NOT NULL,
  `registration` varchar(20) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `firstname` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_ids`
--

CREATE TABLE `vrp_user_ids` (
  `identifier` varchar(100) NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_moneys`
--

CREATE TABLE `vrp_user_moneys` (
  `user_id` int(11) NOT NULL,
  `wallet` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Struktur-dump for tabellen `vrp_user_vehicles`
--

CREATE TABLE `vrp_user_vehicles` (
  `user_id` int(11) NOT NULL,
  `vehicle` varchar(255) NOT NULL,
  `veh_type` varchar(255) NOT NULL DEFAULT 'default',
  `vehicle_plate` varchar(255) NOT NULL,
  `vehicle_colorprimary` varchar(255) DEFAULT NULL,
  `vehicle_colorsecondary` varchar(255) DEFAULT NULL,
  `vehicle_pearlescentcolor` varchar(255) DEFAULT NULL,
  `vehicle_wheelcolor` varchar(255) DEFAULT NULL,
  `vehicle_plateindex` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor1` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor2` varchar(255) DEFAULT NULL,
  `vehicle_neoncolor3` varchar(255) DEFAULT NULL,
  `vehicle_windowtint` varchar(255) DEFAULT NULL,
  `vehicle_wheeltype` varchar(255) DEFAULT NULL,
  `vehicle_mods0` varchar(255) DEFAULT NULL,
  `vehicle_mods1` varchar(255) DEFAULT NULL,
  `vehicle_mods2` varchar(255) DEFAULT NULL,
  `vehicle_mods3` varchar(255) DEFAULT NULL,
  `vehicle_mods4` varchar(255) DEFAULT NULL,
  `vehicle_mods5` varchar(255) DEFAULT NULL,
  `vehicle_mods6` varchar(255) DEFAULT NULL,
  `vehicle_mods7` varchar(255) DEFAULT NULL,
  `vehicle_mods8` varchar(255) DEFAULT NULL,
  `vehicle_mods9` varchar(255) DEFAULT NULL,
  `vehicle_mods10` varchar(255) DEFAULT NULL,
  `vehicle_mods11` varchar(255) DEFAULT NULL,
  `vehicle_mods12` varchar(255) DEFAULT NULL,
  `vehicle_mods13` varchar(255) DEFAULT NULL,
  `vehicle_mods14` varchar(255) DEFAULT NULL,
  `vehicle_mods15` varchar(255) DEFAULT NULL,
  `vehicle_mods16` varchar(255) DEFAULT NULL,
  `vehicle_turbo` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_tiresmoke` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_xenon` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_mods23` varchar(255) DEFAULT NULL,
  `vehicle_mods24` varchar(255) DEFAULT NULL,
  `vehicle_neon0` varchar(255) DEFAULT NULL,
  `vehicle_neon1` varchar(255) DEFAULT NULL,
  `vehicle_neon2` varchar(255) DEFAULT NULL,
  `vehicle_neon3` varchar(255) DEFAULT NULL,
  `vehicle_bulletproof` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor1` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor2` varchar(255) DEFAULT NULL,
  `vehicle_smokecolor3` varchar(255) DEFAULT NULL,
  `vehicle_modvariation` varchar(255) NOT NULL DEFAULT 'off',
  `vehicle_name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Begrænsninger for dumpede tabeller
--

--
-- Indeks for tabel `logging`
--
ALTER TABLE `logging`
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indeks for tabel `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `phone_calls`
--
ALTER TABLE `phone_calls`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `phone_messages`
--
ALTER TABLE `phone_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `rollback`
--
ALTER TABLE `rollback`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `vrp_srv_data`
--
ALTER TABLE `vrp_srv_data`
  ADD PRIMARY KEY (`dkey`);

--
-- Indeks for tabel `vrp_users`
--
ALTER TABLE `vrp_users`
  ADD PRIMARY KEY (`id`);

--
-- Indeks for tabel `vrp_user_business`
--
ALTER TABLE `vrp_user_business`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks for tabel `vrp_user_data`
--
ALTER TABLE `vrp_user_data`
  ADD PRIMARY KEY (`user_id`,`dkey`);

--
-- Indeks for tabel `vrp_user_homes`
--
ALTER TABLE `vrp_user_homes`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `home` (`home`,`number`);

--
-- Indeks for tabel `vrp_user_identities`
--
ALTER TABLE `vrp_user_identities`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `registration` (`registration`),
  ADD KEY `phone` (`phone`);

--
-- Indeks for tabel `vrp_user_ids`
--
ALTER TABLE `vrp_user_ids`
  ADD PRIMARY KEY (`identifier`),
  ADD KEY `fk_user_ids_users` (`user_id`);

--
-- Indeks for tabel `vrp_user_moneys`
--
ALTER TABLE `vrp_user_moneys`
  ADD PRIMARY KEY (`user_id`);

--
-- Indeks for tabel `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  ADD PRIMARY KEY (`user_id`,`vehicle`);

--
-- Brug ikke AUTO_INCREMENT for slettede tabeller
--

--
-- Tilføj AUTO_INCREMENT i tabel `phone_app_chat`
--
ALTER TABLE `phone_app_chat`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `phone_calls`
--
ALTER TABLE `phone_calls`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `phone_messages`
--
ALTER TABLE `phone_messages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `phone_users_contacts`
--
ALTER TABLE `phone_users_contacts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `rollback`
--
ALTER TABLE `rollback`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- Tilføj AUTO_INCREMENT i tabel `vrp_users`
--
ALTER TABLE `vrp_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1401;
--
-- Begrænsninger for dumpede tabeller
--

--
-- Begrænsninger for tabel `logging`
--
ALTER TABLE `logging`
  ADD CONSTRAINT `logging_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`);

--
-- Begrænsninger for tabel `vrp_user_business`
--
ALTER TABLE `vrp_user_business`
  ADD CONSTRAINT `fk_user_business_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `vrp_user_data`
--
ALTER TABLE `vrp_user_data`
  ADD CONSTRAINT `fk_user_data_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `vrp_user_homes`
--
ALTER TABLE `vrp_user_homes`
  ADD CONSTRAINT `fk_user_homes_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `vrp_user_identities`
--
ALTER TABLE `vrp_user_identities`
  ADD CONSTRAINT `fk_user_identities_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `vrp_user_ids`
--
ALTER TABLE `vrp_user_ids`
  ADD CONSTRAINT `fk_user_ids_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `vrp_user_moneys`
--
ALTER TABLE `vrp_user_moneys`
  ADD CONSTRAINT `fk_user_moneys_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

--
-- Begrænsninger for tabel `vrp_user_vehicles`
--
ALTER TABLE `vrp_user_vehicles`
  ADD CONSTRAINT `fk_user_vehicles_users` FOREIGN KEY (`user_id`) REFERENCES `vrp_users` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
