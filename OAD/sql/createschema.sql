-- spec from john smith, deltafoxtrot from openstreetmap project
use OAD;

 CREATE TABLE IF NOT EXISTS `addresses` (
 `id` bigint(20) unsigned NOT NULL auto_increment,
 `street` varchar(255) NOT NULL,
 `suburb` varchar(255) NOT NULL,
 `state` varchar(255) NOT NULL,
 `country` varchar(255) NOT NULL,
 `lat` int(11) NOT NULL,
 `lon` int(11) NOT NULL,
 `addedby` bigint(20) unsigned NOT NULL,
 `locatedby` bigint(20) unsigned NOT NULL,
 PRIMARY KEY  (`id`),
 KEY `addedby` (`addedby`),
 KEY `locatedby` (`locatedby`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
 `id` bigint(20) unsigned NOT NULL auto_increment,
 `username` varchar(255) NOT NULL,
 `password` varchar(255) NOT NULL,
 `added` datetime NOT NULL,
 PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `addresses`
--
ALTER TABLE `addresses`
 ADD CONSTRAINT `addresses_ibfk_2` FOREIGN KEY (`locatedby`) REFERENCES `users` (`id`),
 ADD CONSTRAINT `addresses_ibfk_1` FOREIGN KEY (`addedby`) REFERENCES `users` (`id`);

create user OAD identified by 'OAD';

grant all on OAD.* to OAD;
