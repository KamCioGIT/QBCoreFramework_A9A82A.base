DELETE FROM items WHERE name = 'repairkit';
DELETE FROM items WHERE name = 'cleaningkit';
DELETE FROM items WHERE name = 'tyrekit';
DELETE FROM items WHERE name = 'wheel';


INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('repairkit', 'Repair Kit', 1),
	('cleaningkit', 'Cleaning Kit', 1),
	('tyrekit', 'Tyre Kit', 1),
	('wheel', 'Wheel', 1)
;