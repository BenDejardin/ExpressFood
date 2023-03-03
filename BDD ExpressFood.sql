-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 03 mars 2023 à 10:23
-- Version du serveur :  5.7.33
-- Version de PHP : 7.4.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `telephone` varchar(10) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `ville` varchar(100) NOT NULL,
  `code_postal` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`id_client`, `nom`, `prenom`, `email`, `mdp`, `telephone`, `adresse`, `ville`, `code_postal`) VALUES
(1, 'Dupont', 'Pierre', 'pierre.dupont@mail.com', '$5$setret$BG4MkQdYxdLv2KOoRkK.3omTkZhME3rKNpREJ3pgmI8', '0601020304', '12 rue des Lilas', 'Paris', '75000'),
(2, 'Martin', 'Sophie', 'sophie.martin@mail.com', '$5$setret$BG4MkQdYxdLv2KOoRkK.3omTkZhME3rKNpREJ3pgmI8', '0601020305', '7 rue des Roses', 'Lyon', '69000'),
(3, 'Girard', 'Julie', 'julie.girard@mail.com', '$5$setret$BG4MkQdYxdLv2KOoRkK.3omTkZhME3rKNpREJ3pgmI8', '0601020306', '24 avenue des Pommiers', 'Marseille', '13000');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `id_commande` int(11) NOT NULL,
  `date_commande` date NOT NULL,
  `client_id` int(11) NOT NULL,
  `livreur_id` int(11) NOT NULL,
  `prix_total` float NOT NULL,
  `statut` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`id_commande`, `date_commande`, `client_id`, `livreur_id`, `prix_total`, `statut`) VALUES
(1, '2023-02-23', 3, 1, 32.75, 1),
(2, '2023-02-24', 2, 2, 20, 1),
(3, '2023-02-24', 1, 1, 15.5, 0);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

CREATE TABLE `livreur` (
  `id_livreur` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `email` varchar(255) NOT NULL,
  `mdp` varchar(255) NOT NULL,
  `lattitude` float NOT NULL,
  `longitude` float NOT NULL,
  `statut` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`id_livreur`, `nom`, `prenom`, `email`, `mdp`, `lattitude`, `longitude`, `statut`) VALUES
(1, 'Durand', 'Marc', 'marc.durand@mail.com', '$5$setret$BG4MkQdYxdLv2KOoRkK.3omTkZhME3rKNpREJ3pgmI8', 48.8566, 2.35222, 1),
(2, 'Dubois', 'Anne', 'anne.dubois@mail.com', '$5$setret$BG4MkQdYxdLv2KOoRkK.3omTkZhME3rKNpREJ3pgmI8', 45.764, 4.83566, 0);

-- --------------------------------------------------------

--
-- Structure de la table `platcommande`
--

CREATE TABLE `platcommande` (
  `id_plat_commande` int(11) NOT NULL,
  `commande_id` int(11) NOT NULL,
  `plat_id` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `platcommande`
--

INSERT INTO `platcommande` (`id_plat_commande`, `commande_id`, `plat_id`, `quantite`) VALUES
(1, 3, 8, 2),
(2, 3, 7, 1),
(3, 2, 8, 1),
(4, 2, 6, 3),
(5, 1, 1, 2),
(6, 3, 6, 2),
(7, 3, 5, 1),
(8, 1, 4, 2);

-- --------------------------------------------------------

--
-- Structure de la table `platdujour`
--

CREATE TABLE `platdujour` (
  `id_plat` int(11) NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prix` decimal(4,2) NOT NULL,
  `type` varchar(7) NOT NULL,
  `date_plat` date NOT NULL,
  `stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `platdujour`
--

INSERT INTO `platdujour` (`id_plat`, `nom`, `prix`, `type`, `date_plat`, `stock`) VALUES
(1, 'Steak frites', '15.99', 'plat', '2023-02-23', 2),
(2, 'Poisson grillé', '12.99', 'plat', '2023-02-23', 0),
(3, 'Tarte aux pommes', '5.99', 'dessert', '2023-02-23', 1),
(4, 'Cookies', '3.99', 'dessert', '2023-02-23', 4),
(5, 'Poulet rôti', '13.99', 'plat', '2023-02-24', 10),
(6, 'Lasagne', '10.99', 'plat', '2023-02-24', 8),
(7, 'Crème brûlée', '6.99', 'dessert', '2023-02-24', 15),
(8, 'Brownie', '4.99', 'dessert', '2023-02-24', 7),
(9, 'Ratatouille', '11.99', 'plat', '2023-02-25', 35),
(10, 'Burger', '9.99', 'plat', '2023-02-25', 20),
(11, 'Fondant au chocolat', '7.99', 'dessert', '2023-02-25', 25),
(12, 'Tiramisu', '5.99', 'dessert', '2023-02-25', 30);

-- --------------------------------------------------------

--
-- Structure de la table `stocklivreur`
--

CREATE TABLE `stocklivreur` (
  `id_stock_livreur` int(11) NOT NULL,
  `id_livreur` int(11) NOT NULL,
  `id_plat` int(11) NOT NULL,
  `quantite` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stocklivreur`
--

INSERT INTO `stocklivreur` (`id_stock_livreur`, `id_livreur`, `id_plat`, `quantite`) VALUES
(16, 1, 5, 8),
(17, 1, 6, 3),
(18, 1, 7, 6),
(19, 1, 8, 5),
(20, 2, 5, 5),
(21, 2, 6, 4),
(22, 2, 7, 3),
(23, 2, 8, 6);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`id_client`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`id_commande`),
  ADD KEY `fk_commande_client_id` (`client_id`),
  ADD KEY `fk_commande_livreur_id` (`livreur_id`);

--
-- Index pour la table `livreur`
--
ALTER TABLE `livreur`
  ADD PRIMARY KEY (`id_livreur`);

--
-- Index pour la table `platcommande`
--
ALTER TABLE `platcommande`
  ADD PRIMARY KEY (`id_plat_commande`),
  ADD KEY `fk_platcommande_commande_id` (`commande_id`),
  ADD KEY `fk_platcommande_plat_id` (`plat_id`);

--
-- Index pour la table `platdujour`
--
ALTER TABLE `platdujour`
  ADD PRIMARY KEY (`id_plat`);

--
-- Index pour la table `stocklivreur`
--
ALTER TABLE `stocklivreur`
  ADD PRIMARY KEY (`id_stock_livreur`),
  ADD KEY `fk_stocklivreur_id_livreur` (`id_livreur`),
  ADD KEY `fk_stocklivreur_id_plat` (`id_plat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `id_client` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `commande`
--
ALTER TABLE `commande`
  MODIFY `id_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `livreur`
--
ALTER TABLE `livreur`
  MODIFY `id_livreur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `platcommande`
--
ALTER TABLE `platcommande`
  MODIFY `id_plat_commande` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `platdujour`
--
ALTER TABLE `platdujour`
  MODIFY `id_plat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `stocklivreur`
--
ALTER TABLE `stocklivreur`
  MODIFY `id_stock_livreur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `fk_commande_client_id` FOREIGN KEY (`client_id`) REFERENCES `client` (`id_client`),
  ADD CONSTRAINT `fk_commande_livreur_id` FOREIGN KEY (`livreur_id`) REFERENCES `livreur` (`id_livreur`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `platcommande`
--
ALTER TABLE `platcommande`
  ADD CONSTRAINT `fk_platcommande_commande_id` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id_commande`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_platcommande_plat_id` FOREIGN KEY (`plat_id`) REFERENCES `platdujour` (`id_plat`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `stocklivreur`
--
ALTER TABLE `stocklivreur`
  ADD CONSTRAINT `fk_stocklivreur_id_livreur` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id_livreur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_stocklivreur_id_plat` FOREIGN KEY (`id_plat`) REFERENCES `platdujour` (`id_plat`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
