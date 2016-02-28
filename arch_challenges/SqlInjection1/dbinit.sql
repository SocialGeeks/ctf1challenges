CREATE DATABASE oroneisone;
USE oroneisone;
CREATE TABLE users(
    id INTEGER,
    uname VARCHAR(30),
    passw VARCHAR(30)
);

INSERT INTO users (id, uname, passw) VALUES
(1, 'admin', 'cNfy8i17ca2cOpqYzM9aHnxLysVrrz'),
(2, 'superuser', 'uitwnstTVTokBrQ8LFvKin8nYlBXgi'),
(3, 'user', '8VV1KvU8lo9rdioH7DmyRhcBl4ODxL');

GRANT SELECT on oroneisone.users to 'haypp_hxar'@'localhost' identified by 'dtIwRdKa0T22zoPngQyl7Cf5gcgYPC';

USE mysql;
UPDATE user set password=PASSWORD("798LV5Gcharq5y0c9vgCq66TZBXNmL") where User='root';

FLUSH privileges;
