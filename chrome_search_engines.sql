-- MySQL dump 10.13  Distrib 5.1.56, for apple-darwin10.3.0 (i386)
--
-- Host: localhost    Database: sbn_development
-- ------------------------------------------------------
-- Server version	5.1.56

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `keywordz`
--

DROP TABLE IF EXISTS `keywordz`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `keywordz` (
  `id` int(11) NOT NULL,
  `short_name` varchar(1000) NOT NULL,
  `keyword` varchar(1000) NOT NULL,
  `url` varchar(1000) NOT NULL,
  `originating_url` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keywordz`
--

LOCK TABLES `keywordz` WRITE;
/*!40000 ALTER TABLE `keywordz` DISABLE KEYS */;
INSERT INTO `keywordz` VALUES (5,'Wikipedia','wp','http://www.google.com/search?sitesearch=en.wikipedia.org&q={searchTerms}&fulltext=Search',''),(19,'Twitter','t','http://twitter.com/home',''),(21,'del.icio.us/josephgrossberg','du','http://del.icio.us/josephgrossberg/',''),(22,'post to del.icio.us','ad','javascript:location.href=\'http://del.icio.us/josephgrossberg?v=5&url=\'+encodeURIComponent(location.href)+\'&title=\'+encodeURIComponent(document.title)',''),(23,'subscribe to feed','sb','javascript:location.href=\'http://fusion.google.com/add?feedurl=\'+location.href',''),(24,'josephgrossberg\'s bookmarks tagged with \"toread\" on del.icio.us','tr','http://del.icio.us/josephgrossberg/toread',''),(25,'Google Reader','bl','https://www.google.com/reader/view/#overview-page',''),(26,'go to referrer','gr','javascript:if(!document.referrer)%20alert(%22No%20referrer!%22);%20document.location%20=%20document.referrer;%20void%200',''),(29,'Google Maps','gm','http://maps.google.com/maps?f=q&hl=en&q={searchTerms}',''),(33,'Google Calendar','c','http://www.google.com/calendar/render',''),(38,'Hotmail','h','http://www.hotmail.com/',''),(39,'Amazon.com--Earth\'s Biggest Selection','a','http://www.amazon.com/exec/obidos/subst/home/home.html/102-0867604-3175340',''),(41,'Google Image Search','i','http://images.google.com/images?q={searchTerms}&hl=en&btnG=Search+Images',''),(42,'washingtonpost.com - nation, world, technology and Washington area news and headlines','wapo','http://www.washingtonpost.com/',''),(46,'YouTube - Broadcast Yourself.','yt','http://www.youtube.com/results?search_type=search_videos&search_sort=relevance&search_query={searchTerms}&search=Search',''),(47,'Amazon.com Books','ab','http://www.amazon.com/s/ref=br_ss_hs/104-9147197-4470309?platform=gurupa&url=index%3Dstripbooks%3Arelevance-above&keywordz={searchTerms}&Go.x=0&Go.y=0&Go=Go',''),(48,'Google News','gn','http://news.google.com/news?q={searchTerms}&svnum=10&hl=en&lr=&c2coff=1&safe=off&sa=N&tab=wn',''),(50,'My watchlist - Wikipedia, the free encyclopedia','wpw','http://en.wikipedia.org/w/index.php?title=Special:Watchlist&magic=yes',''),(53,'Facebook | Home','fb','http://www.facebook.com/',''),(54,'Urban Dictionary','ud','http://www.urbandictionary.com/define.php?term={searchTerms}',''),(59,'Gmail - Inbox - joegrossberg.com@gmail.com','m','https://mail.google.com/mail/#inbox',''),(63,'Hourly Weather Forecast for Washington, DC (20005) - weather.com','w','http://www.weather.com/weather/hourbyhour/graph/20005?from=36hr_topnav_undeclared#',''),(64,'Capital Weather Gang - (washingtonpost.com)','cw','http://www.washingtonpost.com/blogs/capital-weather-gang',''),(225,'shorten with bit.ly','b','javascript:var%20d=document,w=window,enc=encodeURIComponent,e=w.getSelection,k=d.getSelection,x=d.selection,s=(e?e():(k)?k():(x?x.createRange().text:0)),s2=((s.toString()==\'\')?s:(\'%22\'+enc(s)+\'%22\')),f=\'http://bit.ly/\',l=d.location,p=\'?v=3&u=\'+enc(l.href)%20+\'&s=\'+enc(d.title)+\'%20\'+s2,u=f+p;try{if(!/^(.*.)?tumblrzzz[^.]*$/.test(l.host))throw(0);tstbklt();}catch(z){a%20=function(){if(!w.open(u))l.href=u;};if(/Firefox/.test(navigator.userAgent))setTimeout(a,0);else%20a();}void(0)','');
/*!40000 ALTER TABLE `keywordz` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2011-05-17 17:51:06
