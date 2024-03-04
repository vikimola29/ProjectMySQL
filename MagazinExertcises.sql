USE Magazin;
INSERT INTO Categorie
VALUES ('Reduceri');
INSERT INTO Categorie
VALUES ('Electronice');
INSERT INTO Categorie
VALUES ('Sport');
INSERT INTO Categorie
VALUES ('Telefoane');

INSERT INTO Produs
VALUES ('Idk1', 337);
INSERT INTO Produs
VALUES ('Idk2', 327);
INSERT INTO Produs
VALUES ('Idk3', 12);
INSERT INTO Produs
VALUES ('Idk4', 1244);

INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk1'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Reduceri'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk1'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Electronice'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk1'), (SELECT id_categorie FROM Categorie WHERE nume = 'Sport'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk2'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Reduceri'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk3'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Reduceri'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk3'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Electronice'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk4'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Electronice'));
INSERT INTO CategorieProdus(id_produs, id_categorie)
VALUES ((SELECT id_produs FROM Produs WHERE nume = 'Idk4'),
        (SELECT id_categorie FROM Categorie WHERE nume = 'Telefoane'));


DELETE
FROM Produs;
DELETE
FROM Categorie;
DELETE
FROM CategorieProdus;

SELECT *
FROM Produs;
SELECT *
FROM Categorie;
SELECT *
FROM CategorieProdus;
---1.
---a.
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
         INNER JOIN
     Categorie C ON C.id_categorie = CP.id_categorie
WHERE C.nume = 'Electronice'
INTERSECT
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
         INNER JOIN
     Categorie C ON CP.id_categorie = C.id_categorie
WHERE C.nume = 'Reduceri';

---b.
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
         INNER JOIN
     Categorie C ON C.id_categorie = CP.id_categorie
WHERE C.nume = 'Electronice'
  AND P.nume IN (SELECT P.nume
                 FROM Produs P
                          INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
                          INNER JOIN
                      Categorie C ON CP.id_categorie = C.id_categorie
                 WHERE C.nume = 'Reduceri');

---c.
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
         INNER JOIN
     Categorie C ON CP.id_categorie = C.id_categorie
WHERE C.nume = 'Electronice'
  AND P.id_produs IN (SELECT P.id_produs
                      FROM Produs P
                               INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
                               INNER JOIN
                           Categorie C ON C.nume = 'Reduceri');
---d.
SELECT CP.id_produs
FROM CategorieProdus CP
         INNER JOIN Categorie C ON CP.id_categorie = C.id_categorie
WHERE C.nume = 'Electronice'
  AND CP.id_produs IN (SELECT CP.id_produs
                       FROM CategorieProdus CP
                                INNER JOIN
                            Categorie C ON CP.id_categorie = C.id_categorie
                       WHERE C.nume = 'Reduceri');

---idk
SELECT P.nume, P.pret * 2 AS pret_mjorat
From Produs P
WHERE P.nume LIKE '___3';
SELECT *
From Produs P
WHERE P.nume LIKE '%3';

---2.
SELECT C.nume, count(*) AS nr_produse
FROM Categorie C
         INNER JOIN CategorieProdus CP ON CP.id_categorie = C.id_categorie
GROUP BY C.id_categorie, C.nume;


INSERT INTO Distribuitor
Values ('Dist1');
INSERT INTO Distribuitor
Values ('Dist2');
INSERT INTO Distribuitor
Values ('Dist3');

INSERT INTO ProdusDistribuitor (id_produs, id_distribuitor, pret)
Values (19, 1, 3244);
INSERT INTO ProdusDistribuitor (id_produs, id_distribuitor, pret)
Values (20, 2, 1438);
INSERT INTO ProdusDistribuitor (id_produs, id_distribuitor, pret)
Values (21, 1, 394);
INSERT INTO ProdusDistribuitor (id_produs, id_distribuitor, pret)
Values (22, 1, 954);


SELECT *
FROM Distribuitor;
SELECT *
FROM Produs;
SELECT *
FROM ProdusDistribuitor;

---3.
---a.
SELECT D.nume
FROM Distribuitor D
         LEFT JOIN ProdusDistribuitor PD ON PD.id_distribuitor = D.id_distribuitor
WHERE PD.id_produs IS NULL;
---b.
SELECT D.nume
FROM Distribuitor D
Where D.id_distribuitor NOT IN (SELECT PD.id_distribuitor
                                FROM ProdusDistribuitor PD);


INSERT INTO CLient
Values (3626, 'Client1');
INSERT INTO CLient
Values (67576, 'Client2');
INSERT INTO CLient
Values (3647, 'Client3');

INSERT INTO Factura
Values ('1999-05-29', 326, 4);
INSERT INTO Factura
Values ('1999-05-29', 35456, 4);
INSERT INTO Factura
Values ('1999-05-29', 3646, 4);
INSERT INTO Factura
Values ('1999-05-29', 326, 5);
INSERT INTO Factura
Values ('1999-05-29', 326, 5);
INSERT INTO Factura
Values ('1999-05-29', 326, 6);
INSERT INTO Factura
Values ('1999-05-29', 32456, 6);
INSERT INTO Factura
Values ('1999-05-29', 3246, 5);
INSERT INTO Factura
Values ('1999-05-29', 4646, 5);

INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (1, 19, 23);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (2, 20, 213);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (3, 20, 13);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (4, 19, 224);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (5, 21, 423);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (6, 21, 243);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (7, 22, 243);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (8, 22, 213);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (9, 22, 230);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (10, 19, 230);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (11, 22, 260);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (12, 19, 230);
INSERT INTO FacturaProdus(id_factura, id_produs, cantitate)
VALUES (13, 19, 240);


SELECT *
FROM CLient;
SELECT *
FROM Factura;
---5.
---a.

SELECT *
FROM Produs P
         INNER JOIN CategorieProdus CP on P.id_produs = CP.id_produs;


------------------------------------------------------------------
SELECT AVG(DISTINCT F.valoare)
FROM Factura F;

SELECT *
FROM Factura F;

SELECT *
FROM Factura F
WHERE F.valoare = ANY (SELECT MAX(F2.valoare) FROM Factura F2);
SELECT COUNT(DISTINCT F.id_client)
FROM Factura F
WHERE F.valoare = ANY (SELECT MIN(F2.valoare) FROM Factura F2);
SELECT *
FROM Factura F
WHERE F.valoare = ALL (SELECT MIN(F2.valoare) FROM Factura F2);










