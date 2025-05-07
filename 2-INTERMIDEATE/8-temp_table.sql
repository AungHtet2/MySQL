-- temporary table

create temporary table wwe_superstar (
	super_star_id int,
	Name varchar(50),
    Age int,
    Division text,
    Main_roster boolean
    
);

INSERT INTO wwe_superstar VALUES 
(10, 'Becky_Lynch', 38, 'RAW', TRUE),
(11, 'Rhea_Ripley', 27, 'RAW', TRUE),
(12, 'Charlotte_Flair', 37, 'SmackDown', TRUE),
(13, 'Bayley', 35, 'SmackDown', TRUE),
(14, 'Iyo_Sky', 34, 'SmackDown', TRUE),
(15, 'Asuka', 42, 'SmackDown', TRUE),
(16, 'Liv_Morgan', 30, 'RAW', TRUE),
(17, 'Raquel_Rodriguez', 33, 'RAW', TRUE),
(18, 'Zelina_Vega', 33, 'RAW', TRUE),
(19, 'Shayna_Baszler', 43, 'RAW', TRUE),
(20, 'Nia_Jax', 39, 'RAW', TRUE),
(21, 'Piper_Niven', 33, 'RAW', TRUE),
(22, 'Natalya', 42, 'SmackDown', TRUE),

(23, 'Roxanne_Perez', 22, 'NXT', FALSE),
(24, 'Lyra_Valkyria', 27, 'NXT', FALSE),
(25, 'Tiffany_StratoN', 25, 'NXT', FALSE),
(26, 'Thea_Hail', 20, 'NXT', FALSE);



SELECT *
FROM wwe_superstar
WHERE Age > 25 AND Division = 'RAW';




