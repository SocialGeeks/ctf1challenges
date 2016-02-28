CREATE DATABASE oroneisone;
USE oroneisone;
CREATE TABLE users(
    id INTEGER,
    Username VARCHAR(30),
    Password VARCHAR(64)
);

CREATE TABLE products(
    id INTEGER,
    name VARCHAR(30),
    ppm FLOAT(7,4)
);

INSERT INTO products (id, name, ppm) VALUES
(1, 'Rhodium',    1.0),
(2, 'Platinum',   5.0),
(3, 'Gold',       4.0),
(4, 'Palladium',  15.0),
(5, 'Osmium',     1.5),
(6, 'Rhenium',    0.7),
(7, 'Ruthenium',  1.0),
(8, 'Germanium',  1500.0),
(9, 'Beryllium',  2800.0),
(10, 'Silver',    75.0),
(11, 'Gallium',   19000.0),
(12, 'Indium',    50.0),
(13, 'Tellurium', 1.0),
(14, 'Mercury',   85.0),
(15, 'Bismuth',   8.5);

INSERT INTO users (id, Username, Password) VALUES
(1, 'admin', 'cNfy8i17ca2zOpqYzM9aHnxLysVrrz'),
(2, 'superuser', 'KEY: uitwnstTVTozBrQ8LFvKin8nYlBXgi'),
(3, 'user', '8VV1KvUzlo9rdioH7DmyRhcBl4ODxL');

GRANT SELECT on oroneisone.users to 'haypp_hxar'@'localhost' identified by 'dtIwRdKa0T22zoPngQyl7Cf5gcgYPC';
GRANT SELECT on oroneisone.products to 'haypp_hxar'@'localhost' identified by 'dtIwRdKa0T22zoPngQyl7Cf5gcgYPC';

USE mysql;
UPDATE user set password=PASSWORD("798LV5Gcharq5y0c9vgCq66TZBXNmL") where User='root';

FLUSH privileges;
