--ESX

ALTER TABLE `users` ADD COLUMN
(
    `xp` int(20) NOT NULL DEFAULT 800,
    `xpreward` int(20) NOT NULL DEFAULT 0,
    `xpvipreward` int(20) NOT NULL DEFAULT 0,
    `vip` int(1) DEFAULT 0,
    `coins` int(50) DEFAULT 0
) 

--QB

ALTER TABLE `players` ADD COLUMN
(
    `xp` int(20) NOT NULL DEFAULT 0,
    `xpreward` int(20) NOT NULL DEFAULT 0,
    `xpvipreward` int(20) NOT NULL DEFAULT 0,
    `vip` int(1) DEFAULT 0,
    `coins` int(50) DEFAULT 0
) 