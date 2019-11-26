-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Sam 03 Décembre 2016 à 12:04
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `sondagedb`
--

-- --------------------------------------------------------

--
-- Structure de la table `favoris`
--

CREATE TABLE IF NOT EXISTS `favoris` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_sondage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(255) NOT NULL,
  `image_groupe` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `groupe`
--

INSERT INTO `groupe` (`id`, `nom_groupe`, `image_groupe`) VALUES
(1, 'deagle', 'imagedugroupe');

-- --------------------------------------------------------

--
-- Structure de la table `joindre_groupe`
--

CREATE TABLE IF NOT EXISTS `joindre_groupe` (
  `id_jg` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  PRIMARY KEY (`id_jg`),
  KEY `id_user` (`id_user`),
  KEY `id_groupe` (`id_groupe`),
  KEY `id_groupe_2` (`id_groupe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `joindre_groupe`
--

INSERT INTO `joindre_groupe` (`id_jg`, `id_user`, `id_groupe`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `proposition`
--

CREATE TABLE IF NOT EXISTS `proposition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_proposition` varchar(255) NOT NULL,
  `intitule` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE IF NOT EXISTS `question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre_question` varchar(255) NOT NULL,
  `id_sondage` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_sondage` (`id_sondage`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `reponse`
--

CREATE TABLE IF NOT EXISTS `reponse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date` date NOT NULL,
  `reponselibre` varchar(255) NOT NULL,
  `id_question` int(11) NOT NULL,
  `id_proposition` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_question` (`id_question`),
  KEY `id_proposition` (`id_proposition`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `sondage`
--

CREATE TABLE IF NOT EXISTS `sondage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) NOT NULL,
  `datecreation` date NOT NULL,
  `type` tinyint(4) NOT NULL,
  `id_user` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Contenu de la table `sondage`
--

INSERT INTO `sondage` (`id`, `titre`, `datecreation`, `type`, `id_user`) VALUES
(1, 'Sport', '2016-11-01', 1, 1),
(2, 'gastro', '2016-11-02', 0, 3);

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomprenom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id`, `nomprenom`, `email`, `image`, `password`) VALUES
(1, 'yahyaouiselim', 'selimyahyaoui@esprit.tn', 'azadad', '0'),
(3, 'elyes', 'elyes@esprit.tn', 'afafafafaf', '1'),
(37, 'tt', 'tt', 'tt', 'ss'),
(38, 'oussema', 'aaa', 'rr', '120');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `favoris`
--
ALTER TABLE `favoris`
  ADD CONSTRAINT `favoris_ibfk_1` FOREIGN KEY (`id_sondage`) REFERENCES `sondage` (`id`);

--
-- Contraintes pour la table `joindre_groupe`
--
ALTER TABLE `joindre_groupe`
  ADD CONSTRAINT `joindre_groupe_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`),
  ADD CONSTRAINT `joindre_groupe_ibfk_2` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id`);

--
-- Contraintes pour la table `question`
--
ALTER TABLE `question`
  ADD CONSTRAINT `question_ibfk_1` FOREIGN KEY (`id_sondage`) REFERENCES `sondage` (`id`);

--
-- Contraintes pour la table `reponse`
--
ALTER TABLE `reponse`
  ADD CONSTRAINT `reponse_ibfk_1` FOREIGN KEY (`id_question`) REFERENCES `question` (`id`),
  ADD CONSTRAINT `reponse_ibfk_2` FOREIGN KEY (`id_proposition`) REFERENCES `proposition` (`id`);

--
-- Contraintes pour la table `sondage`
--
ALTER TABLE `sondage`
  ADD CONSTRAINT `sondage_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `utilisateur` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
