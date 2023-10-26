CREATE TABLE `Branch`(
    `bankAcct1_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `bankAcct2_id` BIGINT NOT NULL
);
CREATE TABLE `Costumer`(
    `costumer_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `costumerName` VARCHAR(255) NOT NULL,
    `costumerPhone` INT NULL,
    `branch_id` BIGINT NOT NULL
);
ALTER TABLE
    `Costumer` ADD CONSTRAINT `costumer_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `Branch`(`bankAcct1_id`);
ALTER TABLE
    `Costumer` ADD CONSTRAINT `costumer_branch_id_foreign` FOREIGN KEY(`branch_id`) REFERENCES `Branch`(`bankAcct2_id`);