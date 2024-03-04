USE Universitate;
SELECT *
FROM Student;
SELECT *
FROM Examen;
SELECT *
FROM Curs;

--CREATE PROCEDURE
CREATE PROCEDURE GetCursCredit(@credit int) AS
SELECT *
FROM Curs
WHERE credite = @credit
GO

EXEC GetCursCredit 6

EXEC GetCursCredit 4

--ALTER PROCEDURE
ALTER PROCEDURE GetCursCredit(@creditNr int, @Number int output) AS
SELECT @Number = count(*)
FROM Curs
WHERE credite = @creditNr
GO

DECLARE @Nr int
SET @NR = 0
EXEC GetCursCredit 6, @Number = @Nr output
print @Nr

-- RAISE ERROR
ALTER PROCEDURE GetCursCredit(@creditNr int, @Number int output) AS
BEGIN
    SELECT @Number = count(*)
    FROM Curs
    WHERE credite = @creditNr
    IF @Number = 0
        RAISERROR ('Cursul nu exista', 16, 1)
END

DECLARE @Nr int
    SET @Nr = 0
    EXEC GetCursCredit 5, @Number=@Nr output
    print @Nr

--DROP PROCEDURE
    DROP PROCEDURE GetCursCredit

    -- CREATE FUNCTION
    CREATE FUNCTION getCursCreditFunc(@creditNr INT) RETURNS INT AS
    BEGIN
        DECLARE @Nr INT
        SET @Nr = 0
        SELECT @Nr = count(*) FROM Curs WHERE credite = @creditNr

        RETURN @Nr
    END
    print dbo.getCursCreditFunc(6)
    CREATE FUNCTION verifyStudentName(@name VARCHAR(50)) RETURNS BIT AS
    BEGIN
        IF patindex('%[0-9]%', @name) = 0
            RETURN 1
        RETURN 0
    END
    print dbo.verifyStudentName('shek')
    CREATE FUNCTION getCursCreditTableFunc(@creditNr INT)
        RETURNS TABLE AS
            RETURN
            SELECT titlu
            FROM Curs
            WHERE credite = @creditNr
SELECT *
FROM getCursCreditTableFunc(6)
    print @@ROWCOUNT

    -------------CURSOR--------------------
    --simplu
    Use SportsStore;
DECLARE @ProductId INT, @ProductName VARCHAR(250), @ProductPrice MONEY
DECLARE
    cursorProducts CURSOR FOR SELECT P.id_product, P.product_name, P.price
                              FROM Product P FOR READ ONLY
    OPEN cursorProducts
    FETCH cursorProducts INTO @ProductId, @ProductName, @ProductPrice
    WHILE @@FETCH_STATUS = 0
        BEGIN
            PRINT @ProductName + ' ' + CAST(@ProductPrice AS VARCHAR(10))
            FETCH cursorProducts INTO @ProductId, @ProductName, @ProductPrice
        end
    close cursorProducts
    deallocate cursorProducts

    --scroll
DECLARE @ProductId INT, @ProductName VARCHAR(250), @ProductPrice MONEY
DECLARE
    cursorProducts CURSOR SCROLL FOR SELECT P.id_product, P.product_name, P.price
                                     FROM Product P FOR READ ONLY
    OPEN cursorProducts

    FETCH LAST FROM cursorProducts;
    FETCH FIRST FROM cursorProducts;
    FETCH ABSOLUTE 3 FROM cursorProducts;
    FETCH RELATIVE 3 FROM cursorProducts;
    FETCH RELATIVE -1 FROM cursorProducts;

    CLOSE cursorProducts;
    DEALLOCATE cursorProducts;

