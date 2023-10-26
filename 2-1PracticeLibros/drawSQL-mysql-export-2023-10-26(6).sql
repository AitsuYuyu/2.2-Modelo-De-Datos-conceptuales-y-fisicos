CREATE TABLE `Pagos`(
    `pagos_id` BIGINT NOT NULL,
    `factura_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `direccion` VARCHAR(255) NOT NULL,
    `tipoTarjeta` VARCHAR(255) NOT NULL,
    `numTarjeta` INT NOT NULL,
    `clave` INT NOT NULL,
    `fechaVencimiento` INT NOT NULL
);
ALTER TABLE
    `Pagos` ADD PRIMARY KEY(`pagos_id`);
CREATE TABLE `Stock`(
    `stock_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `productos_id` BIGINT NOT NULL,
    `proveedor_id` BIGINT NULL
);
CREATE TABLE `Proveedor`(
    `proveedor_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `productos_id` BIGINT NOT NULL,
    `nameProductor` VARCHAR(255) NOT NULL,
    `industry` VARCHAR(255) NOT NULL
);
CREATE TABLE `Pedidos`(
    `pedidos_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `productos_id` BIGINT NOT NULL,
    `proveedor_id` BIGINT NULL
);
CREATE TABLE `Clientes`(
    `documento` BIGINT NOT NULL,
    `nameCliente` VARCHAR(255) NOT NULL,
    `lastNameCliente` VARCHAR(255) NULL,
    `phoneCliente` INT NULL,
    `pedidos_id` BIGINT NOT NULL,
    `facturas_id` BIGINT NOT NULL,
    `envios_id` BIGINT NOT NULL
);
ALTER TABLE
    `Clientes` ADD PRIMARY KEY(`documento`);
ALTER TABLE
    `Clientes` ADD UNIQUE `clientes_namecliente_unique`(`nameCliente`);
CREATE TABLE `Factura`(
    `facutra_id` BIGINT NOT NULL,
    `pedidos_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `nameCliente` VARCHAR(255) NULL,
    `cliente_id` BIGINT NOT NULL
);
ALTER TABLE
    `Factura` ADD PRIMARY KEY(`facutra_id`);
CREATE TABLE `Envios`(
    `envios_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `factura_id` BIGINT NOT NULL,
    `pedidos_id` BIGINT NOT NULL,
    `pagos_id` BIGINT NOT NULL
);
CREATE TABLE `Productos`(
    `productos_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `proveedores_id` BIGINT NOT NULL
);
CREATE TABLE `Venta`(
    `venta_id` BIGINT NOT NULL,
    `cliente_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `factura_id` BIGINT NOT NULL,
    `phone` INT NULL,
    `pedidos_id` BIGINT NOT NULL
);
ALTER TABLE
    `Venta` ADD PRIMARY KEY(`venta_id`);
ALTER TABLE
    `Factura` ADD CONSTRAINT `factura_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `Clientes`(`documento`);
ALTER TABLE
    `Envios` ADD CONSTRAINT `envios_factura_id_foreign` FOREIGN KEY(`factura_id`) REFERENCES `Factura`(`facutra_id`);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_productos_id_foreign` FOREIGN KEY(`productos_id`) REFERENCES `Productos`(`productos_id`);
ALTER TABLE
    `Clientes` ADD CONSTRAINT `clientes_envios_id_foreign` FOREIGN KEY(`envios_id`) REFERENCES `Envios`(`envios_id`);
ALTER TABLE
    `Pedidos` ADD CONSTRAINT `pedidos_proveedor_id_foreign` FOREIGN KEY(`proveedor_id`) REFERENCES `Proveedor`(`proveedor_id`);
ALTER TABLE
    `Factura` ADD CONSTRAINT `factura_facutra_id_foreign` FOREIGN KEY(`facutra_id`) REFERENCES `Venta`(`venta_id`);
ALTER TABLE
    `Stock` ADD CONSTRAINT `stock_proveedor_id_foreign` FOREIGN KEY(`proveedor_id`) REFERENCES `Proveedor`(`proveedor_id`);
ALTER TABLE
    `Pagos` ADD CONSTRAINT `pagos_factura_id_foreign` FOREIGN KEY(`factura_id`) REFERENCES `Factura`(`pedidos_id`);
ALTER TABLE
    `Stock` ADD CONSTRAINT `stock_productos_id_foreign` FOREIGN KEY(`productos_id`) REFERENCES `Productos`(`productos_id`);
ALTER TABLE
    `Venta` ADD CONSTRAINT `venta_factura_id_foreign` FOREIGN KEY(`factura_id`) REFERENCES `Factura`(`facutra_id`);
ALTER TABLE
    `Envios` ADD CONSTRAINT `envios_pagos_id_foreign` FOREIGN KEY(`pagos_id`) REFERENCES `Pagos`(`pagos_id`);
ALTER TABLE
    `Productos` ADD CONSTRAINT `productos_proveedores_id_foreign` FOREIGN KEY(`proveedores_id`) REFERENCES `Proveedor`(`productos_id`);
ALTER TABLE
    `Venta` ADD CONSTRAINT `venta_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `Clientes`(`documento`);
ALTER TABLE
    `Venta` ADD CONSTRAINT `venta_pedidos_id_foreign` FOREIGN KEY(`pedidos_id`) REFERENCES `Pedidos`(`pedidos_id`);
ALTER TABLE
    `Envios` ADD CONSTRAINT `envios_pedidos_id_foreign` FOREIGN KEY(`pedidos_id`) REFERENCES `Pedidos`(`pedidos_id`);