DELETE FROM items WHERE name = 'repairkit';
DELETE FROM items WHERE name = 'cleaningkit';
DELETE FROM items WHERE name = 'tyrekit';
DELETE FROM items WHERE name = 'wheel';
DELETE FROM items WHERE name = 'nitrous';
DELETE FROM items WHERE name = 'plate';
DELETE FROM items WHERE name = 'tuningtablet';


INSERT INTO `items` (`name`, `label`, `weight`) VALUES
	('repairkit', 'Repair Kit', 1),
	('cleaningkit', 'Cleaning Kit', 1),
	('tyrekit', 'Tyre Kit', 1),
	('wheel', 'Wheel', 1),
	('nitrous', 'Nitrous', 1),
	('plate', 'Plate', 1),
	('tuningtablet', 'Tuning Tablet', 1)
;