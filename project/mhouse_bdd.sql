-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Client :  127.0.0.1
-- Généré le :  Ven 19 Mai 2017 à 14:41
-- Version du serveur :  5.7.14
-- Version de PHP :  5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `mhouse_bdd`
--

-- --------------------------------------------------------

--
-- Structure de la table `capteurs`
--

CREATE TABLE `capteurs` (
  `id_capteur` int(11) NOT NULL,
  `nom_capteur` varchar(255) CHARACTER SET utf8 NOT NULL,
  `type_capteur` varchar(255) CHARACTER SET utf8 NOT NULL,
  `date_d_ajout` date NOT NULL,
  `id_utilisateur` int(11) NOT NULL,
  `id_piece` varchar(255) CHARACTER SET utf8 NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `capteurs`
--

INSERT INTO `capteurs` (`id_capteur`, `nom_capteur`, `type_capteur`, `date_d_ajout`, `id_utilisateur`, `id_piece`) VALUES
(1, 'Capteur1', 'Lumiere', '2017-05-17', 2, '1'),
(2, 'Capteur2', 'Temperature', '2017-05-02', 2, '2');

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE `commentaire` (
  `id` int(11) NOT NULL,
  `mail` varchar(255) NOT NULL,
  `commentaire` text NOT NULL,
  `nom` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4;

--
-- Contenu de la table `commentaire`
--

INSERT INTO `commentaire` (`id`, `mail`, `commentaire`, `nom`) VALUES
(1, 'email@email', 'azdazdazda', 'truc'),
(2, 'vincent@bestSchoolEver', 'Hello world !', 'vincent');

-- --------------------------------------------------------

--
-- Structure de la table `email`
--

CREATE TABLE `email` (
  `email` varchar(255) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `historique_des_modifications`
--

CREATE TABLE `historique_des_modifications` (
  `id_historique` int(11) NOT NULL,
  `date_installation` varchar(255) NOT NULL,
  `duree_de_vie` varchar(255) NOT NULL,
  `durée_garantie` varchar(255) NOT NULL,
  `id_capteur` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `piece`
--

CREATE TABLE `piece` (
  `id_piece` int(11) NOT NULL,
  `nom_piece` varchar(255) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `piece`
--

INSERT INTO `piece` (`id_piece`, `nom_piece`, `id_utilisateur`) VALUES
(1, 'Salle de Bain', 2),
(2, 'Salon', 2);

-- --------------------------------------------------------

--
-- Structure de la table `telephone`
--

CREATE TABLE `telephone` (
  `numero_telephone` int(11) NOT NULL,
  `id_utilisateur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `id_utilisateur` int(11) NOT NULL,
  `pseudo` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `prenom` varchar(255) NOT NULL,
  `nom` varchar(255) NOT NULL,
  `adresse` varchar(255) NOT NULL,
  `sexe` varchar(255) NOT NULL,
  `date_naissance` date NOT NULL,
  `email` varchar(255) NOT NULL,
  `admin` varchar(5) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Contenu de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `pseudo`, `pass`, `prenom`, `nom`, `adresse`, `sexe`, `date_naissance`, `email`, `admin`) VALUES
(2, 'jean', 'pass', 'jean', 'jean', 'rue des marguerites', 'Homme', '2001-01-01', 'jean@jean.fr', 'false'),
(1, 'admin', 'admin', 'admin', 'admin', 'admin', 'homme', '2000-01-01', 'admin@admin.fr', 'true');

-- --------------------------------------------------------

--
-- Structure de la table `valeurs_capteur`
--

CREATE TABLE `valeurs_capteur` (
  `id_valeur` int(11) NOT NULL,
  `valeur` int(11) NOT NULL,
  `date_mesure` date NOT NULL,
  `id_capteur` int(11) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Index pour les tables exportées
--

--
-- Index pour la table `capteurs`
--
ALTER TABLE `capteurs`
  ADD PRIMARY KEY (`id_capteur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`),
  ADD KEY `id_piece` (`id_piece`);

--
-- Index pour la table `commentaire`
--
ALTER TABLE `commentaire`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `email`
--
ALTER TABLE `email`
  ADD PRIMARY KEY (`email`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `historique_des_modifications`
--
ALTER TABLE `historique_des_modifications`
  ADD PRIMARY KEY (`id_historique`),
  ADD KEY `id_capteur` (`id_capteur`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `piece`
--
ALTER TABLE `piece`
  ADD PRIMARY KEY (`id_piece`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `telephone`
--
ALTER TABLE `telephone`
  ADD PRIMARY KEY (`numero_telephone`),
  ADD KEY `id_utilisateur` (`id_utilisateur`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`id_utilisateur`);

--
-- Index pour la table `valeurs_capteur`
--
ALTER TABLE `valeurs_capteur`
  ADD PRIMARY KEY (`id_valeur`),
  ADD KEY `valeur` (`valeur`),
  ADD KEY `id_capteur` (`id_capteur`);

--
-- AUTO_INCREMENT pour les tables exportées
--

--
-- AUTO_INCREMENT pour la table `capteurs`
--
ALTER TABLE `capteurs`
  MODIFY `id_capteur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT pour la table `commentaire`
--
ALTER TABLE `commentaire`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `historique_des_modifications`
--
ALTER TABLE `historique_des_modifications`
  MODIFY `id_historique` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `piece`
--
ALTER TABLE `piece`
  MODIFY `id_piece` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT pour la table `valeurs_capteur`
--
ALTER TABLE `valeurs_capteur`
  MODIFY `id_valeur` int(11) NOT NULL AUTO_INCREMENT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
