-- phpMyAdmin SQL Dump
-- version 2.11.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 01, 2013 at 12:11 PM
-- Server version: 5.1.57
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";

--
-- Database: '<dbname>'
--

-- --------------------------------------------------------

--
-- Table structure for table 'country'
--

CREATE TABLE country (
  countryid int(11) NOT NULL,
  countryname varchar(100) COLLATE latin1_general_ci NOT NULL,
  letter char(1) COLLATE latin1_general_ci NOT NULL,
  code2 char(2) COLLATE latin1_general_ci NOT NULL,
  flower int(11) NOT NULL,
  PRIMARY KEY (countryid),
  UNIQUE KEY letter (letter)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'counts'
--

CREATE TABLE counts (
  vkey varchar(12) COLLATE latin1_general_ci NOT NULL,
  `value` int(11) NOT NULL,
  PRIMARY KEY (vkey)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'item'
--

CREATE TABLE item (
  itemid int(11) NOT NULL,
  itemtype int(11) NOT NULL,
  itemname varchar(100) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (itemid),
  KEY itemtype (itemtype)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'itemtype'
--

CREATE TABLE itemtype (
  itemtypeid int(11) NOT NULL AUTO_INCREMENT,
  itemtypename varchar(100) COLLATE latin1_general_ci NOT NULL,
  bgcolor varchar(50) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (itemtypeid)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table 'lastdrugs'
--

CREATE VIEW lastdrugs AS
    select stock.item AS item,
           stock.country AS country,
           max(stock.utctime) AS lastutc
    from stock
    where stock.item in (
        select item.itemid from item where (item.itemtype = 3)
    )
    group by stock.item, stock.country;

-- --------------------------------------------------------

--
-- Table structure for table 'lotto'
--

CREATE TABLE lotto (
  date1st datetime NOT NULL,
  tornid int(11) NOT NULL,
  UNIQUE KEY tornid (tornid)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table 'post'
--

CREATE TABLE post (
  postid int(11) NOT NULL AUTO_INCREMENT,
  postUTC datetime NOT NULL,
  postdata varchar(60000) COLLATE latin1_general_ci NOT NULL,
  user_agent varchar(255) COLLATE latin1_general_ci NOT NULL,
  referer varchar(255) COLLATE latin1_general_ci NOT NULL,
  sender varchar(78) COLLATE latin1_general_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (postid)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=3974 ;

-- --------------------------------------------------------

--
-- Table structure for table 'stock'
--

CREATE TABLE stock (
  stockid int(11) NOT NULL AUTO_INCREMENT,
  utctime datetime NOT NULL,
  country int(11) NOT NULL,
  item int(11) NOT NULL,
  price int(11) NOT NULL,
  quantity int(11) NOT NULL,
  manual tinyint(4) NOT NULL,
  sender varchar(78) COLLATE latin1_general_ci NOT NULL,
  PRIMARY KEY (stockid),
  KEY country (country),
  KEY item (item)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci AUTO_INCREMENT=50285 ;

