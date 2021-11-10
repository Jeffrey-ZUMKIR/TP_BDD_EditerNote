-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mer. 10 nov. 2021 à 10:32
-- Version du serveur :  5.7.31
-- Version de PHP : 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `exlogin`
--

-- --------------------------------------------------------

--
-- Structure de la table `compte`
--

DROP TABLE IF EXISTS `compte`;
CREATE TABLE IF NOT EXISTS `compte` (
  `id_compte` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `passwd` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `nom` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `prenom` varchar(20) COLLATE latin1_general_cs NOT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`id_compte`),
  KEY `FK_CptTyp` (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Déchargement des données de la table `compte`
--

INSERT INTO `compte` (`id_compte`, `login`, `passwd`, `nom`, `prenom`, `id_type`) VALUES
(1, 'GraMad', '1234', 'Madembo', 'Grace', 2),
(2, 'NicVal', '1234', 'Valentin', 'Nicolas', 2),
(3, 'NicLeh', '1234', 'Lehmann', 'Nicolas', 2),
(4, 'MarSen', '1234', 'Sensei', 'Marine', 2),
(5, 'JefZum', '1234', 'Zumkir', 'Jeffrey', 3),
(6, 'BapRif', '1234', 'Riff', 'Baptiste', 3),
(7, 'MarSch', '1234', 'Schwartz', 'Marine', 3),
(8, 'HugEit', '1234', 'Eitel', 'Hugo', 3),
(10, 'LucCor', '1234', 'Cornu', 'Luc', 3),
(11, 'JerHat', '1234', 'Hatton', 'Jerome', 1),
(12, 'EliEck', '1234', 'Eckle', 'Elias', 3);

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

DROP TABLE IF EXISTS `matiere`;
CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `lib_matiere` varchar(20) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Déchargement des données de la table `matiere`
--

INSERT INTO `matiere` (`id_matiere`, `lib_matiere`) VALUES
(1, 'Web'),
(2, 'Algo'),
(3, 'GD'),
(4, 'Japonais');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `valeur` int(11) NOT NULL,
  `description` varchar(100) COLLATE latin1_general_cs DEFAULT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_compte` int(11) NOT NULL,
  PRIMARY KEY (`id_note`),
  KEY `FK_NteMat` (`id_matiere`),
  KEY `FK_NteCptCas` (`id_compte`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_note`, `valeur`, `description`, `id_matiere`, `id_compte`) VALUES
(1, 16, 'Eval 1', 1, 5),
(2, 13, 'Eval 2', 1, 5),
(3, 17, 'Eval 1', 1, 7),
(4, 15, 'Eval 2', 1, 7),
(5, 15, 'Eval 1', 1, 6),
(7, 18, 'Eval 1', 1, 8),
(8, 2, 'Eval 2', 1, 8),
(9, 15, 'Eval 1', 3, 5),
(10, 16, 'Eval 1', 3, 7),
(11, 17, 'Eval 1', 3, 6),
(12, 16, 'Eval 1', 3, 8),
(13, 17, 'Eval 1', 2, 5),
(14, 16, 'Eval 1', 2, 7),
(15, 15, 'Eval 1', 2, 6),
(16, 16, 'Eval 1', 2, 8),
(17, 15, 'Eval 1', 4, 5),
(18, 18, 'Eval 1', 4, 7),
(20, 14, 'Eval 1', 1, 10),
(21, 16, 'Eval 2', 1, 10),
(23, 2, 'Eval 2', 1, 6);

-- --------------------------------------------------------

--
-- Structure de la table `type`
--

DROP TABLE IF EXISTS `type`;
CREATE TABLE IF NOT EXISTS `type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `lib_type` varchar(20) COLLATE latin1_general_cs NOT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_general_cs;

--
-- Déchargement des données de la table `type`
--

INSERT INTO `type` (`id_type`, `lib_type`) VALUES
(1, 'admin'),
(2, 'professeur'),
(3, 'etudiant');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `compte`
--
ALTER TABLE `compte`
  ADD CONSTRAINT `FK_CptTyp` FOREIGN KEY (`id_type`) REFERENCES `type` (`id_type`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `FK_NteCptCas` FOREIGN KEY (`id_compte`) REFERENCES `compte` (`id_compte`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_NteMat` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
