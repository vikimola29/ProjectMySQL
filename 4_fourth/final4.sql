USE SportsStore

CREATE TABLE TableA
(
    coda INT PRIMARY KEY,
    a2   INT UNIQUE,
    a3   INT,
);

CREATE TABLE TableC
(
    codc INT PRIMARY KEY,
    coda INT,
    FOREIGN KEY (coda) REFERENCES TableA (coda)
);

--populate tables
CREATE PROCEDURE PopulateTABLES
AS
BEGIN
    DECLARE @i INT = 1;
    WHILE (@i <= 5000)
        BEGIN
            INSERT INTO TableA (coda, a2, a3)
            VALUES (@i, @i, @i + 1);
            SET @i = @i + 1;
        END;
    DECLARE @j INT = 1;
    DECLARE @k INT = 1;
    WHILE (@j <= 30000)
        BEGIN
            INSERT INTO TableC (codc, coda)
            VALUES (@j, @k);
            SET @j = @j + 1;
            IF @k = 500
                SET @k = 1;
            ELSE
                SET @k = @k + 1;

        END;
end;
    exec PopulateTABLES

SELECT COUNT(*)
FROM TableA
SELECT COUNT(*)
FROM TableC

SELECT *
FROM TableA
SELECT *
FROM TableC

    --a.Verificati indecsii existenti pe tabelul Ta. Scrieti doua interogari SELECT pe tabelul Ta ale caror
-- planuri de executie sa contina operatorii clustered index seek si nonclustered index seek.

SELECT name
FROM sys.indexes
WHERE object_id = OBJECT_ID('TableA');
    SELECT name
FROM sys.indexes
WHERE object_id = OBJECT_ID('TableC');
-- ALTER TABLE TableA
-- DROP CONSTRAINT UQ__TableA__3213A9FAAAAE4B92;

    create clustered index TableA_ClusteredIndex on TableA (coda);
SELECT *
FROM TableA WITH (INDEX = TableA_ClusteredIndex)
WHERE coda = 1;

    create nonclustered index TableA_NonclusteredIndex on TableA (a2);
SELECT *
FROM TableA WITH (INDEX = TableA_NonclusteredIndex)
WHERE a2 = 1;

--b. . Scrieti o interogare SELECT pe tabelul Ta cu o clauza de forma WHERE a3 = valoare si
-- analizati planul de executie. Creati un index nonclustered pe coloana a3 util pentru interogare.
-- Evidentiati schimbarile din planul de executie: operatori, estimated subtree cost pe SELECT.
CREATE INDEX TableA_NonclusteredIndex2 ON TableA (a3);

    SELECT *
FROM TableA
WHERE a3 = 3;

--c. c. Scrieti o interogare SELECT cu INNER JOIN intre Tc si Ta (cheie externa = cheie primara) si
-- o filtrare de forma coloana utilizata in JOIN = valoare. Analizati planul de executie. Creati un
-- index nonclustered pe coloana care este cheie externa in Tc si analizati din nou planul de executie

CREATE INDEX TableC_NonclusteredIndex ON TableC(coda);
    SELECT *
FROM TableC
INNER JOIN TableA ON TableC.coda = TableA.coda
WHERE TableA.a2 = 3;