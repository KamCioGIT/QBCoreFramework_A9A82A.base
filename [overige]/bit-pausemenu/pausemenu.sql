--ESX
ALTER TABLE users ADD COLUMN (iban varchar(50) COLLATE utf8mb4_bin DEFAULT '0');

--QB
ALTER TABLE players ADD COLUMN (iban varchar(50) COLLATE utf8mb4_bin DEFAULT '0');