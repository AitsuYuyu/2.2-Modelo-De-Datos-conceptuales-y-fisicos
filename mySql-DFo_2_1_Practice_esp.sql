CREATE TABLE `Facturación`(
    `facturacion_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` BIGINT NOT NULL,
    `carritoDeCompra_id` BIGINT NOT NULL,
    `libro_id` BIGINT NOT NULL
);
CREATE TABLE `Clientes`(
    `cliente_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameCliente` LONGTEXT NOT NULL,
    `directionCliente` TEXT NOT NULL,
    `idEmail` VARCHAR(255) NOT NULL,
    `phoneNumClientes` INT NOT NULL,
    `carritoDeCompra_id` BIGINT NOT NULL
);
CREATE TABLE `stock`(
    `cantidadDeLibros_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
CREATE TABLE `Autores`(
    `autor_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameAutor` LONGTEXT NOT NULL,
    `directionAutor` TEXT NOT NULL,
    `urlPag` TEXT NOT NULL
);
CREATE TABLE `Registro`(
    `registro_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cantidadLibros` INT NOT NULL
);
CREATE TABLE `Venta`(
    `facturacion_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` BIGINT NOT NULL
);
CREATE TABLE `Almacenes`(
    `almacen_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `codigo` INT NOT NULL,
    `directionAlmacen` TEXT NOT NULL,
    `numPhone` INT NOT NULL,
    `stock_id` BIGINT NOT NULL,
    `registro_id` BIGINT NOT NULL
);
CREATE TABLE `Carro de compra`(
    `cliente_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `stock_id` BIGINT NOT NULL,
    `carritoDeCompra_id` BIGINT NOT NULL
);
CREATE TABLE `Notificaciones`(
    `notificacion_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `cliente_id` BIGINT NOT NULL,
    `idEmailCliente` TEXT NULL
);
CREATE TABLE `Libro`(
    `tituloLibro` TEXT NOT NULL,
    `ISBN` BIGINT NOT NULL,
    `añoLibro` INT NULL,
    `precio` DOUBLE(8, 2) NOT NULL,
    `autor_id` BIGINT NOT NULL,
    `editor_id` BIGINT NOT NULL
);
CREATE TABLE `Editores`(
    `editor_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `nameEditor` LONGTEXT NOT NULL,
    `directionEditor` TEXT NOT NULL,
    `numPhone` INT NOT NULL,
    `urlPag` TEXT NOT NULL
);
CREATE TABLE `Historial de compra`(
    `coipasDeLibros_id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `librosEnCarrito_id` BIGINT NOT NULL
);
ALTER TABLE
    `Facturación` ADD CONSTRAINT `facturación_carritodecompra_id_foreign` FOREIGN KEY(`carritoDeCompra_id`) REFERENCES `Carro de compra`(`carritoDeCompra_id`);
ALTER TABLE
    `Libro` ADD CONSTRAINT `libro_autor_id_foreign` FOREIGN KEY(`autor_id`) REFERENCES `Autores`(`autor_id`);
ALTER TABLE
    `stock` ADD CONSTRAINT `stock_cantidaddelibros_id_foreign` FOREIGN KEY(`cantidadDeLibros_id`) REFERENCES `Historial de compra`(`coipasDeLibros_id`);
ALTER TABLE
    `Almacenes` ADD CONSTRAINT `almacenes_stock_id_foreign` FOREIGN KEY(`stock_id`) REFERENCES `Libro`(`ISBN`);
ALTER TABLE
    `Carro de compra` ADD CONSTRAINT `carro de compra_carritodecompra_id_foreign` FOREIGN KEY(`carritoDeCompra_id`) REFERENCES `Registro`(`registro_id`);
ALTER TABLE
    `Clientes` ADD CONSTRAINT `clientes_idemail_foreign` FOREIGN KEY(`idEmail`) REFERENCES `Notificaciones`(`notificacion_id`);
ALTER TABLE
    `Almacenes` ADD CONSTRAINT `almacenes_registro_id_foreign` FOREIGN KEY(`registro_id`) REFERENCES `Registro`(`cantidadLibros`);
ALTER TABLE
    `Historial de compra` ADD CONSTRAINT `historial de compra_coipasdelibros_id_foreign` FOREIGN KEY(`coipasDeLibros_id`) REFERENCES `Registro`(`registro_id`);
ALTER TABLE
    `Venta` ADD CONSTRAINT `venta_facturacion_id_foreign` FOREIGN KEY(`facturacion_id`) REFERENCES `Facturación`(`facturacion_id`);
ALTER TABLE
    `Carro de compra` ADD CONSTRAINT `carro de compra_stock_id_foreign` FOREIGN KEY(`stock_id`) REFERENCES `stock`(`cantidadDeLibros_id`);
ALTER TABLE
    `Venta` ADD CONSTRAINT `venta_cliente_id_foreign` FOREIGN KEY(`cliente_id`) REFERENCES `Clientes`(`cliente_id`);
ALTER TABLE
    `Carro de compra` ADD CONSTRAINT `carro de compra_stock_id_foreign` FOREIGN KEY(`stock_id`) REFERENCES `stock`(`cantidadDeLibros_id`);
ALTER TABLE
    `Historial de compra` ADD CONSTRAINT `historial de compra_librosencarrito_id_foreign` FOREIGN KEY(`librosEnCarrito_id`) REFERENCES `Carro de compra`(`stock_id`);
ALTER TABLE
    `Clientes` ADD CONSTRAINT `clientes_carritodecompra_id_foreign` FOREIGN KEY(`carritoDeCompra_id`) REFERENCES `Carro de compra`(`cliente_id`);
ALTER TABLE
    `Carro de compra` ADD CONSTRAINT `carro de compra_carritodecompra_id_foreign` FOREIGN KEY(`carritoDeCompra_id`) REFERENCES `Historial de compra`(`coipasDeLibros_id`);
ALTER TABLE
    `Libro` ADD CONSTRAINT `libro_isbn_foreign` FOREIGN KEY(`ISBN`) REFERENCES `Facturación`(`libro_id`);
ALTER TABLE
    `Libro` ADD CONSTRAINT `libro_editor_id_foreign` FOREIGN KEY(`editor_id`) REFERENCES `Editores`(`editor_id`);