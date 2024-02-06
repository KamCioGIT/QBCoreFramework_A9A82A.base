CREATE TABLE `gopostalletters` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `senderfirstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `senderlastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recipientfirstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recipientlastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `lettertext` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

CREATE TABLE `gopostalpackages` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `senderfirstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `senderlastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recipientfirstname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `recipientlastname` varchar(255) COLLATE utf8mb4_bin NOT NULL,
  `packageprice` int(11) NOT NULL,
  `packageitems` longtext COLLATE utf8mb4_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;

ALTER TABLE `gopostalletters`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gopostalpackages`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `gopostalletters`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `gopostalpackages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;