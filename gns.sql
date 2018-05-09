#------------------------------------------------------------
#        Script MySQL.
#------------------------------------------------------------

drop database if exists gns ;
create database gns default character set utf-8 default collate utf8_general_ci ;
use gns ;

#------------------------------------------------------------
# Table: Joueur
#------------------------------------------------------------

CREATE TABLE Joueur(
        numeroJoueur Int NOT NULL ,
        nomJoueur    Varchar (25) ,
        mdpJoueur    Varchar (25) ,
        PRIMARY KEY (numeroJoueur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Couleur
#------------------------------------------------------------

CREATE TABLE Couleur(
        numeroCouleur Int NOT NULL ,
        nomCouleur    Varchar (25) ,
        PRIMARY KEY (numeroCouleur )
)ENGINE=InnoDB;


#------------------------------------------------------------
# Table: Partie
#------------------------------------------------------------

CREATE TABLE Partie(
        numeroPartie    Int NOT NULL ,
        dateCreation    Date ,
        initiateur    Int ,
        adversaire  Int ,
        vainqueur  Int ,
        suivant  Int ,
        couleurInitiateur   Int ,
        couleurAdversaire Int ,
        PRIMARY KEY (numeroPartie )
)ENGINE=InnoDB;

ALTER TABLE Partie ADD CONSTRAINT FK_Partie_numeroJoueur FOREIGN KEY (initiateur) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_numeroJoueur_1 FOREIGN KEY (adversaire) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_numeroJoueur_2 FOREIGN KEY (vainqueur) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_numeroJoueur_3 FOREIGN KEY (suivant) REFERENCES Joueur(numeroJoueur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_numeroCouleur FOREIGN KEY (couleurInitiateur) REFERENCES Couleur(numeroCouleur);
ALTER TABLE Partie ADD CONSTRAINT FK_Partie_numeroCouleur_4 FOREIGN KEY (couleurAdversaire) REFERENCES Couleur(numeroCouleur);


INSERT INTO Joueur VALUES(1, "Nicolas", "azerty") ;
INSERT INTO Joueur VALUES(2, "Ilona", "azerty") ;
INSERT INTO Joueur VALUES(3, "Georges", "azerty") ;
INSERT INTO Joueur VALUES(4, "Aïcha", "azerty") ;
INSERT INTO Joueur VALUES(5, "Cody", "azerty") ;

INSERT INTO Couleur VALUES(1, "BLANC") ;
INSERT INTO Couleur VALUES(2, "NOIR") ;

INSERT INTO Partie Values(1, "01/05/2018", 5, 2, 2, NULL, 1, 2) ;
INSERT INTO Partie Values(2, "01/05/2018", 5, 2, 5, NULL, 2, 1) ;
INSERT INTO Partie Values(3, "01/05/2018", 5, NULL, NULL, 5, 1, NULL) ;
INSERT INTO Partie Values(4, "01/05/2018", 2, NULL, NULL, NULL, 2, NULL) ;
INSERT INTO Partie Values(5, "02/05/2018", 5, 1, NULL, 1, 1, 2) ;
INSERT INTO Partie Values(6, "02/05/2018", 5, 1, NULL, 5, 1, 2) ;
INSERT INTO Partie Values(7, "02/05/2018", 1, NULL, NULL, NULL, NULL, 2) ;
INSERT INTO Partie Values(8, "02/05/2018", 1, NULL, NULL, NULL, NULL, 2) ;
INSERT INTO Partie Values(9, "03/05/2018", 5, 2, NULL, 2, 1,2 ) ;
INSERT INTO Partie Values(10, "03/05/2018", 2, 1, 2, NULL, 2, 1) ;
