-- DROP DATABASE IF EXISTS museai;

-- CREATE DATABASE IF NOT EXISTS museai;

-- SHOW DATABASES;

-- USE museai;

-- CREATE TABLE images ( id INT(11) AUTO_INCREMENT PRIMARY KEY, image LONGBLOB NOT NULL );

-- -----------------------------------------------------
-- Table `user`
-- Create a new account at register
-- Login an accouunt using username and password
-- It is a role for admin, manager, ntid and register
-- It is connected by role
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `user` (
  `iduser` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `fullname` VARCHAR(200) NOT NULL,
  `upload_image` LONGBLOB NOT NULL,
  `date` VARCHAR(50) NOT NULL,
  `time` VARCHAR(50) NOT NULL,
  `role` INT NULL,
  `email` VARCHAR(120) NOT NULL,
  PRIMARY KEY (`iduser`),
  INDEX `role_id` (`role` ASC)
);



-- -----------------------------------------------------
-- Table `venue`
-- It is for local only
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `venue` (
  `idvenue` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `capacity` INT NULL,
  PRIMARY KEY (`idvenue`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

INSERT INTO `venue` (`idvenue`, `name`, `capacity`) VALUES
(1, 'RIT', 1);


-- -----------------------------------------------------
-- Table `museai`
-- It is for showing all data to all roles only
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `museai` (
  `idmuseai` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `artist` VARCHAR(50) NOT NULL,
  `year` VARCHAR(50) NOT NULL,
  `datepost` VARCHAR(50) NOT NULL,
  `datestart` DATE NOT NULL,
  `dateend` DATE NOT NULL,
  `numberallowed` INT NOT NULL,
  `venue` INT NOT NULL,
  `description` VARCHAR(10000) NOT NULL,
  `image` VARCHAR(50) NOT NULL,
  `location_image` VARCHAR(50) NOT NULL,
  `video` VARCHAR(50) NOT NULL,
  `location_video` VARCHAR(50) NOT NULL,
  `time` VARCHAR(50) NOT NULL,
  `qrCodeImage` VARCHAR(50) NOT NULL,
  `whoisposted` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idmuseai`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC),
  INDEX `venue_fk_idx` (`venue` ASC));


-- -- Table qrCode
-- CREATE TABLE IF NOT EXISTS `qrCode` (
--   `id_qrcode` INT NOT NULL AUTO_INCREMENT,
--   `name` VARCHAR(100) NOT NULL,
--   `qrCode_Image` VARCHAR(100) NOT NULL,
--   PRIMARY KEY (`id_qrcode`),
--   UNIQUE INDEX `name_UNIQUE` (`name` ASC));


INSERT INTO `museai`(
  `idmuseai`, 
  `name`, 
  `artist`, 
  `year`,
  `datepost`, 
  `datestart`, 
  `dateend`, 
  `numberallowed`, 
  `venue`, 
  `description`, 
  `image`, 
  `location_image`, 
  `video`, 
  `location_video`,
  `time`,
  `qrCodeImage`,
  `whoisposted`
) 
VALUES(
  1, 
  'The Sentinel', 
  'Unknown', 
  'Unknown',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'Weighing in at 110 tons and measuring 73 feet, The Sentinel represents the transformative nature of education. The unique blend and juxtipostioning of materials and shapes serves to visually represent RIT s mission of shaping and improving the world through creativity and innovation.',
  '1_Sentinel.JPG', 
  'upload/1_Sentinel.JPG', 
  '1_Sentinel.JPG', 
  '656300853',
  '05:24:00pm',
  'images/61b904337d69c.png',
  'Ike Chukz'
),
(
  2, 
  'Three Piece Recling Figure No.1', 
  'Henry Moore', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'My sculpture needs open air - sky, clouds, trees and changes of weather" states artist Henry Moore. With inspiration from the image of the reclining female figure, this sculpture is one of seven editions.',
  '3_Reclining_Figures.jpg', 
  'upload/3_Reclining_Figures.jpg', 
  '3_Reclining_Figures.jpg', 
  '656300888',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  3, 
  'Unity', 
  'Juan Carlos', 
  '1994',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'While each of the three pieces of this sculpture can stand on its own, together they represent the unity of science, technology, and art at RIT. Juan Carlos, received both his Bachelors and Masters of Fine Arts degrees from RITs School for American Crafts and has been a faculty member since 1994.',
  '6_Unity.jpg', 
  'upload/6_Unity.jpg', 
  '6_Unity.jpg', 
  '656300920',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  4, 
  'Cloaked Intentions', 
  'Unknown', 
  'Unknown',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'While certainly not the heaviest sculpture on campus this piece is still quite massive at over 4 tons. Before making RIT campus its final resting place, this piece was on display down on Park Avenue in New York City.',
  '8_Cloaked_Intentions.jpg', 
  'upload/8_Cloaked_Intentions.jpg', 
  '8_Cloaked_Intentions.jpg', 
  '656300960',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  5, 
  'Sundial', 
  'Unknown', 
  'Unknown',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'When this sundial was built in 1968; it was the largest one in the country. Fun fact, this instrument is only accurate four days a year. Trivia: What are those four days?',
  '12_Sundial_ConvertedJPG.jpg', 
  'upload/12_Sundial_ConvertedJPG.jpg', 
  '12_Sundial_ConvertedJPG.jpg', 
  '656301015',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  6, 
  'Infinity Loop', 
  'Unknown', 
  'Unknown',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'A constantly rotating Mobius strip with cross section of an equilateral triangle, this piece was originally designed to complete 12 revolutions per hour and in 1998, mechanical engineering students rebuilt the motor.',
  '5_Infinity_Loop_ConvertJPG.jpg', 
  'upload/5_Infinity_Loop_ConvertJPG.jpg', 
  '5_Infinity_Loop_ConvertJPG.jpg', 
  '656300908',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  7, 
  'Gateway', 
  'Unknown', 
  'Unknown',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'Donated in honor of Dr. D. Robert Frisina, RIT vice president and founding director of NTID, in recognition of 40 years of leadership and dedication to the education of deaf and hard-of-hearing people worldwide.',
  '13_Caballero-Perez_Gateway.jpeg', 
  'upload/13_Caballero-Perez_Gateway.jpeg', 
  '13_Caballero-Perez_Gateway.jpeg', 
  '656301029',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  8, 
  'Split Cube', 
  'Unknown', 
  'Unknown',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'Made in honor of NTIDs 10th Anniversary. This is the largest sculpture ever made by artist Carl Zollo -- weighing in at 8,000 pounds! Education visualized is what the artists concept behind the piece',
  '14_Split_Cube_resized.jpg', 
  'upload/14_Split_Cube_resized.jpg', 
  '14_Split_Cube_resized.jpg', 
  '656301050',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  9, 
  'Tojo Memorial Garden', 
  'Unknown', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'This delicate yet extremely solid piece is a granite stone lantern presented by the parents of Yasuji Tojo, a Japanese student in the photography program that was killed in a car accident in 1964. The piece is at the center of a garden that was created in honor of Tojo and serves as a "living memorial to eternal youth.',
  '2_Tojo_ConvertedJPG_resized.jpg', 
  'upload/2_Tojo_ConvertedJPG_resized.jpg', 
  '2_Tojo_ConvertedJPG_resized.jpg', 
  '656300866',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  10, 
  'In Art, Science and Life, What is the Question?', 
  'Unknown', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'Inspired by the spirit and energy of nature, each of the 13 panels of tempered glass weigh over 400 pounds. The artist, Nancy Gong, studies at RIT in the School for American Craftsmen. Along the top of piece is a binary code that represents a quote from American novelist ,Thomas Berger (1024-2014), "The art and science of asking questions is the source of all knowledge.',
  '5_Infinity_Loop_ConvertJPG.jpg', 
  'upload/5_Infinity_Loop_ConvertJPG.jpg', 
  '5_Infinity_Loop_ConvertJPG.jpg', 
  '656300968',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  11, 
  'Tiger Statue', 
  'Unknown', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'Designed to be a permanent symbol of RIT tradition, pride, and spirit, the artist spent hours observing Siberian tigers and attempts with this sculpture to capture the essence of the animal in their natural habitat.',
  '11_Tiger.jpg', 
  'upload/11_Tiger.jpg', 
  '11_Tiger.jpg', 
  '656300999',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  12, 
  'Green Wall', 
  'Unknown', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'This piece is living! It contains 1,776 green plants, together which contribute to air quality and aesthetics.',
  '7-Green wall.jpg', 
  'upload/7-Green wall.jpg', 
  '7-Green wall.jpg', 
  '656300940',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  13, 
  'Oak Tree Chairs', 
  'Unknown', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'Made to commemorate the 50th Anniversary of RITs Henrietta campus, this piece was created from a winning design from RITs annual T-Minus 151 Industrial Design Challenge and is made from wood of a century-old oak tree that stood at RITs entrance.',
  '10_Oak_Tree_Chairs.png', 
  'upload/10_Oak_Tree_Chairs.png', 
  '10_Oak_Tree_Chairs.png', 
  '656300988',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
),
(
  14, 
  'Book of the World', 
  'Unknown', 
  '2021',
  '2021-11-08', 
  '2021-11-08', 
  '2050-12-29', 
  1, 
  1, 
  'For the artist form and content are inseparable, which is pretty clear with this piece that hangs suspended from the librarys ceiling. It is a book full of maps and charts being approached as objects that can be read on many levels.',
  '4_Book_of_the_World_Resized.jpg', 
  'upload/4_Book_of_the_World_Resized.jpg', 
  '4_Book_of_the_World_Resized.jpg', 
  '656300899',
  '05:24:00pm',
  'images/61ae8a06a34f4.png',
  'Ike Chukz'
);

-- -----------------------------------------------------
-- Table `session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `session` (
  `idsession` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `numberallowed` INT NOT NULL,
  `museai` INT NOT NULL,
  `startdate` DATETIME NOT NULL,
  `enddate` DATETIME NOT NULL,
  PRIMARY KEY (`idsession`)
);


-- -----------------------------------------------------
-- Table `manager_museai`
-- museai for all data in admin.php
-- manager for only some data in museais.php
-- nuseai and manager are showed new record when insert at the same time.
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `manager_museai` (
  `museai` INT NOT NULL,
  `manager` INT NOT NULL,
	PRIMARY KEY (`museai`, `manager`)
); 


-- -----------------------------------------------------
-- Table `role`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `role` (
  `idrole` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idrole`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC));

INSERT INTO `role` (`name`) values ('admin'),('museai manager'),('museai ntid'),('user');


-- Store data for (Send the email)
CREATE TABLE IF NOT EXISTS `pwdreset` (
  `pwdResetId` int(11) PRIMARY KEY AUTO_INCREMENT NOT NULL,
  `pwdResetEmail` TEXT NOT NULL,
  `pwdResetSelector` TEXT NOT NULL,
  `pwdResetToken` LONGTEXT NOT NULL,
  `pwdResetExpires` TEXT NOT NULL
);