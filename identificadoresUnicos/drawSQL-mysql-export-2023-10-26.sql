CREATE TABLE `Student`(
    `student_id` BIGINT NOT NULL,
    `firtName` VARCHAR(255) NOT NULL,
    `lastName` VARCHAR(255) NOT NULL,
    `adress` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NULL
);
ALTER TABLE
    `Student` ADD PRIMARY KEY(`student_id`);
CREATE TABLE `Song`(
    `unic_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameSong` VARCHAR(255) NOT NULL,
    `artist_id` VARCHAR(255) NOT NULL
);
CREATE TABLE `Artist`(
    `nameArtist` LONGTEXT NOT NULL,
    `style` BIGINT NULL
);
ALTER TABLE
    `Artist` ADD PRIMARY KEY(`nameArtist`);
CREATE TABLE `Locker`(
    `size` DOUBLE(8, 2) NOT NULL,
    `location` VARCHAR(255) NOT NULL,
    `number` INT NOT NULL
);
ALTER TABLE
    `Locker` ADD PRIMARY KEY(`size`);
CREATE TABLE `Movie`(
    `tittle` VARCHAR(255) NOT NULL,
    `dateReleased` DATE NOT NULL,
    `producer` VARCHAR(255) NOT NULL,
    `director` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `Movie` ADD PRIMARY KEY(`tittle`);
CREATE TABLE `Director`(
    `nameDirector` VARCHAR(255) NOT NULL,
    `emailDirector` VARCHAR(255) NOT NULL,
    `movie_id` BIGINT NOT NULL
);
ALTER TABLE
    `Director` ADD PRIMARY KEY(`nameDirector`);
CREATE TABLE `Producer`(
    `nameProducer` LONGTEXT NOT NULL,
    `emailProducer` VARCHAR(255) NOT NULL,
    `producer_id` BIGINT NOT NULL
);
ALTER TABLE
    `Producer` ADD PRIMARY KEY(`nameProducer`);
ALTER TABLE
    `Movie` ADD CONSTRAINT `movie_director_foreign` FOREIGN KEY(`director`) REFERENCES `Director`(`nameDirector`);
ALTER TABLE
    `Song` ADD CONSTRAINT `song_artist_id_foreign` FOREIGN KEY(`artist_id`) REFERENCES `Artist`(`nameArtist`);
ALTER TABLE
    `Director` ADD CONSTRAINT `director_movie_id_foreign` FOREIGN KEY(`movie_id`) REFERENCES `Movie`(`tittle`);
ALTER TABLE
    `Locker` ADD CONSTRAINT `locker_number_foreign` FOREIGN KEY(`number`) REFERENCES `Student`(`student_id`);
ALTER TABLE
    `Movie` ADD CONSTRAINT `movie_producer_foreign` FOREIGN KEY(`producer`) REFERENCES `Producer`(`nameProducer`);