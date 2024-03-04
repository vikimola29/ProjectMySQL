USE Magazin;

---1.
--Afișați produsele care fac parte atât din categoria ‘Reduceri’ (nume categorie), cât și din categoria ‘Electronice’
--a.
SELECT P.nume
FROM Produs P,
     CategorieProdus CP,
     Categorie C
WHERE P.id_produs = CP.id_produs
  AND C.id_categorie = CP.id_categorie
  AND C.nume = 'Reduceri'
  AND P.nume IN (SELECT P2.nume
                 FROM Produs P2,
                      CategorieProdus CP2,
                      Categorie C2
                 WHERE P2.id_produs = CP2.id_produs
                   AND CP2.id_categorie = C2.id_categorie
                   AND C2.nume = 'Electronice');

--b.
SELECT P.nume
FROM Produs P,
     CategorieProdus CP,
     Categorie C
WHERE P.id_produs = CP.id_produs
  AND C.id_categorie = CP.id_categorie
  AND C.nume = 'Reduceri'
INTERSECT
SELECT P.nume
FROM Produs P,
     CategorieProdus CP,
     Categorie C
WHERE P.id_produs = CP.id_produs
  AND CP.id_categorie = C.id_categorie
  AND C.nume = 'Electronice';

--c.
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
         INNER JOIN Categorie C ON CP.id_categorie = C.id_categorie
WHERE C.nume = 'Reduceri'
INTERSECT
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP on P.id_produs = CP.id_produs
         INNER JOIN Categorie C ON C.id_categorie = CP.id_categorie
WHERE C.nume = 'Electronice';

--d.
SELECT P.nume
FROM Produs P
         INNER JOIN CategorieProdus CP ON P.id_produs = CP.id_produs
         INNER JOIN Categorie C ON C.id_categorie = CP.id_categorie
WHERE C.nume = 'Electronice'
  AND P.nume IN (SELECT P2.nume
                 FROM Produs P2
                          INNER JOIN CategorieProdus CP2 ON P2.id_produs = CP2.id_produs
                          INNER JOIN Categorie C2 ON CP2.id_categorie = C2.id_categorie
                 WHERE C2.nume = 'Reduceri');

---2.
---Afișați numărul de produse din fiecare categorie
SELECT *
FROM Produs;
SELECT *
FROM Categorie;
SELECT *
FROM CategorieProdus;

SELECT C.nume, COUNT(CP.id_produs)
FROM Categorie C
         INNER JOIN CategorieProdus CP ON C.id_categorie = CP.id_categorie
GROUP BY CP.id_categorie, C.nume
ORDER BY C.nume;

---3.
-- Afișați distribuitorii de la care nu s-a comandat nici un produs. – 2 metode
SELECT *
FROM Distribuitor;
SELECT *
FROM Produs;
SELECT *
FROM ProdusDistribuitor;

--a.
SELECT D.nume
FROM ProdusDistribuitor PD
         RIGHT JOIN Distribuitor D ON PD.id_distribuitor = D.id_distribuitor
WHERE PD.id_distribuitor IS NULL;

--b.
SELECT DISTINCT D.nume
FROM Distribuitor D
WHERE D.id_distribuitor NOT IN (SELECT D2.id_distribuitor
                                FROM Distribuitor D2,
                                     ProdusDistribuitor PD2
                                WHERE PD2.id_distribuitor = D2.id_distribuitor)




--Afișați cliențul care au cumpărat de cele mai multe ori din magazin (o cumpărătură corespunde unei facturi)
SELECT *
FROM Produs;
SELECT *
FROM CLient;
SELECT *
FROM Factura;
SELECT *
FROM FacturaProdus;

--a.
SELECT TOP (1) C.nume, COUNT(F.id_client) AS nr_facturi
FROM Client C,
     Factura F
WHERE F.id_client = C.id_client
GROUP BY F.id_client, C.nume
ORDER BY COUNT(F.id_client) DESC, C.nume;

--b.
SELECT TOP (1) C.nume, COUNT(F.id_client) AS nr_facturi
FROM Client C
         INNER JOIN Factura F on C.id_client = F.id_client
GROUP BY F.id_client, C.nume
ORDER BY COUNT(F.id_client) DESC, C.nume;

--c.
SELECT C.nume, COUNT(F.id_client) AS nr_facturi
FROM Client C
         INNER JOIN Factura F on C.id_client = F.id_client
GROUP BY C.id_client, C.nume
HAVING COUNT(*) >= ALL (SELECT COUNT(*) FROM Factura F2 GROUP BY F2.id_client);

----------------------------------------------------------------------------------------------
--FOR EXAM
USE Magazin;
--1.Afișați numărul de produse distincte cumpărate de fiecare client.
SELECT C.nume, COUNT(DISTINCT FP.id_produs) AS nr_produse_client
FROM Client C
         INNER JOIN Factura F on C.id_client = F.id_client
         INNER JOIN FacturaProdus FP on F.id_factura = FP.id_factura
GROUP BY C.id_client, C.nume

--2.
-- • Afișați numărul de produse (bucăți) cumpărate în total de fiecare client.
SELECT C.nume, SUM(FP.cantitate) as nr_produse
FROM Client C
         INNER JOIN Factura F on C.id_client = F.id_client
         INNER JOIN FacturaProdus FP on F.id_factura = FP.id_factura
GROUP BY C.nume

--3. • Afișați numărul de produse (bucăți) cumpărate în total de fiecare client pentru fiecare factura in parte:
SELECT C.nume, SUM(FP.cantitate) as nr_produse
FROM Client C
         INNER JOIN Factura F on C.id_client = F.id_client
         INNER JOIN FacturaProdus FP on F.id_factura = FP.id_factura
GROUP BY FP.id_factura, C.nume

--4. Afișați clienții care au cumpărat de cele mai multe ori din magazin (o cumpărătură corespunde unei facturi)

SELECT C.nume, COUNT(F.id_factura) as nr_produse
FROM Client C
         INNER JOIN Factura F on C.id_client = F.id_client
GROUP BY C.nume
HAVING COUNT(F.id_factura) >= ALL (SELECT count(*) FROM Factura F2  GROUP BY F2.id_client)
