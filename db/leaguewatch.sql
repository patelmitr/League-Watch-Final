CREATE DATABASE league_watch;
USE league_watch;

DROP Table if Exists Player;
DROP Table if Exists League;
DROP Table if Exists Message_Board;
DROP Table if Exists Injury_Report;
DROP Table if Exists Draft_Players;
DROP Table if Exists Team;
DROP Table if Exists Team_Manager;
DROP Table if Exists League_Commissioner;

CREATE TABLE League (
    league_name VARCHAR(100) PRIMARY KEY,
    salary_cap INT NOT NULL
);

CREATE TABLE League_Commissioner (
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    tenure INT NOT NULL,
    salary INT NOT NULL,
    league_commissioner_id INT PRIMARY KEY,
    league_name VARCHAR (100) NOT NULL,
    CONSTRAINT leagueComissioner_league FOREIGN KEY (league_name)
        REFERENCES League(league_name)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Team (
    team_name VARCHAR(100) NOT NULL,
    ranking INT NOT NULL,
    conference VARCHAR(100) NOT NULL,
    team_id INT PRIMARY KEY
);

CREATE TABLE Team_Manager (
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    tenure INT NOT NULL,
    salary INT NOT NULL,
    team_id INT NOT NULL,
    league_commissioner_id INT NOT NULL,
    team_manager_id INT PRIMARY KEY,
    CONSTRAINT leagueComissioner_teamManager FOREIGN KEY (league_commissioner_id)
        REFERENCES League_Commissioner(league_commissioner_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    CONSTRAINT teamManager_team FOREIGN KEY (team_id)
        REFERENCES Team(team_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Player (
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    salary INT NOT NULL,
    team_id INT,
    player_id INT PRIMARY KEY,
    player_number INT,
    position VARCHAR(5) NOT NULL,
    points INT,
    assists INT,
    steals INT,
    blocks INT,
    rebounds INT,
    turnovers INT,
    games_played INT,
    CONSTRAINT players_team FOREIGN KEY (team_id)
        REFERENCES Team(team_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Message_Board (
    message_id INT AUTO_INCREMENT PRIMARY KEY,
    message VARCHAR(100) NOT NULL,
    league_commissioner_id INT NOT NULL,
    CONSTRAINT messageBoard_leagueComissioner FOREIGN KEY (league_commissioner_id)
        REFERENCES League_Commissioner(league_commissioner_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Injury_Report (
    injury_id INT AUTO_INCREMENT PRIMARY KEY,
    injury VARCHAR(100),
    team_id INT NOT NULL,
    player VARCHAR(100),
    CONSTRAINT injuryReport_teamManager FOREIGN KEY (team_id)
        REFERENCES Team_Manager(team_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE Draft_Players (
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    ranking INT PRIMARY KEY,
    position VARCHAR(5) NOT NULL,
    team_manager_id INT NOT NULL,
    CONSTRAINT draftPlayers_teamManager FOREIGN KEY (team_manager_id)
        REFERENCES Team_Manager(team_manager_id)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

# -------------------------------------------------------------------------------------------
# Insert statements for league
# INSERT INTO League(league_name, salary_cap)
# VALUES
# ('National Basketball Association', 130000000);
INSERT INTO League(league_name,salary_cap) VALUES
 ('National Basketball Association','$133050199.85');
# select * from League;

# Insert statements for league commissioner
# INSERT INTO League_Commissioner (first_name, last_name, tenure, salary, league_commissioner_id, league_name)
# values
# ('Adam', 'Silver', 10, 50000000, 1, 'National Basketball Association');
INSERT INTO League_Commissioner(first_name,last_name,tenure,salary,league_commissioner_id,league_name) VALUES
 ('Carrol','Itscowicz',10,'$10000000.00',1,'National Basketball Association');
# select * from League_Commissioner;

# Insert statements for team
# INSERT Into Team (team_name, ranking, conference, team_id)
# VALUES
# ('Lakers', 8, 'Western', 1),
# ('Celtics', 1, 'Easter', 2),
# ('76ers', 8, 'Eastern', 3),
# ('Raptors', 8, 'Eastern', 4),
# ('Suns', 8, 'Western', 5);
INSERT INTO Team(team_name,ranking,conference,team_id) VALUES
 ('Celtics',10,'Western',15)
,('Suns',7,'Eastern',22)
,('Hawks',11,'Eastern',7)
,('Nuggets',20,'Eastern',26)
,('Knicks',6,'Eastern',8)
,('Jazz',2,'Eastern',21)
,('Wizards',22,'Eastern',3)
,('Spurs',4,'Western',2)
,('Pistons',25,'Eastern',22)
,('Bulls',26,'Western',18)
,('Pacers',11,'Eastern',5)
,('Knicks',17,'Eastern',9)
,('Bucks',17,'Western',27)
,('Pacers',21,'Eastern',6)
,('Hornets',30,'Eastern',17)
,('Nets',15,'Western',4)
,('Clippers',11,'Western',2)
,('Celtics',16,'Eastern',14)
,('Celtics',25,'Western',16)
,('Wizards',1,'Western',13)
,('Magic',21,'Eastern',1)
,('Heat',18,'Western',28)
,('Thunder',3,'Western',29)
,('76ers',16,'Eastern',11)
,('Clippers',17,'Western',20)
,('Cavaliers',6,'Western',2)
,('Pelicans',26,'Eastern',15)
,('Magic',13,'Western',3)
,('Hornets',30,'Western',6)
,('Wizards',13,'Eastern',22);
# select * from Team;

# Insert statements for team manager
# INSERT into Team_Manager (first_name, last_name, tenure, salary, team_id, league_commissioner_id, team_manager_id)
# VALUES
# ('Brad', 'Stevens', 2, 25000000, 2, 1, 100),
# ('Rob', 'Pelinka', 3, 25000500, 1, 1, 101),
# ('Calvin', 'Booth', 4, 15000000, 3, 1, 102),
# ('Elton', 'Brand', 3, 20000500, 4, 1, 103),
# ('Chad', 'Buchanan', 2, 13000000, 5, 1, 104);
INSERT INTO Team_Manager(first_name,last_name,tenure,salary,team_id,league_commissioner_id,team_manager_id) VALUES
 ('Benn','Matusson',1,'$4121900.52',29,1,1)
,('Stormie','Tidswell',2,'$2720512.62',26,1,2)
,('Corrine','Rebeiro',3,'$3436286.45',5,1,3)
,('Costa','Livens',4,'$4719309.25',13,1,4)
,('Trudi','Coleyshaw',5,'$3536914.67',1,1,5)
,('Lorenza','Robertet',6,'$3407640.08',28,1,6)
,('Ami','Barringer',7,'$4786890.54',13,1,7)
,('Chic','Loudian',8,'$4279631.62',17,1,8)
,('Haily','Cardon',9,'$4630686.22',3,1,9)
,('Demetri','Glentworth',10,'$3464879.75',21,1,10)
,('Ramsey','Fevier',11,'$3957217.54',2,1,11)
,('Griff','Mallett',12,'$2992152.50',29,1,12)
,('Marielle','Bauduin',13,'$2940601.74',15,1,13)
,('Heywood','Sunnex',14,'$3606162.89',22,1,14)
,('Sansone','Copas',15,'$4273364.12',3,1,15)
,('Rooney','MacCrachen',16,'$2857130.81',15,1,16)
,('Lucina','Marriner',17,'$4656094.99',15,1,17)
,('Jorey','Draisey',18,'$3673718.48',15,1,18)
,('Eada','Acarson',19,'$4573899.20',9,1,19)
,('Barton','Shadwick',20,'$2452269.78',4,1,20)
,('Tann','Malmar',21,'$4326830.77',11,1,21)
,('Mile','Piggott',22,'$2666683.29',17,1,22)
,('Paco','Oliveti',23,'$4701223.91',26,1,23)
,('Orin','McLaren',24,'$3501517.13',9,1,24)
,('Marijn','Miroy',25,'$3919733.68',2,1,25)
,('Florella','Mellsop',26,'$3570160.58',3,1,26)
,('Anna','Elfleet',27,'$4206539.18',18,1,27)
,('Berty','Trillow',28,'$2873251.26',29,1,28)
,('Cathrine','Franschini',29,'$3380168.97',28,1,29)
,('Alonzo','Gerrey',30,'$4117872.71',22,1,30);
# select * from Team_Manager;

# Insert statements for Players
# INSERT INTO Player(first_name, last_name, salary, team_id, player_id, player_number, position, points, assists,
#                    steals, blocks, rebounds, turnovers, games_played)
# VALUES
# ('LeBron', 'James', 35000000, 1, 1, 23,'sf', 5000, 400, 240, 50, 400, 30, 82),
# ('Marcus', 'Smart', 10000000, 2, 5, 36,'pg', 2000, 450, 300, 34, 500, 56, 41);
INSERT INTO Player(first_name,last_name,salary,team_id,player_id,player_number,position,points,assists,steals,blocks,rebounds,turnovers,games_played) VALUES
 ('Audrie','Buckett','$4449289.60',2,1,1,'pf',1365,330,70,10,250,33,82)
,('Yolane','Mustard','$4465306.09',5,2,2,'c',1401,150,18,20,550,82,80)
,('Alfie','Mansfield','$548224.65',15,3,3,'c',1688,180,65,18,330,80,80)
,('Kayla','Normanvell','$7505482.82',7,4,4,'c',1248,180,15,18,250,80,82)
,('Gun','Croal','$5302593.64',6,5,5,'c',1067,340,20,20,550,55,80)
,('Doralynn','Warret','$1221009.73',26,6,6,'sg',1229,120,50,20,0,0,33)
,('Fredelia','Galbreath','$6721537.29',18,7,7,'c',1235,330,80,15,800,55,33)
,('Perceval','Harroway','$6707052.90',22,8,8,'c',1067,340,34,50,100,10,10)
,('Willamina','Degnen','$3235597.12',21,9,9,'pf',1397,100,55,82,100,70,65)
,('Alf','McCloughen','$5913738.68',22,10,10,'sg',1397,320,12,65,820,55,55)
,('Aurelea','Minall','$2938695.03',20,11,11,'c',1365,180,12,10,100,0,80)
,('Merrill','Ferras','$5317215.62',2,12,12,'pg',1089,150,32,20,450,25,55)
,('Verne','Quade','$3112805.36',8,13,13,'pg',1813,180,20,50,0,10,10)
,('Marlin','Godin','$8228437.60',29,14,14,'pg',1089,150,45,82,820,25,80)
,('Benoit','Paice','$11976759.20',28,15,15,'sf',1420,330,55,32,450,25,82)
,('Ermentrude','Macon','$8666198.90',3,16,16,'c',1067,200,34,65,0,70,33)
,('Daisey','Babington','$6321965.58',1,17,17,'pf',1813,340,33,32,330,82,82)
,('Loydie','Hindshaw','$8040158.12',6,18,18,'sg',1426,200,32,70,450,82,65)
,('Marylee','Russon','$1009852.73',13,19,19,'c',1535,100,33,33,650,65,65)
,('Obadiah','Phinnessy','$10097797.69',15,20,20,'c',1365,330,15,12,820,25,0)
,('Stefa','Ravelus','$8888481.12',6,21,21,'pf',1535,0,0,33,450,55,70)
,('Teodorico','Sillis','$1681984.02',11,22,22,'pg',1365,200,25,45,100,80,55)
,('Derek','Klink','$9907030.08',17,23,23,'pg',1365,250,33,34,800,25,45)
,('Lennard','Najara','$5694298.52',15,24,24,'sg',1420,250,82,33,250,82,45)
,('Aarika','Adolthine','$6308714.09',15,25,25,'pg',1297,200,65,25,450,10,80)
,('Starla','Henzer','$1871132.10',9,26,26,'pf',1089,100,10,10,650,33,70)
,('Brennen','Hubbocks','$8970386.41',1,27,27,'sg',1775,150,82,82,550,55,55)
,('Casie','Durnford','$9021326.37',16,28,28,'sf',1649,150,25,33,330,10,65)
,('Farlee','Bending','$6250752.27',27,29,29,'pf',1401,250,25,80,700,10,0)
,('Karlens','Oldroyde','$5694487.51',28,30,30,'sg',1401,180,34,18,800,33,45)
,('Gardener','Chisnall','$8050051.98',22,31,31,'pf',1535,200,15,34,330,25,10)
,('Alyosha','Orum','$10290017.05',22,32,32,'sg',1429,120,70,12,330,25,82)
,('Janeta','Linke','$5574315.36',6,33,33,'c',1592,250,34,34,820,82,33)
,('Alicea','Hasling','$11420463.77',21,34,34,'c',1235,0,65,82,550,25,65)
,('Nana','Piggott','$9842465.16',3,35,35,'sg',1423,0,15,65,550,0,33)
,('Hendrik','Simenot','$3308524.00',29,36,36,'pf',1932,250,34,32,100,45,65)
,('Zollie','Futty','$9022129.29',18,37,37,'sf',1988,250,20,55,250,10,45)
,('Augusta','Garham','$2160122.10',2,38,38,'c',1229,200,10,10,330,82,10)
,('Josefa','Franzelini','$2765403.63',2,39,39,'sf',1423,250,70,12,0,25,45)
,('Obediah','Lambird','$1912393.54',26,40,40,'c',1462,200,25,65,650,25,70)
,('Raynor','Bosma','$7665679.67',8,41,41,'c',1904,250,34,82,550,33,55)
,('Jefferson','Shooter','$1106671.76',17,42,42,'sg',1420,100,20,20,800,0,80)
,('Chantal','Coggles','$4547740.79',18,43,43,'sg',1688,320,33,18,650,55,33)
,('Rea','Jordi','$7790223.76',21,44,44,'pf',1864,330,80,82,100,55,0)
,('Elliott','Bang','$8224832.14',7,45,45,'sf',1649,320,55,82,100,65,25)
,('Yvor','Dockrell','$3632886.68',2,46,46,'pg',1861,330,15,20,250,45,10)
,('Trix','Jacobovitz','$6933511.06',13,47,47,'c',1429,250,34,12,800,25,82)
,('Wendeline','Luce','$7839429.13',16,48,48,'pf',1248,100,33,33,330,45,45)
,('Tomaso','Anthoin','$9392248.42',22,49,49,'sf',1397,0,15,15,0,45,80)
,('Tedmund','Kiossel','$3879145.04',1,50,50,'pf',1462,180,70,33,650,45,55)
,('Marne','Dakin','$3400115.12',22,51,51,'pf',1297,250,70,70,250,10,55)
,('Constantina','Pirson','$6050254.97',9,52,52,'sf',1688,330,65,70,650,80,0)
,('Monique','Piolli','$10559620.61',2,53,53,'sf',1235,150,15,25,450,82,70)
,('Flory','Matteo','$11811105.95',27,54,54,'c',1462,180,25,80,550,82,82)
,('Manolo','Cockrill','$10741173.84',6,55,55,'sg',1592,180,50,12,100,70,55)
,('Paco','Sartain','$11434415.52',11,56,56,'pf',1921,320,32,50,450,82,10)
,('Victor','Sprulls','$6943575.72',15,57,57,'sg',1089,320,80,18,700,65,10)
,('Allyson','Edworthie','$4992693.39',15,58,58,'c',1365,120,12,25,450,80,33)
,('Slade','Batho','$7668802.95',5,59,59,'sf',1864,180,55,25,800,70,55)
,('Doro','Chansonne','$3044537.68',22,60,60,'c',1904,180,34,33,650,10,10)
,('Ernestus','Scamp','$8807252.30',9,61,61,'pf',1297,100,33,15,650,0,33)
,('Karrie','Kewzick','$4995611.25',1,62,62,'sg',1535,120,20,20,800,55,45)
,('Alvin','Clevely','$9024063.32',29,63,63,'sf',1235,120,82,65,0,45,65)
,('Cobb','Summerill','$10085468.61',3,64,64,'pf',1754,180,25,80,0,33,33)
,('Oralle','Burness','$3912944.13',17,65,65,'sg',1397,180,82,65,650,10,82)
,('Bing','Bestwerthick','$6057929.24',8,66,66,'pf',1429,180,70,70,100,65,65)
,('Tanney','Fritche','$4928891.13',22,67,67,'sf',1229,180,45,32,0,10,55)
,('Denna','Stoute','$11873230.17',7,68,68,'sf',1297,0,50,70,550,82,10)
,('Sabina','Beretta','$7076371.69',28,69,69,'pf',1401,250,50,10,450,55,0)
,('Antonie','Aiken','$7770532.72',15,70,70,'c',1248,120,25,33,330,65,80)
,('Matthus','Wickwarth','$2803996.82',27,71,71,'c',1823,120,34,34,700,10,10)
,('Dora','Marshal','$7995218.44',13,72,72,'sf',1861,320,25,18,0,45,0)
,('Bartholomew','Trow','$899763.92',2,73,73,'sf',1688,100,25,15,250,0,55)
,('Lauree','Cornfield','$11806679.38',16,74,74,'pf',1420,330,82,65,450,65,45)
,('Sascha','Sturte','$9290477.49',18,75,75,'sg',1861,180,55,12,330,0,0)
,('Dottie','Branthwaite','$2482144.63',4,76,76,'pg',1535,330,55,25,800,25,70)
,('David','Lashbrook','$4022249.87',14,77,77,'sf',1248,250,20,65,650,65,0)
,('Gilly','Guisot','$7967583.27',2,78,78,'pf',1365,100,70,15,0,10,65)
,('Hank','Haselgrove','$4541651.58',5,79,79,'pg',1535,250,80,82,550,55,33)
,('Cathleen','Hullock','$8787027.67',11,80,80,'sg',1365,330,12,12,650,70,0)
,('Robby','Ramsted','$11319522.33',8,81,81,'sg',1823,150,20,55,700,0,82)
,('Gran','Labbet','$3751466.13',13,82,82,'pg',1988,250,15,32,550,65,70)
,('Patton','Kershaw','$2874004.44',3,83,83,'pf',1754,330,15,12,800,10,25)
,('Romeo','Legge','$10904713.39',22,84,84,'sf',1864,330,10,45,650,0,65)
,('Arturo','Swain','$4065819.07',21,85,85,'c',1423,340,80,65,250,0,25)
,('Dom','Izard','$614368.41',16,86,86,'sg',1420,330,82,32,100,10,80)
,('Rodney','Hadingham','$2880116.64',15,87,87,'sf',1921,200,32,15,100,80,65)
,('Shannen','O''Growgane','$7992446.26',22,88,88,'pf',1221,330,20,80,250,25,55)
,('Muire','Greenhill','$555891.92',6,89,89,'sg',1235,250,0,25,820,70,45)
,('Had','McBean','$736603.75',2,90,90,'sg',1688,340,70,55,700,45,70)
,('Devlin','Streader','$4915804.76',17,91,91,'c',1397,150,25,20,250,82,80)
,('Fancy','Sibly','$7469156.08',14,92,92,'sg',1221,250,80,80,330,0,65)
,('Margalo','Macartney','$6612597.23',29,93,93,'sf',1932,250,34,10,650,55,33)
,('Cathrin','Stode','$11808606.14',3,94,94,'sf',1535,250,50,33,550,65,70)
,('Grady','Dannohl','$7322472.74',22,95,95,'sg',1235,330,32,25,820,82,33)
,('Aida','Rodolico','$5338148.53',11,96,96,'c',1592,320,50,45,0,25,55)
,('Dorothee','Szwarc','$9120580.14',5,97,97,'sg',1297,340,10,33,820,45,10)
,('Yetty','Kareman','$8917582.13',4,98,98,'c',1420,0,15,18,0,65,70)
,('Loutitia','World','$11847945.46',26,99,99,'pg',1429,250,33,10,820,33,0)
,('Sandra','Godspeede','$1535706.69',6,100,100,'c',1864,320,12,33,700,10,45)
,('Jessey','Cottage','$4605175.92',2,101,101,'sg',1089,120,34,33,550,55,10)
,('Gardie','Braidley','$9712038.68',17,102,102,'pf',1861,200,65,33,330,25,80)
,('Elianora','Rzehor','$11110838.39',18,103,103,'sf',1248,340,80,33,550,0,65)
,('Martica','Dedrick','$4828503.55',2,104,104,'c',1067,180,82,12,0,25,65)
,('Vivienne','Naisby','$10938511.42',3,105,105,'sf',1462,120,65,45,450,0,45)
,('Shannah','Burgin','$3568235.15',29,106,106,'sf',1904,0,12,33,250,33,0)
,('Sonnie','Luppitt','$7743296.76',5,107,107,'c',1397,150,10,25,250,25,0)
,('Jyoti','Berzons','$3305108.26',22,108,108,'pg',1932,200,20,70,100,45,33)
,('Jacquenetta','Fidgeon','$9639992.60',15,109,109,'pf',1462,150,45,33,250,82,45)
,('Rurik','Dowgill','$4527140.56',21,110,110,'sg',1429,330,82,12,100,70,70)
,('Zorana','Maudsley','$1618433.61',8,111,111,'pf',1401,340,33,25,250,45,70)
,('Maribelle','Parradine','$8065712.05',16,112,112,'pg',1229,330,20,25,700,82,45)
,('Fanya','Bluett','$8904006.80',28,113,113,'c',1921,100,18,82,820,55,55)
,('Debby','Rosenstiel','$4777792.40',7,114,114,'sf',1823,150,45,10,0,80,0)
,('Llywellyn','Girardez','$7469437.14',15,115,115,'c',1688,180,18,20,700,33,55)
,('Jordain','Enderlein','$1136927.96',6,116,116,'sf',1365,120,65,45,650,10,33)
,('Park','Diable','$5539203.69',22,117,117,'sf',1813,330,55,15,550,33,55)
,('Carie','Gaspero','$2266230.45',11,118,118,'sg',1932,200,55,82,820,25,33)
,('Emilie','Thacke','$5674358.71',20,119,119,'c',1864,150,0,80,820,10,70)
,('Alysia','Methringham','$8073141.60',27,120,120,'c',1754,150,50,25,700,55,33)
,('Alair','Dowyer','$8634413.28',5,121,121,'pg',1426,330,33,0,0,0,45)
,('Cesar','Heephy','$1415341.33',15,122,122,'c',1089,200,34,18,100,25,70)
,('Alejoa','Teresse','$10329659.10',4,123,123,'pf',1688,330,33,33,650,25,55)
,('Elfie','MacFaul','$3155937.37',26,124,124,'sf',1365,0,33,15,250,82,65)
,('Stearne','Lodevick','$2339041.26',22,125,125,'pf',1823,180,55,80,250,45,45)
,('Lynett','Seaward','$2650377.41',8,126,126,'sf',1921,150,10,18,100,80,33)
,('Arlyne','Fawcett','$6945514.65',2,127,127,'sf',1988,150,15,12,450,45,55)
,('Gilemette','Casford','$6089311.26',20,128,128,'c',1775,120,50,18,100,82,55)
,('Grady','Copas','$10907523.11',3,129,129,'sf',1754,250,18,32,450,65,33)
,('Willie','Heardman','$2970554.07',6,130,130,'sf',1067,120,18,32,800,0,55)
,('Mart','Athow','$805780.62',13,131,131,'c',1397,340,33,18,330,10,55)
,('Judi','Ortega','$6475543.82',22,132,132,'c',1429,0,33,18,0,25,70)
,('Shaw','Fanthome','$4903152.62',22,133,133,'c',1462,340,45,10,330,82,80)
,('Idalina','Elham','$3313466.64',9,134,134,'pg',1535,0,55,50,250,65,65)
,('Fin','Deport','$3342887.30',6,135,135,'c',1988,340,70,55,550,33,10)
,('Tabb','Barney','$7651436.66',28,136,136,'pf',1397,320,33,25,250,55,55)
,('Morgan','Lepick','$11905665.43',27,137,137,'c',1592,100,32,25,650,80,25)
,('Sollie','Clinnick','$912044.00',17,138,138,'pf',1813,100,20,18,700,25,45)
,('Gregoire','Southcomb','$7047116.74',3,139,139,'pf',1813,180,12,45,550,33,25)
,('Derward','Beckworth','$10393785.22',21,140,140,'sg',1297,250,12,20,550,45,25)
,('Jelene','Muncaster','$3213137.63',14,141,141,'sf',1932,340,12,32,0,55,70)
,('Clevey','McKeney','$1502146.97',6,142,142,'pg',1429,100,80,45,550,0,80)
,('Chet','Iacovozzo','$7979030.24',15,143,143,'sg',1291,120,18,55,330,45,10)
,('Yvor','Spurr','$5638468.89',18,144,144,'pg',1426,250,18,25,800,10,33)
,('Basile','Mountstephen','$4047627.10',11,145,145,'c',1067,0,25,20,250,80,82)
,('Madelle','Trime','$6908898.87',7,146,146,'c',1420,250,45,33,250,0,45)
,('Joell','Ceschelli','$761132.45',28,147,147,'sg',1535,180,15,18,450,80,10)
,('Meredeth','Matthisson','$2020886.06',3,148,148,'pg',1423,100,34,25,0,70,0)
,('Brit','Bourner','$7192698.98',2,149,149,'sf',1988,330,33,55,450,10,70)
,('Wain','Ferrick','$7293523.85',21,150,150,'c',1248,330,25,25,250,80,55)
,('Hattie','Goldsack','$6610357.02',5,151,151,'pg',1904,100,25,65,100,80,25)
,('Rudie','Kindleysides','$7939164.03',22,152,152,'sg',1462,330,25,25,800,82,70)
,('Michaella','Kermath','$2611223.85',13,153,153,'pg',1429,250,80,25,450,55,33)
,('Rachel','Harrad','$5677815.04',2,154,154,'sg',1823,0,32,65,820,80,0)
,('Rochella','Hodjetts','$11358684.43',15,155,155,'sf',1864,150,34,45,700,33,45)
,('Sibeal','Acors','$937115.54',26,156,156,'pg',1221,330,50,33,650,45,33)
,('Boothe','Effaunt','$3803525.03',29,157,157,'sg',1221,320,10,33,650,45,55)
,('Arlyne','Dyzart','$2985167.35',3,158,158,'sf',1401,250,25,45,820,80,10)
,('Aaren','Haynes','$2602118.37',6,159,159,'sf',1921,150,82,32,450,55,25)
,('Myrtice','Bruckstein','$6518747.11',20,160,160,'sf',1221,200,12,0,550,80,82)
,('Mattias','Hinz','$870004.38',2,161,161,'sg',1089,330,82,82,800,45,0)
,('Wendell','Patershall','$1431984.98',6,162,162,'c',1397,120,45,20,250,82,33)
,('Niccolo','Jorgesen','$4663473.07',4,163,163,'sf',1462,330,12,33,550,25,80)
,('Cybill','Water','$4678692.85',13,164,164,'pf',1904,250,70,18,330,82,80)
,('Lorelle','Fritter','$608366.07',27,165,165,'pg',1535,0,0,18,250,65,45)
,('Vin','Larmour','$5578492.69',6,166,166,'c',1089,320,10,33,250,45,82)
,('Ruperto','Worpole','$3295287.06',1,167,167,'sf',1365,150,45,65,330,80,10)
,('Emmi','Feyer','$9789032.66',22,168,168,'pg',1535,340,70,34,450,70,45)
,('Libbey','Lansberry','$9398237.27',26,169,169,'sg',1861,120,82,18,650,82,65)
,('Klarika','Bloschke','$10367973.62',8,170,170,'sg',1921,330,25,15,330,33,70)
,('Husain','Gunter','$1995861.23',18,171,171,'pf',1813,330,55,25,820,33,55)
,('Maurie','Mayou','$6764248.69',14,172,172,'sf',1423,150,0,10,450,70,82)
,('Tomi','Claypoole','$3576812.25',17,173,173,'c',1089,330,15,18,0,70,0)
,('Magdalen','Graysmark','$1256120.59',16,174,174,'c',1297,320,80,34,650,65,45)
,('Carmelle','Fiske','$3316424.72',20,175,175,'sf',1775,330,10,20,820,10,82)
,('Artair','Gemnett','$2235699.10',22,176,176,'sg',1861,330,70,55,330,45,55)
,('Curran','Luchelli','$1236073.98',15,177,177,'sg',1921,330,33,33,450,70,45)
,('Jordon','Elford','$10078324.73',21,178,178,'sf',1401,340,25,80,800,65,82)
,('Ellen','Rosoman','$9914871.34',29,179,179,'pf',1291,150,15,0,650,80,33)
,('Pauletta','Klaff','$11226048.11',7,180,180,'pf',1089,320,15,18,820,33,80)
,('Eldon','Gamble','$11417787.82',29,181,181,'pg',1535,330,25,15,550,55,33)
,('Sherwynd','Yorke','$8484527.36',2,182,182,'c',1291,0,32,55,550,45,45)
,('Nelson','Maypother','$8714548.74',20,183,183,'c',1420,200,80,80,330,70,33)
,('Jeniece','Phettis','$9273049.86',6,184,184,'sg',1291,340,25,10,800,10,25)
,('Adrianne','Murdy','$6913982.11',5,185,185,'sf',1297,150,32,33,100,45,0)
,('Hershel','Durrance','$8516336.55',17,186,186,'pf',1688,200,80,12,800,82,82)
,('Nert','Prugel','$9875837.37',8,187,187,'sg',1649,320,34,32,800,10,82)
,('Efren','Ferrarini','$9595247.64',11,188,188,'pg',1235,250,34,33,0,70,10)
,('Dosi','Willmer','$4187452.69',2,189,189,'c',1988,330,0,80,650,80,33)
,('Lorianne','Rendell','$9034340.71',22,190,190,'c',1592,320,18,0,550,80,10)
,('Viviyan','Gribbins','$2591024.35',18,191,191,'sg',1248,100,18,25,820,10,70)
,('Tony','Seakings','$781907.29',27,192,192,'pf',1813,250,33,70,250,33,10)
,('Krisha','Whitten','$8972875.05',15,193,193,'c',1426,320,65,10,450,55,0)
,('Perry','Spinks','$6526527.18',9,194,194,'sf',1365,320,25,65,450,10,33)
,('Garey','Hawson','$8952806.03',22,195,195,'sf',1235,330,80,18,800,10,80)
,('June','D''Alessandro','$9233190.63',26,196,196,'pf',1420,100,0,12,450,82,10)
,('Aleece','Marcum','$1065161.42',1,197,197,'sg',1754,330,20,55,800,80,80)
,('Hollie','Villalta','$10466005.00',2,198,198,'pg',1823,330,80,15,330,10,0)
,('Becca','Shimmans','$1073118.45',22,199,199,'c',1462,330,70,25,650,80,10)
,('Denice','Kilban','$4642837.57',3,200,200,'c',1221,340,80,82,650,0,82)
,('Gaspar','Brereton','$4100231.40',26,201,201,'c',1297,330,25,25,100,25,25)
,('Marcellina','Corkel','$3352371.97',7,202,202,'pg',1861,250,25,25,0,80,25)
,('Silva','Overell','$3340456.39',6,203,203,'sf',1813,250,55,10,0,80,82)
,('Jeramie','Iliffe','$9298440.78',3,204,204,'sg',1823,250,65,82,820,25,82)
,('Jessie','Goodyear','$5813732.67',2,205,205,'pf',1904,120,70,33,700,70,0)
,('Eli','Ricold','$6766579.59',22,206,206,'sf',1864,250,33,33,820,45,82)
,('Freddie','Ochiltree','$11190727.33',2,207,207,'c',1426,320,33,50,250,0,55)
,('Boone','MacSporran','$786257.54',15,208,208,'pf',1754,250,45,18,330,82,55)
,('Maurice','Cordell','$7593514.64',16,209,209,'sf',1535,320,32,25,650,70,33)
,('Lorilyn','Joddens','$11362798.13',28,210,210,'pf',1248,320,34,45,800,45,10)
,('Tarrah','Eagar','$11814230.38',20,211,211,'sg',1221,180,15,82,450,25,80)
,('Salomone','Teck','$8134643.94',13,212,212,'pg',1291,180,45,25,330,45,80)
,('Jany','Larrat','$10918947.06',18,213,213,'pf',1462,250,82,82,100,65,70)
,('Benedick','Bulled','$4344589.36',1,214,214,'sg',1221,100,33,34,0,33,33)
,('Irv','Portwain','$2418914.98',2,215,215,'c',1297,330,33,80,330,33,0)
,('Lillian','Cathcart','$11314393.27',14,216,216,'sg',1221,250,55,45,800,25,55)
,('Culley','MacIan','$11720106.69',22,217,217,'sf',1229,250,32,45,0,25,80)
,('Hollie','Peagrim','$4457878.08',5,218,218,'sg',1592,200,34,20,330,33,45)
,('Prudy','Crewdson','$9007904.99',21,219,219,'sg',1235,330,0,70,820,70,65)
,('Ignace','Redihough','$7437108.82',9,220,220,'sf',1932,330,20,34,450,25,33)
,('Abbey','Hexum','$4559419.75',6,221,221,'sf',1229,150,32,10,550,55,65)
,('Edward','Larmett','$11883068.01',17,222,222,'pg',1291,250,65,82,330,55,25)
,('Carmelle','Lorent','$11005421.68',9,223,223,'pf',1221,330,25,32,250,10,0)
,('Zola','Kennelly','$11611178.03',15,224,224,'pg',1904,0,80,32,700,65,10)
,('Irving','Lilburn','$2389802.20',4,225,225,'pg',1988,340,33,45,650,55,10)
,('Tybie','Iffland','$4584227.85',21,226,226,'pg',1429,320,55,25,0,65,33)
,('Stanwood','Hayter','$5866675.14',16,227,227,'sf',1823,330,45,80,330,0,45)
,('Conant','Putland','$1267905.06',11,228,228,'pf',1420,0,0,33,0,70,80)
,('Rurik','Bloxsome','$2961151.85',13,229,229,'sg',1592,120,15,34,250,10,25)
,('Brantley','Enric','$3352377.01',22,230,230,'pg',1089,250,20,65,650,55,55)
,('Genevieve','Drummer','$5360148.38',22,231,231,'sf',1775,200,0,34,330,10,55)
,('Leyla','Tinghill','$11871269.00',7,232,232,'sf',1754,200,34,70,800,45,70)
,('Dorie','Huburn','$2906177.76',1,233,233,'sg',1988,180,33,0,0,33,55)
,('Demetrius','Kerbey','$4499323.34',28,234,234,'sg',1067,120,45,18,700,0,80)
,('Inez','MacLaverty','$2123312.72',3,235,235,'pg',1535,180,25,10,450,55,45)
,('Harriette','Lerwell','$5640919.80',2,236,236,'sf',1988,150,12,33,800,33,65)
,('Joan','St. Queintain','$6163149.80',18,237,237,'pg',1754,120,55,32,250,0,55)
,('Stephan','Slavin','$4581846.36',2,238,238,'c',1754,330,33,80,650,65,45)
,('Kary','MacGettigen','$9284264.93',26,239,239,'pg',1592,250,80,0,550,65,70)
,('Sandor','Gregoraci','$688931.01',8,240,240,'pf',1932,340,65,32,450,45,65)
,('Sharla','Maeer','$3994546.05',5,241,241,'pf',1401,250,33,33,450,82,33)
,('Tate','Cadagan','$4688848.42',17,242,242,'c',1429,200,10,82,550,82,10)
,('Donny','Wapple','$7079160.34',1,243,243,'pg',1649,250,50,25,700,33,65)
,('Steffen','Cuseck','$4319647.87',6,244,244,'pg',1423,340,0,25,820,55,70)
,('Emmalyn','Crookall','$798227.92',6,245,245,'c',1297,330,18,45,820,55,55)
,('Maxwell','Kingsley','$3251921.45',15,246,246,'pg',1401,200,34,33,250,0,70)
,('Cacilia','Stainer','$1027957.99',13,247,247,'c',1401,100,70,50,250,82,80)
,('Muffin','Canning','$3925911.61',14,248,248,'pf',1397,200,82,33,330,45,80)
,('Lissy','Stoter','$7926483.62',20,249,249,'sg',1423,150,18,12,330,82,82)
,('Cynthia','Eales','$690473.45',22,250,250,'c',1426,330,55,33,250,25,65)
,('Kennie','Ebbage','$10646534.98',18,251,251,'pf',1429,340,45,82,100,55,33)
,('Debera','Dugget','$5727672.54',28,252,252,'pg',1649,120,0,33,0,82,70)
,('Yoshiko','Daniele','$8798707.35',2,253,253,'c',1089,340,15,45,700,80,33)
,('Pietro','Marrow','$5145414.27',3,254,254,'c',1592,120,20,25,250,0,33)
,('Barnabe','Banat','$601208.31',26,255,255,'sg',1297,330,82,70,820,33,33)
,('Jilli','Rapps','$5030693.39',22,256,256,'sf',1462,180,45,15,0,10,45)
,('Melisa','Battell','$10281133.83',27,257,257,'sf',1921,250,12,33,700,65,0)
,('Hube','Swalowe','$8272142.69',8,258,258,'pf',1688,0,50,20,0,10,10)
,('Staffard','Gaynes','$9523763.67',16,259,259,'sg',1248,150,80,33,100,25,33)
,('Horton','Gaiford','$9739385.90',21,260,260,'sf',1813,120,45,0,330,82,33)
,('Loreen','Liddy','$1123804.60',17,261,261,'pg',1988,120,82,18,650,82,25)
,('Ignace','Trenholm','$11097338.80',27,262,262,'pg',1592,330,50,45,0,0,80)
,('Christy','Wann','$5873084.10',9,263,263,'sf',1649,150,80,32,250,65,25)
,('Edmund','MacDearmont','$7899193.87',3,264,264,'c',1420,120,80,80,250,25,82)
,('Kelbee','Buttrey','$7468733.25',8,265,265,'sf',1235,330,10,33,250,55,0)
,('Skippy','Wace','$10230886.36',29,266,266,'pf',1775,330,32,32,700,70,0)
,('Pebrook','Costa','$2026314.12',20,267,267,'sg',1921,180,55,50,650,33,80)
,('Granthem','Maccaig','$9215429.44',22,268,268,'sg',1813,320,12,34,0,0,0)
,('Lilias','Dunlop','$2485268.41',6,269,269,'pf',1754,200,55,82,550,33,25)
,('Wendel','Reddan','$9830906.05',7,270,270,'sf',1921,320,25,0,650,45,80)
,('Alanah','Kettley','$604815.65',18,271,271,'sg',1864,100,80,65,250,0,65)
,('Christina','Barnbrook','$8304251.58',1,272,272,'sg',1429,200,12,25,820,10,0)
,('Ardis','Ottam','$8823807.82',5,273,273,'sg',1429,150,18,0,650,0,55)
,('Kit','Huleatt','$7517441.90',15,274,274,'pg',1904,200,25,25,330,45,80)
,('Ximenes','Covey','$10027144.21',2,275,275,'c',1089,120,34,45,100,70,33)
,('Louisa','Garfoot','$8238721.49',22,276,276,'sf',1291,340,25,50,0,70,0)
,('Stephani','Perigoe','$1904845.54',26,277,277,'c',1861,250,33,15,450,45,80)
,('Matthaeus','Nagle','$2726085.24',16,278,278,'c',1775,120,20,18,330,65,10)
,('Blancha','Pittway','$8122178.96',3,279,279,'pg',1248,120,10,80,550,0,33)
,('Kalina','Zanassi','$4459965.40',14,280,280,'pf',1535,320,50,32,330,45,55)
,('Alison','Culbard','$8403083.58',18,281,281,'pf',1462,100,18,55,0,82,0)
,('Stefania','Benzi','$9806189.74',22,282,282,'sf',1365,180,0,25,250,70,70)
,('Katy','Blumson','$8377685.08',6,283,283,'sf',1775,100,12,15,450,10,55)
,('Lodovico','Soall','$4386106.26',2,284,284,'sf',1775,320,15,50,330,25,80)
,('Deck','Moulding','$11223894.93',20,285,285,'pf',1864,330,65,12,450,70,0)
,('Katherine','Grassin','$1786797.73',26,286,286,'sf',1420,180,50,50,550,0,65)
,('Perle','Puve','$7149395.12',27,287,287,'pf',1813,180,55,32,450,70,80)
,('Yettie','Cowley','$7296996.13',5,288,288,'pg',1426,340,25,82,820,33,82)
,('Loreen','Pearne','$4973188.67',16,289,289,'c',1297,0,10,34,250,55,33)
,('Aigneis','Hinzer','$11591450.96',11,290,290,'sf',1864,330,33,33,820,80,25)
,('Dominick','Lyosik','$6561184.23',15,291,291,'pf',1813,250,25,80,100,45,65)
,('Flint','Bockmann','$6761298.26',29,292,292,'c',1401,250,15,20,800,25,33)
,('Cassi','Ludy','$8520435.21',4,293,293,'sg',1462,340,12,65,0,33,25)
,('Milt','Volonte','$7807740.18',3,294,294,'c',1248,340,10,15,550,33,82)
,('Zandra','Shead','$8085574.66',13,295,295,'sf',1429,320,20,25,650,10,80)
,('Megan','Bradnam','$3578588.28',17,296,296,'pf',1649,150,34,70,100,70,10)
,('Minnnie','Hymers','$10471925.92',3,297,297,'c',1823,250,20,50,450,10,25)
,('Elizabet','Joul','$6826466.86',2,298,298,'c',1235,0,18,32,250,65,70)
,('Harwilll','Krysztowczyk','$603619.97',7,299,299,'sg',1535,340,20,70,330,10,70)
,('Rodolfo','Faust','$8239734.17',22,300,300,'pg',1462,0,82,20,820,55,65)
,('Bee','Kernar','$2689362.18',18,301,301,'c',1754,320,32,80,820,70,82)
,('Marco','Lyfe','$4548112.77',26,302,302,'pf',1291,180,25,25,250,10,10)
,('Fidelia','O''Henehan','$1468010.52',16,303,303,'pg',1401,320,82,10,0,80,45)
,('Kevin','Simons','$8126426.12',2,304,304,'c',1397,250,45,34,650,55,82)
,('Albrecht','Fields','$8355408.10',9,305,305,'c',1297,100,65,45,0,25,70)
,('Miof mela','Melmeth','$4605759.11',7,306,306,'sg',1688,340,18,82,330,80,33)
,('Noelani','Grimsley','$3102119.15',15,307,307,'pg',1229,340,50,65,550,25,80)
,('Godfry','Reimer','$1688756.95',17,308,308,'sf',1420,180,25,80,800,82,70)
,('Daffi','Bowe','$9742416.94',3,309,309,'sf',1089,330,25,10,250,55,70)
,('Collie','Jankiewicz','$1927190.12',28,310,310,'pf',1592,180,12,82,250,25,33)
,('Marmaduke','Macguire','$5956984.87',22,311,311,'sg',1775,330,0,12,0,0,45)
,('Celisse','Sunman','$9152066.07',15,312,312,'sg',1688,180,65,34,100,25,65)
,('Celine','Fiddymont','$11063353.41',2,313,313,'sf',1067,330,50,12,330,25,0)
,('Henryetta','Stodart','$1232875.11',20,314,314,'c',1365,250,33,70,330,55,25)
,('Gabe','Filov','$1621738.38',13,315,315,'pf',1235,250,65,34,0,10,0)
,('Charmane','Demicoli','$11072494.42',27,316,316,'sf',1291,150,50,18,330,33,0)
,('Molli','Casacchia','$5777005.37',6,317,317,'pf',1921,200,82,65,330,82,0)
,('Danyette','Cleynman','$7537622.02',1,318,318,'sf',1235,340,65,18,700,0,10)
,('Sarette','Moyler','$596877.10',22,319,319,'pg',1229,330,55,45,450,70,10)
,('Torry','Winley','$11656413.06',3,320,320,'pf',1221,120,34,80,330,45,0)
,('Cyril','Macellar','$971156.92',15,321,321,'c',1688,250,45,15,700,0,25)
,('Laurette','Pottberry','$1339972.18',26,322,322,'c',1688,330,82,70,650,0,70)
,('Dion','Chiswell','$2992079.87',9,323,323,'sf',1932,250,15,80,330,25,33)
,('Merrilee','Dunphy','$3229489.40',29,324,324,'sf',1462,0,10,25,650,33,0)
,('Mina','Crotch','$11577232.31',22,325,325,'sg',1861,250,0,34,650,25,70)
,('Marcy','Kubasek','$9687192.46',16,326,326,'sg',1861,250,55,70,250,80,33)
,('Waylan','Kytter','$8015897.47',28,327,327,'sf',1397,180,55,32,550,65,45)
,('Almeda','Airton','$6057994.66',21,328,328,'c',1423,180,15,15,800,82,0)
,('Mal','Dibden','$3609778.44',18,329,329,'pg',1864,330,0,45,0,80,25)
,('Carmine','Chatwood','$4290703.46',27,330,330,'pg',1429,120,10,32,650,33,82)
,('Lamond','Legh','$6213661.17',22,331,331,'sf',1688,180,12,70,700,25,10)
,('Susy','Ballantine','$9990038.22',6,332,332,'c',1067,250,80,0,450,80,65)
,('Edy','Nisard','$6245704.57',13,333,333,'pf',1429,340,0,70,550,45,45)
,('Olenolin','Arnaudi','$7228898.79',3,334,334,'sg',1423,120,18,34,0,80,80)
,('Leelah','Willmetts','$9741244.96',14,335,335,'sg',1921,330,33,25,330,65,70)
,('Edy','Lambot','$11406431.90',22,336,336,'c',1397,250,80,10,330,55,65)
,('Rad','Beacroft','$3739665.04',4,337,337,'pg',1932,330,25,25,450,70,45)
,('Genvieve','Hullin','$5485739.47',2,338,338,'pf',1904,320,70,12,100,45,80)
,('Laverna','Cumpsty','$4570271.61',20,339,339,'pf',1932,180,15,32,700,0,55)
,('Francesco','Tommei','$9015612.63',5,340,340,'c',1248,330,70,33,550,10,82)
,('Lona','Kidney','$8794298.62',15,341,341,'pg',1297,120,82,45,0,80,25)
,('Helsa','MacPhail','$4808377.88',27,342,342,'c',1861,320,15,45,820,80,65)
,('Quinton','Christin','$1961820.71',6,343,343,'sg',1067,250,12,10,450,45,80)
,('Malachi','Gounin','$9686510.59',29,344,344,'sg',1401,0,12,45,250,10,25)
,('Rennie','Brumbye','$9123803.09',1,345,345,'c',1649,120,34,18,650,25,82)
,('Charlton','Kohnen','$11499253.58',2,346,346,'sg',1592,100,20,10,250,0,65)
,('Dougie','Stichall','$1997312.29',3,347,347,'pg',1688,150,55,10,550,82,0)
,('Amye','Bartzen','$10392908.99',13,348,348,'c',1932,340,25,15,650,33,65)
,('Janifer','Bravery','$7678457.64',26,349,349,'c',1988,340,80,20,550,25,65)
,('Carson','Dakers','$3209357.19',22,350,350,'pf',1864,200,70,55,450,80,65)
,('Darrick','Gatheral','$848091.36',17,351,351,'pg',1229,180,12,80,100,33,55)
,('Nick','Barensky','$5405410.31',4,352,352,'c',1297,330,15,33,820,70,10)
,('Orelia','Dowsey','$10665969.89',3,353,353,'sg',1397,330,80,55,800,25,25)
,('Tatiana','Pettendrich','$629997.07',28,354,354,'pf',1229,340,82,20,800,10,70)
,('Andrus','Toderini','$8531836.98',22,355,355,'pf',1235,150,18,10,250,70,45)
,('Beltran','Jull','$6524368.00',6,356,356,'pf',1921,330,25,80,800,25,80)
,('Gram','Le Grand','$8559166.09',18,357,357,'sg',1067,180,15,18,100,80,65)
,('Arnoldo','Gladman','$4972312.76',9,358,358,'pf',1823,250,15,82,700,65,45)
,('Ardella','Ferreli','$6749811.68',22,359,359,'pf',1229,250,34,82,650,55,70)
,('Merrie','Sargant','$8142597.33',11,360,360,'c',1221,100,25,32,820,10,45)
,('Winne','Curwood','$7447110.69',6,361,361,'pg',1401,330,12,15,700,25,55)
,('Valaree','Sansome','$741566.53',3,362,362,'c',1864,120,70,33,820,45,55)
,('Janot','Midford','$3289833.27',2,363,363,'pf',1932,180,45,34,800,10,45)
,('Findley','McEwen','$2986958.77',26,364,364,'pg',1235,0,20,0,330,25,70)
,('Muire','Littlechild','$4224692.47',2,365,365,'pg',1754,120,70,45,100,25,65)
,('Guenna','Bewly','$7790381.81',27,366,366,'sf',1864,330,65,0,100,33,65)
,('Myrwyn','Scorey','$7109858.35',15,367,367,'sg',1235,120,33,55,450,70,70)
,('Kore','Dillet','$4857948.53',6,368,368,'pg',1365,120,45,10,100,65,25)
,('Augustina','Pougher','$7557085.96',9,369,369,'pg',1291,320,34,20,450,65,55)
,('Carmelia','Phillins','$9022188.75',22,370,370,'c',1592,120,80,18,330,82,70)
,('Charlene','Domenget','$11994205.89',11,371,371,'pf',1229,150,0,18,650,25,0)
,('Khalil','Bulleyn','$8075790.92',14,372,372,'sg',1813,0,33,32,330,82,55)
,('Elaina','Purchon','$11468136.16',22,373,373,'pg',1067,320,15,70,250,70,82)
,('Rolland','Bourges','$4267114.20',1,374,374,'pf',1221,200,32,55,650,65,25)
,('Romain','Revie','$9686654.65',13,375,375,'c',1420,330,32,82,650,55,0)
,('Giorgi','Ottley','$3175992.11',8,376,376,'sg',1649,320,65,33,330,33,25)
,('Kylie','Freiburger','$966235.89',21,377,377,'sf',1229,330,50,25,330,82,65)
,('Waldo','McWhan','$578266.04',18,378,378,'pf',1932,320,45,25,100,0,10)
,('Judy','Tace','$5986663.54',20,379,379,'pg',1754,340,12,32,450,10,10)
,('Milka','Hurworth','$1599981.59',17,380,380,'sf',1420,320,25,50,330,65,80)
,('Janessa','Eleshenar','$5770433.73',16,381,381,'sg',1397,120,18,34,250,25,33)
,('Kip','Brandone','$9190935.77',15,382,382,'sf',1932,320,20,0,800,25,55)
,('Calida','Richen','$1694970.75',6,383,383,'pg',1592,100,12,12,450,70,10)
,('Audrie','Tipens','$1946936.70',3,384,384,'pf',1932,330,45,80,0,70,80)
,('Illa','Kamenar','$9899304.16',4,385,385,'sg',1426,250,33,0,700,0,55)
,('Janaya','Galway','$9282999.48',1,386,386,'sg',1089,200,10,15,250,65,65)
,('Shelba','Addinall','$1362148.10',3,387,387,'sg',1429,250,20,55,100,25,25)
,('Hilliard','Lillywhite','$8271063.85',2,388,388,'pg',1988,180,55,82,820,65,55)
,('Dedra','Maguire','$11653503.42',11,389,389,'sg',1067,250,33,45,550,0,80)
,('Eliza','Twohig','$11034746.51',2,390,390,'sf',1297,180,10,50,0,10,82)
,('Berget','Giacobazzi','$10021559.03',27,391,391,'pg',1592,0,20,18,100,0,0)
,('Dewain','Kroon','$4301543.41',17,392,392,'sg',1089,150,20,25,100,55,55)
,('Michaela','Das','$5575010.19',21,393,393,'pf',1864,120,65,65,330,33,70)
,('Blondy','Goodered','$4510442.81',22,394,394,'pg',1067,0,80,82,250,25,0)
,('Debbi','Dowding','$4835231.54',8,395,395,'pg',1462,0,82,82,330,0,10)
,('Vincent','Bagley','$4368796.17',5,396,396,'pf',1904,100,15,65,450,55,80)
,('Pier','Charlet','$7894981.01',28,397,397,'pf',1221,330,25,55,330,33,33)
,('Terrijo','Harniman','$3792649.37',15,398,398,'pf',1426,100,33,25,550,80,82)
,('Merla','Matveyev','$6544187.09',20,399,399,'pg',1904,200,0,34,250,70,0)
,('Harcourt','Frossell','$10875834.30',26,400,400,'pf',1932,330,12,70,700,55,80);
# select * from Player;

# Insert statements for message board
# INSERT INTO Message_Board (message, league_commissioner_id)
# VALUES
# ('league start date is around the corner', 1),
# ('the season has started!', 1);
INSERT INTO Message_Board(message_id,message,league_commissioner_id) VALUES
 (1,'ac neque duis bibendum morbi non quam nec dui',1)
,(2,'pretium iaculis',1)
,(3,'nulla tellus in sagittis dui vel nisl duis ac',1)
,(4,'curae donec pharetra magna vestibulum',1)
,(5,'nunc rhoncus dui vel sem sed sagittis nam congue risus',1)
,(6,'id turpis integer aliquet massa id lobortis convallis',1)
,(7,'lobortis ligula',1)
,(8,'suscipit a feugiat et eros vestibulum',1)
,(9,'ultrices phasellus id',1)
,(10,'phasellus sit amet erat',1)
,(11,'morbi vel lectus in quam fringilla rhoncus mauris enim',1)
,(12,'cubilia curae duis faucibus accumsan odio curabitur convallis duis consequat',1)
,(13,'neque duis bibendum morbi',1)
,(14,'vehicula consequat morbi a ipsum',1)
,(15,'sed interdum venenatis turpis',1);
# SELECT * from Message_Board;

# Insert statements for injury report
# INSERT INTO Injury_Report (injury, team_id, player)
# value
# ('Broken finger', 1, 'LeBron James'),
# ('Severe Headache', 2, 'Marcus Smart');
INSERT INTO Injury_Report(injury_id,injury,team_id,player) VALUES
 (1,'Decentralized',3,'Row Madner')
,(2,'Future-proofed',9,'Pearline Cowterd')
,(3,'explicit',29,'Rana Sazio')
,(4,'Persevering',29,'Kingsly Hadleigh')
,(5,'tangible',26,'Elvina Mussett')
,(6,'Optional',5,'Carroll Pahl')
,(7,'circuit',2,'Tiffani Nuttall')
,(8,'forecast',28,'Evvie Gilfillan')
,(9,'instruction set',11,'Fairlie Savatier')
,(10,'interface',15,'Joey Irving')
,(11,'Managed',15,'Osbert Enderby')
,(12,'project',9,'Cristina Newnham')
,(13,'zero defect',29,'Clovis Walder')
,(14,'methodology',2,'Marthe Dafforne')
,(15,'Fully-configurable',22,'Melody Brannan')
,(16,'non-volatile',15,'Trista Pieroni')
,(17,'Integrated',29,'Raimondo Le Brum')
,(18,'Devolved',1,'Duky Huntington')
,(19,'systematic',2,'Lyndel Jirka')
,(20,'open system',5,'Rubina Compston');
# select * from Injury_Report;

# Insert statements for Draft Players
# INSERT INTO Draft_Players (first_name, last_name, ranking, position, team_manager_id)
# VALUES
# ('John', 'Doe', 1, 'QB', 100),
# ('Jane', 'Doe', 2, 'RB', 101),
# ('Bob', 'Smith', 3, 'WR', 102),
# ('Sara', 'Johnson', 4, 'TE', 103),
# ('Tom', 'Davis', 5, 'K', 104);
INSERT INTO Draft_Players(first_name,last_name,ranking,position,team_manager_id) VALUES
 ('Sheri','Willimott',8,'sh',29)
,('Read','Gisburn',5,'c',17)
,('Selinda','Liddell',2,'pg',13)
,('Lynn','Jeckell',9,'c',7)
,('Harlan','Brainsby',10,'pg',19)
,('Tansy','Capelow',5,'sh',17)
,('Sarge','Laville',8,'sh',21)
,('Allie','Cavnor',8,'pf',16)
,('Zena','Juster',2,'pf',27)
,('Lambert','Camillo',7,'pf',10);
# select * from Draft_Players;