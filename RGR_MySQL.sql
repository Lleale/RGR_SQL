CREATE TABLE IF NOT EXISTS `assortment` (
  `id` int(10) AUTO_INCREMENT NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost` float(10, 2) NOT NULL,
  `existence` int(10) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `client` (
  `id` int(10) AUTO_INCREMENT NOT NULL,
  `name` varchar(255) NOT NULL,
  `tel` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `employee` (
  `id` int(10) AUTO_INCREMENT NOT NULL,
  `name` varchar(255) NOT NULL,
  `job_title` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(10) AUTO_INCREMENT NOT NULL,
  `n_order` int(10) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `execution_period` int(10) UNSIGNED NOT NULL,
  `requirements` text DEFAULT NULL,
  `client_id` int(10) NOT NULL,
  `employee_id` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `order_employee_id_employee_id_foreign` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`id`),
  CONSTRAINT `order_client_id_client_id_foreign` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
);

CREATE TABLE IF NOT EXISTS `goods_in_order` (
  `id` int(10) AUTO_INCREMENT NOT NULL,
  `order_id` int(10) NOT NULL,
  `good_id` int(10) NOT NULL,
  `amount` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `goods_in_order_order_id_order_id_foreign` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `goods_in_order_good_id_assortment_id_foreign` FOREIGN KEY (`good_id`) REFERENCES `assortment` (`id`)
);

-- triggers

DELIMITER //
CREATE TRIGGER After_Delete_order
AFTER DELETE
ON `order`
FOR EACH ROW
BEGIN
	DELETE FROM `goods_in_order`
    WHERE OLD.`id` = `goods_in_order`.`order_id`;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Insert_order
BEFORE INSERT
ON `order`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT `id` FROM `employee` WHERE id = NEW.employee_id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'This employee dont exist in database';
    END IF;
    IF (NOT EXISTS(SELECT `id` FROM `client` WHERE id = NEW.client_id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'This client dont exist in database';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Update_order
BEFORE UPDATE
ON `order`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT `id` FROM `employee` WHERE id = NEW.employee_id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'This employee dont exist in database';
    END IF;
    IF (NOT EXISTS(SELECT `id` FROM `client` WHERE id = NEW.client_id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'This client dont exist in database';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Delete_client
BEFORE DELETE
ON `client`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT `client_id` FROM `order` WHERE client_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'Delete all orders of this client before!';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Delete_employee
BEFORE DELETE
ON `employee`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT `employee_id` FROM `order` WHERE employee_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'Delete all orders done by this employee before!';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Delete_assortment
BEFORE DELETE
ON `assortment`
FOR EACH ROW
BEGIN
	IF (EXISTS(SELECT `good_id` FROM `goods_in_order` WHERE good_id = OLD.id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'You have order with this good. Delete it before!';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Insert_order_goods
BEFORE INSERT
ON `goods_in_order`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT `id` FROM `order` WHERE id = NEW.order_id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'This order dont exist in database';
    END IF;
END //
DELIMITER ;

DELIMITER //
CREATE TRIGGER Before_Update_order_goods
BEFORE UPDATE
ON `goods_in_order`
FOR EACH ROW
BEGIN
	IF (NOT EXISTS(SELECT `id` FROM `order` WHERE id = NEW.order_id))
    	THEN SIGNAL SQLSTATE '45000'
    		SET MESSAGE_TEXT = 'This order dont exist in database';
    END IF;
END //
DELIMITER ;