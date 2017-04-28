-- ...
CREATE DATABASE IF NOT EXISTS `mediatry`
  DEFAULT CHARACTER SET utf8
  DEFAULT COLLATE utf8_general_ci;

-- ...
CREATE USER 'mark'@'%' IDENTIFIED BY 'zuckerberg';
GRANT ALL ON `mediatry`.* TO 'mark'@'%';

-- ...
FLUSH PRIVILEGES;

-- mysql -h 127.0.0.1 -P 3306 -u mark -p mediatry