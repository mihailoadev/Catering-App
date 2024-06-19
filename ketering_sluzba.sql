-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 26, 2024 at 04:28 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ketering_sluzba`
--
CREATE DATABASE IF NOT EXISTS `ketering_sluzba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ketering_sluzba`;

-- --------------------------------------------------------

--
-- Table structure for table `agencija`
--

CREATE TABLE IF NOT EXISTS `agencija` (
  `idAgencije` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) NOT NULL,
  `opis` varchar(10000) NOT NULL,
  PRIMARY KEY (`idAgencije`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `agencija`
--

INSERT INTO `agencija` (`idAgencije`, `naziv`, `opis`) VALUES
(1, 'Divno Jelo', 'Divno Jelo Catering je sinonim za gurmanski doživljaj i vrhunsku uslugu. Naša misija je pružiti kulinarsko iskustvo koje će gosti dugo pamtiti.'),
(2, 'Okusi Sreće', 'Okusi Sreće Catering je mesto gde se susreću vrhunska hrana i izvanredna usluga. Naša strast je stvaranje gastronomskih čarolija koje će probuditi sva vaša čula.'),
(3, 'Ukusni Kutak', 'Ukusni Kutak Catering je vaša destinacija za vrhunsku hranu i uslugu iz snova. Naša misija je da svaki događaj učinimo posebnim i nezaboravnim.'),
(4, 'Delikatesni Domet', 'Delikatesni Domet Catering je vaš izbor za izuzetno kulinarsko iskustvo. Naša predanost vrhunskim sastojcima i maštovitim jelima garantuje da će vaš događaj biti nezaboravan. Bez obzira na vrstu proslave, naš tim će se potruditi da svaki detalj bude savršen, donoseći vam delikatne ukuse i eleganciju na tanjiru.'),
(5, 'Ukusni Ritual', 'Ukusni Ritual Catering je mesto gde hrana postaje ceremonija. Naša strast je stvaranje gastronomskih doživljaja koji će probuditi sva vaša čula. Sa pažljivo odabranim sastojcima i kreativnim jelima, svaki zalogaj postaje deo jedinstvenog rituala uživanja, pružajući vam nezaboravno iskustvo koje će vas inspirisati i oduševiti.'),
(6, 'Ukusi Neba', '\nUkusi Neba Catering donosi vam nebeske ukuse na zemlju. Naša misija je da svaki zalogaj bude kao putovanje kroz oblake, pružajući vam gastronomske čarolije koje će vas odvesti na nezaboravno iskustvo. Bez obzira na priliku, naš tim će vas očarati izvanrednim jelima i uslugom, stvarajući nezaboravno kulinarsko iskustvo.');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE IF NOT EXISTS `korisnik` (
  `idKorisnika` int(11) NOT NULL AUTO_INCREMENT,
  `ime` varchar(30) NOT NULL,
  `prezime` varchar(30) NOT NULL,
  `Adresa` varchar(50) NOT NULL,
  `Grad` varchar(30) NOT NULL,
  `korisnickoIme` varchar(30) NOT NULL,
  `lozinka` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `poeni` int(30) NOT NULL DEFAULT 100,
  `privilegije` enum('0','1','2','3') NOT NULL DEFAULT '1',
  PRIMARY KEY (`idKorisnika`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idKorisnika`, `ime`, `prezime`, `Adresa`, `Grad`, `korisnickoIme`, `lozinka`, `email`, `poeni`, `privilegije`) VALUES
(1, 'Mihailo', 'Andjelic', 'Bulevar Kralja Aleksandra 44', '11000 Beograd', 'mihailo', 'mihailo', 'mihailo@email.com', 100, '3'),
(2, 'Sara', 'Jovanovic', 'Jurija Gagarina 25', '11000 Beograd', 'sara', 'sara', 'sara@email.com', 100, '2'),
(3, 'Viktor', 'Unkovic', 'Krunska 8', '11000 Beograd', 'viktor', 'viktor', 'viktor@email.com', 300, '1');

-- --------------------------------------------------------

--
-- Table structure for table `rezervacija`
--

CREATE TABLE IF NOT EXISTS `rezervacija` (
  `idRezervacije` int(11) NOT NULL AUTO_INCREMENT,
  `idKorisnika` int(11) NOT NULL,
  `idUsluge` int(11) NOT NULL,
  `cena` int(11) NOT NULL,
  `poruka` varchar(300) NOT NULL,
  `datum` varchar(20) NOT NULL,
  `korisnickoIme` varchar(30) NOT NULL,
  `adresa` varchar(100) NOT NULL,
  `grad` varchar(50) NOT NULL,
  `naziv` varchar(30) NOT NULL,
  PRIMARY KEY (`idRezervacije`),
  KEY `rezervacija_ibfk_1` (`idKorisnika`),
  KEY `rezervacija_ibfk_2` (`idUsluge`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rezervacija`
--

INSERT INTO `rezervacija` (`idRezervacije`, `idKorisnika`, `idUsluge`, `cena`, `poruka`, `datum`, `korisnickoIme`, `adresa`, `grad`, `naziv`) VALUES
(1, 3, 1, 5500, 'Zelim 3 cokoladne torte.', '2024-06-05', 'viktor', 'Krunska 8', '11000 Beograd', 'Čarobni Deserti'),
(2, 3, 12, 50000, 'Zelim da narucim 5x boca belog vina.', '2024-06-07', 'viktor', 'Krunska 8', '11000 Beograd', 'Vinska simfonija'),
(3, 3, 2, 10000, 'Zelim 5x tiramisua.', '2024-06-08', 'viktor', 'Krunska 8', '11000 Beograd', 'Egzotične Sladosti'),
(4, 3, 5, 15000, 'Zelim domace...', '2024-05-31', 'viktor', 'Krunska 8', '11000 Beograd', 'Domaći Užitak');

-- --------------------------------------------------------

--
-- Table structure for table `usluga`
--

CREATE TABLE IF NOT EXISTS `usluga` (
  `idUsluge` int(11) NOT NULL AUTO_INCREMENT,
  `naziv` varchar(30) NOT NULL,
  `opis` mediumtext NOT NULL,
  `cena` int(30) NOT NULL,
  `idAgen` int(11) NOT NULL,
  PRIMARY KEY (`idUsluge`),
  KEY `idAgencije` (`idAgen`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `usluga`
--

INSERT INTO `usluga` (`idUsluge`, `naziv`, `opis`, `cena`, `idAgen`) VALUES
(1, 'Čarobni Deserti', 'Zahvaljujući našoj posvećenosti kvalitetu i pažljivoj selekciji sastojaka, naš slatki meni nudi čaroban doživljaj za vaše čulo ukusa. Svi naši deserti su pažljivo pripremljeni, od savršeno kremastog tiramisua do raskošnih voćnih tartova, nudeći vam neodoljivu slatku simfoniju na tanjiru.', 5500, 1),
(2, 'Egzotične Sladosti', 'Naš slatki meni predstavlja očaravajuću kombinaciju egzotičnih ukusa i luksuznih sastojaka, stvarajući neodoljivu ponudu koja će zadovoljiti najistančanija čula. Otkrijte svet macaronsa, crème brûlée, tiramisua i drugih slatkih poslastica koje će vas odvesti na putovanje kroz hedonizam.', 10000, 3),
(3, 'Sreća u Svakom Zalogaju', 'Naša poslastičarska maštovitost dolazi do izražaja u ovom slatkom meniju koji obiluje raskošnim ukusima i teksturama. Očekuje vas pažljivo pripremljeni izbor domaćih kolača, sočnih torti, osvežavajućih voćnih salata i drugih slatkih delicija, sve sa ciljem da vam pružimo nezaboravno iskustvo slatkog užitka.', 9500, 2),
(4, 'Mediterranean Delight', 'Inspirisan živopisnim krajolicima Mediterana, naš slani meni pruža spoj tradicionalnih i modernih ukusa. Uživajte u izobilju ukusnih maslina, kvalitetnog feta sira, sočnih suhomesnatih proizvoda i kremastog humusa, dok se odmarate uz miris maslina i morske soli.', 8900, 1),
(5, 'Domaći Užitak', 'Naš slani meni odražava toplinu doma i tradiciju, nudeći vam autentične ukuse domaće kuhinje sa modernim preokretom. Od punjenih paprika do sarmi i pečenja, svaki zalogaj predstavlja spoj mirisa i ukusa koji će vas vratiti u prijatne uspomene na porodične obroke.', 15000, 2),
(6, 'Svet Aromatičnih Začina', 'Naš slani meni nudi putovanje kroz svet egzotičnih ukusa i mirisa, pripremljenih sa strašću i pažnjom prema tradiciji. Probajte sushi rolnice, kari, dim sum i druge slane poslastice koje će vas odvesti na gastronomsku avanturu kakvu niste doživeli.', 14000, 3),
(7, 'Osvježavajući Biseri', 'Naši osvežavajući napici su poput bisera koji će dodati sjaj vašem događaju. Uz širok izbor limunada, voćnih koktela, gaziranih pića i drugih osvežavajućih napitaka, garantujemo da će vaša žedna grla biti zadovoljena, dok se vi opuštate i uživate u svečanom trenutku.', 25500, 2),
(8, 'Raskoš slatkih čarolija', 'Uživajte u raskoši slatkih čarolija koje vam pruža naš slatki meni. Od klasičnih kolača do egzotičnih voćnih salata i prefinjenih desertnih kolača, svaki zalogaj nosi miris i ukus autentičnog zadovoljstva.', 10500, 4),
(9, 'Doručak', 'Slatki meni: \r\n- 500g kajagne,\r\n- 200g slanine, \r\n- 200g pečenice\r\n- 5 svežih lepinja, \r\n- 200g šopske salate, \r\n- 500g žužu-a, \r\nSlatki meni:\r\n- 5 slatkih prženica sa kremom, \r\n- 300g mini rolata sa džemom od jagode. ', 7000, 5),
(10, 'Vinski Raj', 'Naš vinski meni je pažljivo osmišljen kako bi oživeo vaše čulo ukusa i pružio vam jedinstveno iskustvo degustacije. Izaberite iz široke palete lokalnih i internacionalnih vina, dok naši stručnjaci za vino preporučuju savršene kombinacije sa našom selekcijom sireva, suhomesnatih proizvoda i maslina.', 12000, 1),
(11, 'Delikatesni đakonija', 'Naš slani meni oduševiće vaše nepce bogatim izborom delikatesnih specijaliteta. Uživajte u pažljivo odabranim sirevima, suhomesnatim proizvodima, kulinarskim remek-delima i drugim slanim poslasticama koje će učiniti da se osećate kao pravi gurman.', 25000, 4),
(12, 'Vinska simfonija', 'Oživite svoja čula uz našu vinsku simfoniju koja spaja vrhunska vina sa pažljivo odabranim degustacijskim poslasticama. Prepustite se harmoniji ukusa i uživajte u svakom gutljaju ovog nezaboravnog iskustva.', 50000, 4),
(13, 'Ručak', 'Slani meni:\r\n- 2l teleće čorbe, \r\n- 300g sarmica sa zeljem, \r\n- 500g musake sa tikvicama, \r\n- 500g mešanog mesa sa roštilja, \r\n- 5 svežih lepinja, \r\n- 300g kupus salate.\r\nSlatki meni:\r\n- 500g bakinog kolača,\r\n- 8 slatkih palačinki sa kremom.\r\n', 10000, 5),
(14, 'Večera', 'Slani meni:\r\n- 1kg rižota sa piletinom,\r\n- 3 karađorđeve šnicle,\r\n- 3 porcije taljatela sa pečurkama, \r\n- 5 svežih lepinja.\r\nSladak meni:\r\n- 5 velikih knedli sa kremom i višnjama, \r\n- 5 voćnih salata u čaši, \r\n- 5 parčića čiz kejka. \r\n', 15000, 5),
(15, 'Ukusi nebeskih slatkiša', 'Prepustite se nebeskim ukusima sa našim slatkim menijem koji pruža izbor najfinijih slatkih poslastica. Od neodoljivih torti do egzotičnih voćnih salata i profinjenih desertnih kolača, svaki zalogaj donosi nezaboravan ukus zadovoljstva', 45000, 6),
(16, 'Neobične gastronomske kreacije', 'Iskusite neobične gastronomske kreacije iz našeg slanog menija koji spaja tradicionalne recepte sa modernim kulinarskim trendovima. Uživajte u harmoniji ukusa uz naš izbor ukusnih predjela, glavnih jela i priloga koji će vas odvesti na nezaboravno putovanje kroz ukuse.', 47000, 6),
(17, 'Nebeska osveženja', 'Osvežite svoja čula uz našu selekciju nebeskih osveženja koja će vas oduševiti svojim ukusima i aromama. Uživajte u širokom izboru voćnih napitaka, egzotičnih koktela i drugih osvežavajućih pića koji će učiniti da se osećate kao u raju.', 9666, 6),
(18, 'Elegantna Degustacija Vina', 'Uz našu degustaciju vina, otkrijte svet vrhunskih vina i uživajte u harmoniji ukusa i aroma. Naši stručnjaci za vino preporučuju savršene kombinacije sa našim izborom sireva, suhomesnatih proizvoda i maslina, stvarajući jedinstveno iskustvo koje će zadovoljiti sva vaša čula.', 18600, 3);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `rezervacija`
--
ALTER TABLE `rezervacija`
  ADD CONSTRAINT `rezervacija_ibfk_1` FOREIGN KEY (`idKorisnika`) REFERENCES `korisnik` (`idKorisnika`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rezervacija_ibfk_2` FOREIGN KEY (`idUsluge`) REFERENCES `usluga` (`idUsluge`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `usluga`
--
ALTER TABLE `usluga`
  ADD CONSTRAINT `usluga_ibfk_1` FOREIGN KEY (`idAgen`) REFERENCES `agencija` (`idAgencije`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
