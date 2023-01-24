CREATE DATABASE IF NOT EXISTS Eval_bdd

CREATE TABLE Movies (
    id_movies INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    director VARCHAR(30),
    actors VARCHAR(30),
    movies_type VARCHAR(50) NOT NULL,
    movies_time INT NOT NULL,
    synopsis TEXT NOT NULL,
    poster VARCHAR(20) NOT NULL
)ENGINE=INNODB;

INSERT INTO Movies (id, title, director, actors, movies_type, movies_time, synopsis, poster) VALUES
(1, 'Avatar','James Cameron','Sam Worthington, Zoe Saldana,Sigourney Weaver', 'Science-fiction,Fantastique',192, 'Plus d''une décennie après les affrontements sur Pandora, Jake Sully assume désormais son rôle de chef des Omaticaya. Avec sa compagne, Neytiri, ils s''occupent de leur famille : Neteyam, leur fils aîné, Lo''ak, son frère, Kiri, leur fille adoptive (mystérieusement née de l''avatar inerte du Dr Grace Augustine), Spider, un garçon humain abandonné sur la planète, et Tuk, leur fille cadette. D''autres humains reviennent alors en force sur Pandora. Leur mission est de préparer la planète à devenir une nouvelle Terre et accueillir leur exode. Jake, Neytiri et les Omaticaya sont les premiers à s''opposer à eux. Cependant, les humains ont également dans leurs rangs une escouade de « recombinés » : des avatars Na''vi avec les souvenirs de soldats décédés. Leur chef n''est autre que le colonel Quaritch, qui avait pris soin de faire une sauvegarde de sa mémoire et de sa personnalité avant la bataille où il perdit la vie.', 'avatar.jpg'),
(2,'Black Adam','Jaume Collet-Serra','Dwayne Johnson, Sarah Shahi, Henry Cavill','Fantastique,Action',124, 'Près de 5 000 ans après avoir été doté des pouvoirs tout puissants des dieux égyptiens, Teth-Adam est libéré de sa tombe terrestre. Son ancien royaume, Kahndaq, est désormais contrôlé par des mercenaires d''Intergang, qui exploitent les ressources locales et imposent une dictature aux habitants. Teth-Adam fait la connaissance d''Adrianna Tomaz et de son jeune fils qui le considère comme un héros. Ce n''est pas l''avis de la Justice Society, menée par Carter Hall / Hawkman, qui voit en lui une menace.','black_adam.jpg')
(3,'Astérix et Obelix : L''empire du milieu','Guillaume Canet','Gilles Lellouche, Marion Cotillard, Guillaume Canet','Comédie',114,'Nous sommes en 50 avant J.C. L''Impératrice de Chine est emprisonnée suite à un coup d''état fomenté par Deng Tsin Quin, un prince félon. Aidée par Graindemaïs, le marchand phénicien, et par sa fidèle guerrière Tat Han, la princesse Fu-Yi, fille unique de l''impératrice, s''enfuit en Gaule pour demander de l''aide aux deux valeureux guerriers Astérix et Obélix, dotés d''une force surhumaine grâce à leur potion magique.','asterix.jpg')
(4, 'Black Panther:Wakanda Forever','Ryan Coogler','Richard Schiff, Danai Gurira, Letitia Wright, Lupita Nyong','Action',161,'La Reine Ramonda, Shuri, M''Baku, Okoye et les Dora Milaje luttent pour protéger leur nation des ingérences d''autres puissances mondiales après la mort du roi T''Challa. Alors que le peuple s''efforce d''aller de l''avant, nos héros vont devoir s''unir et compter sur l''aide de la mercenaire Nakia et d''Everett Ross pour faire entrer le royaume du Wakanda dans une nouvelle ère. Mais une terrible menace surgit d''un royaume caché au plus profond des océans : Talokan.','black_panther.jpg')

CREATE TABLE Theaters (
    id_theaters INT PRIMARY KEY AUTO_INCREMENT,
    theaters_name VARCHAR(50) NOT NULL,
    theaters_address VARCHAR(100) NOT NULL,
    id_admin INT
FOREIGN KEY (id_admin) REFERENCES Admin(id_admin)
ON DELETE RESTRICT
ON UPDATE RESTRICT
)ENGINE=INNODB;

INSERT INTO Theaters (id, theaters_name, theaters_address) VALUES
(1,'Kinepolis','1 rue du Château d''Isenghien 59461 Lomme')
(2,'UGC Ciné Cité','21 Av. de l''Avenir, 59650 Villeneuve-d''Ascq')
(3, 'Le Millénium', 'Place des Mantilles, 59540 Caudry')
(4, 'Gaumon Valenciennes', '59 Rue des Alpes, 59300 Valenciennes')


CREATE TABLE Theaters_rooms (
    theaters_name VARCHAR(60) NOT NULL,
    rooms_numero INT NOT NULL,
    capacity INT NOT NULL
)ENGINE=INNODB

INSERT INTO Theaters_rooms (id,theaters_name, rooms_numero, capacity) VALUES
('Kinepolis', 1, 200)
('Kinepolis', 2, 100)
('Kinepolis', 3, 450)
('Kinepolis', 4, 500)
('Kinepolis', 5, 450)
('Kinepolis', 6, 300)
('UGC Ciné Cité', 1, 200)
('UGC Ciné Cité', 2, 300)
('UGC Ciné Cité', 3, 400)
('UGC Ciné Cité', 4, 300)
('Le Millénium', 1, 300)
('Le Millénium', 2, 150)
('Le Millénium', 3, 200)
('Gaumont Valenciennes', 1, 200)
('Gaumont Valenciennes', 2, 400)
('Gaumont Valenciennes', 3, 500)
('Gaumont Valenciennes', 4, 350)


CREATE TABLE Hours (
    id_hours INT PRIMARY KEY AUTO_INCREMENT,
    id_movies INT NOT NULL,
    id_theaters INT NOT NULL,
    movies_dates DATE NOT NULL,
    movies_hours TIME NOT NULL,
FOREIGN KEY (id_movies) REFERENCES Movies(id_movies)
ON DELETE RESTRICT
ON UPDATE RESTRICT
FOREIGN KEY (id_theaters) REFERENCES Theaters(id_theaters)
ON DELETE RESTRICT
ON UPDATE RESTRICT
)ENGINE=INNODB;

INSERT INTO Hours (id, id_movies, id_theaters, movies_date, movies_hour) VALUES
(1,1,1,'2023-01-20','14:50')
(2,1,2,'2023-01-20','14:50')
(3,2,1,'2023-01-20','15:50')
(4,3,3,'2023-01-20','16:50')
(5,3,1,'2023-01-20','15:50')
(6,4,4,'2023-01-20','11:00')
(7,4,2,'2023-01-20','14:00')


CREATE TABLE Reservation (
    id_reservation INT PRIMARY KEY AUTO_INCREMENT,
    id_clients INT,
    id_theaters INT,
    id_movies INT,
    id_hours INT,
    nb_seats INT,
    date_reservation DATE,
    type_payment VARCHAR (30),
    date_payment DATE
FOREIGN KEY (id_clients) REFERENCES Clients(id_clients)
ON DELETE RESTRICT
ON UPDATE RESTRICT
FOREIGN KEY (id_theaters) REFERENCES Theaters(id_theaters)
ON DELETE RESTRICT
ON UPDATE RESTRICT
FOREIGN KEY (id_movies) REFERENCES Movies(id_movies)
ON DELETE RESTRICT
ON UPDATE RESTRICT
FOREIGN KEY (id_hours) REFERENCES Hours(id_hours)
ON DELETE RESTRICT
ON UPDATE RESTRICT
)ENGINE=INNODB;

INSERT INTO Reservation (id, id_clients, id_theaters, id_movies, id_hours, nb_seats, date_reservation, type_payment, date_payment) VALUES
(1,1,1,1,1,01,'2023-01-23','Carte Bancaire, Sur place, Code', '2023-01-01')
(2,1,1,1,1,02,'2023-01-18','Carte Bancaire, Sur place, Code', '2023-01-01')
(3,1,1,1,1,03,'2023-01-22','Carte Bancaire, Sur place, Code', '2023-01-01')
(4,2,2,2,2,01,'2023-01-28','Carte Bancaire, Sur place, Code', '2023-01-01')
(5,2,2,2,2,02,'2023-01-01','Carte Bancaire, Sur place, Code', '2023-01-01')
(6,2,2,2,2,03,'2023-01-22','Carte Bancaire, Sur place, Code', '2023-01-01')
(7,2,2,2,2,04,'2023-01-20','Carte Bancaire, Sur place, Code', '2023-01-01')
(8,2,2,2,2,05,'2023-01-20','Carte Bancaire, Sur place, Code', '2023-01-01')

CREATE TABLE Clients (
    id_clients INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    phone_number INT NULL,
    mail VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
)ENGINE=INNODB;

INSERT INTO Clients (id, first_name, last_name, phone_number, mail, password) VALUES
(1, 'Ardis', 'Cutting', '+62 902 770 3596', 'acutting0@deviantart.com', '$2y$10$gvQBU3LXlEff/HRBDp4v6.ZvjKY5cyil2tBksoa3qdAPNdSi7dxA.');
(2, 'Sheeree', 'Woodroof', '+970 760 452 2330', 'swoodroof1@stanford.edu', '$2y$10$/1VWRg5/xg/ctPs/PWNfzOy5FmQVgWhNXAA4mm7R72eZFbtRyLesa');
(3, 'Rodi', 'Essberger', '+62 309 534 7419', 'ressberger2@msn.com', '$2y$10$/M.rrxNrNSTbdOkHvqtyh.7/gxV70lKWR/8XahfDlXlQNqnxLgdru');
(4, 'Shena', 'Kemer', '+81 656 565 5347', 'skemer3@canalblog.com', '$2y$10$RFCJkgrjZq.KU1dGpIfoPOutWd8uk6nsz9k7zIM9iEAwmy6Cq2ONi');
(5, 'Pascale', 'Gon', '+51 955 657 1314', 'pgon4@smh.com.au', '$2y$10$InCV6MYihYu.F3OK5u1k1ek4HcrTkZWLzJ5BRJNF81.m5PWZLne7i');
(6, 'Gene', 'Demke', '+98 336 540 9454', 'gdemke5@who.int', '$2y$10$F9SkHsyvbLNz7AHhUy30U.fS9d6p7qKljXcePTsaDhKJSyz0AUmKm');
(7, 'Sandra', 'Stallwood', '+62 961 613 9782', 'sstallwood6@indiegogo.com', '$2y$10$LRK9dpvcmj/ZeYsaquQQ2.k83kIAc1pJZNzYibUOrEft9a54AM2o6');
(8, 'Jorge', 'Mattin', '+420 974 645 8080', 'jmattin7@vinaora.com', '$2y$10$CaQx6YSR9ECmJCOpXt1ofu4Ju8HzjqDPde3W49TKMxrle7mLYXqPy');
(9, 'Coral', 'Bavister', '+63 896 714 0403', 'cbavister8@reddit.com', '$2y$10$X9.1szJkwJAwl7a0kv2zx.EFjPyB0s37oTw98qo9wEyKunZT51rxa');
(10, 'Georgy', 'Uccello', '+420 118 180 6196', 'guccello9@vinaora.com', '$2y$10$lGl10EqfLE/cAUnmx6iXBuFzhNiJa.3IUg53CcsNeHPfd0bG0F1EO');

CREATE TABLE Prices (
  id_prices INT PRIMARY KEY AUTO_INCREMENT,
  id_theaters INT,
  id_movies INT,
  clients_category VARCHAR(255) NOT NULL,
  movies_prices FLOAT NOT NULL
FOREIGN KEY (id_theaters) REFERENCES Theaters(id_theaters)
ON DELETE RESTRICT
ON UPDATE RESTRICT
FOREIGN KEY (id_movies) REFERENCES Movies(id_movies)
ON DELETE RESTRICT
ON UPDATE RESTRICT
)ENGINE=INNODB

INSERT INTO Prices (id, id_theaters, id_movies, clients_category, movies_prices) VALUES
(1,1,1, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(2,1,2, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(3,1,3, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(4,1,4, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(5,1,4, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(6,2,1, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(7,2,2, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(8,2,3, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(9,2,4, 'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')
(10,3,1,'Plein tarif, Etudiant, Moins de 14 ans' '9.20€, 7.60€, 5.90€')

CREATE TABLE User (
id_user INT PRIMARY KEY AUTO_INCREMENT,
first_name VARCHAR(30) NOT NULL,
last_name VARCHAR (30) NOT NULL,
mail VARCHAR (255),
password VARCHAR(60) NOT NULL
)ENGINE=INNODB


INSERT INTO User (id_user, first_name, last_name, mail, pseudo, password ) VALUES
(1, 'Juditha', 'McEniry', 'jmceniry0@surveymonkey.com', '$2y$10$MfWjam5RMH3mTB967PIM.eWeRWP4QTEVrK1tn2mGZQ7RDnI.j1oP.');
(2, 'Shay', 'Haycox', 'shaycox1@diigo.com', '$2y$10$0oJwf6H69SFRNaA8c2YlWOKXOKvrsH5oNs6LMd4SsydVTZEEHfp62');
(3, 'Siegfried', 'Battison', 'sbattison2@scribd.com', '$2y$10$lO9lAHt80i8L8StBeaGvnuzhHIwbzHIMa8MP4tnH3AFlWdudm15LC');
(4, 'Sandie', 'Zukierman', 'szukierman3@dyndns.org', '$2y$10$S2FLdfj2Tu2z3XDT9VzC8.QZ5tVGhoR8EA7/EA9OQsopefsClSNQ.');
(5, 'Kerry', 'Johnes', 'kjohnes4@nih.gov', '$2y$10$97HkdMgfKRKFS3BHsZ.AF.toISLTBfiiMb0N.jrxJslv3pUZ0dh3O');

CREATE TABLE Admin (
    id_admin INT PRIMARY KEY AUTO_INCREMENT,
    id_user INT
FOREIGN KEY (id_user) REFERENCES User(id_user)
ON DELETE RESTRICT
ON UPDATE RESTRICT
)