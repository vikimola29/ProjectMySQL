Use SportsStore;
--4. CURSOR
--WITH PROCEDURE
create PROCEDURE getProductAndColor(@ProductName VARCHAR(255), @ProductColor VARCHAR(255)) AS
SELECT *
FROM Product P
WHERE P.product_name = @ProductName
    print @ProductName + ', color: ' + @ProductColor


DECLARE @ProductName VARCHAR(255)
DECLARE @ProductColor VARCHAR(255)

DECLARE
    cursorProduct CURSOR FOR SELECT P.product_name, P.product_color
                             FROM Product P FOR READ ONLY

    OPEN cursorProduct
    FETCH NEXT FROM cursorProduct INTO @ProductName, @ProductColor
    WHILE @@FETCH_STATUS = 0
        BEGIN
            EXEC getProductAndColor @ProductName, @ProductColor
            FETCH NEXT FROM cursorProduct INTO @ProductName, @ProductColor
        end

    CLOSE cursorProduct
    DEALLOCATE cursorProduct

--WITHOUT PROCEDURE

SELECT *
FROM Product P
DECLARE @paceCounter INT=1;
DECLARE @counter INT;
SELECT @counter = COUNT(*)
FROM Product P ;


    WHILE @paceCounter < @counter
        BEGIN
            DECLARE @ProductName VARCHAR(255), @ProductColor VARCHAR(255)
            SELECT @ProductName = P.product_name, @ProductColor = P.product_color
            FROM Product P
            where id_product = @paceCounter + 20
            print @ProductName + ', color: ' + @ProductColor
            SET @paceCounter +=1


        end

    --1.

    CREATE FUNCTION validPrice(@Price int)
        RETURNS int AS
    BEGIN
        IF @Price <= 0
            RAISERROR (N'Prețul trebuie să fie mai mare de zero.', 16, 1)
        ELSE
            RETURN 1
    END
    CREATE FUNCTION validName(@Name VARCHAR(100))
        RETURNS int AS
    BEGIN
        IF @Name is NULL
            RAISERROR (N'Da un nume.', 16, 1)
        ELSE
            RETURN 1
    END
    CREATE PROCEDURE insertProduct @ProductPrice MONEY,
                                   @ProductName VARCHAR(255),
                                   @ProductDescription VARCHAR(500),
                                   @ProductColor VARCHAR(50),
                                   @CategoryID INT,
                                   @NrOnStock INT,
                                   @CategoryName VARCHAR(255)
    AS
    BEGIN
        -- Verifică dacă prețul este mai mare de zero
        validPrice @ProductPrice;
        validName @ProductName;

        IF @CategoryID <= 0
            BEGIN
                RAISERROR (N'IDul trebuie sa fie existent', 16, 1)
                RETURN
            END
        IF @NrOnStock <= 0
            BEGIN
                RAISERROR (N'Stocul trebuie să fie mai mare de zero.', 16, 1)
                RETURN
            END
        IF @CategoryName is NULL
            BEGIN
                RAISERROR (N'Da un nume', 16, 1)
                RETURN
            END

        -- Inserează produsul în tabela Product
        INSERT INTO Product (price, product_name, product_description, product_color, id_category, number_on_stock)
        VALUES (@ProductPrice, @ProductName, @ProductDescription, @ProductColor, @CategoryID, @NrOnStock)
        INSERT INTO Category (category_name) VALUES (@CategoryName)

    END
        EXEC insertProduct N'13.46', 'Jacheta vare', 'foarte bun', 'negru', 3, 54, 'summer'
        EXEC insertProduct N'13.46', 'Jacheta vare', 'foarte bun', 'negru', 3, -9, 'summer'
        EXEC insertProduct N'13.46', null, 'foarte bun', 'negru', 3, 9, 'summer'
        EXEC insertProduct N'-8.56', 'pantaloni scurti', 'foarte bun', 'negru', 3, 9, 'summer'
        EXEC insertProduct N'8.56', 'pantaloni scurti', 'foarte bun x2', 'negru', 5, 9, 'summer'


        --2. VIEW
        CREATE VIEW SportsStoreView AS
        SELECT P.id_product, P.product_name, P.price, P.product_color, C.category_name
        FROM Product P
                 INNER JOIN Category C ON P.id_category = C.id_category ;


    SELECT product_name, price, category_name
    FROM SportsStoreView
    where category_name = 'Winter';

    SELECT product_name, product_color, category_name
    FROM SportsStoreView
    GROUP BY product_color
           , product_name, category_name


        --3. TRIGGER
        CREATE TABLE Customer_Log
        (
            log_id                      INT PRIMARY KEY IDENTITY,
            data_ora                    DATETIME,
            tip_operație                CHAR(1),
            nume_tabel                  VARCHAR(100),
            numar_inregistrari_afectate INT
        );

        CREATE TRIGGER AfterInsert
            ON [dbo].[Customer]
            AFTER INSERT
            AS
        BEGIN
            INSERT INTO Customer_Log (data_ora, tip_operație, nume_tabel, numar_inregistrari_afectate)
            VALUES (GETDATE(), 'I', 'Customer', 1);
        END
            CREATE TRIGGER AfterUpdate
                ON [dbo].[Customer]
                AFTER UPDATE
                AS
            BEGIN
                INSERT INTO Customer_Log (data_ora, tip_operație, nume_tabel, numar_inregistrari_afectate)
                VALUES (GETDATE(), 'U', 'Customer', 1);
            END
                CREATE TRIGGER AfterDelete
                    ON [dbo].[Customer]
                    AFTER DELETE
                    AS
                BEGIN
                    INSERT INTO Customer_Log (data_ora, tip_operație, nume_tabel, numar_inregistrari_afectate)
                    VALUES (GETDATE(), 'D', 'Customer', 1);
                END
                    INSERT INTO Customer
                    VALUES (123, 'Bear', '432768767967', '1234567895')
                    INSERT INTO Customer
                    VALUES (13, 'Bear2', '4327645664597', '1234567695')
                    UPDATE Customer
                    SET customer_name='Malvin'
                    WHERE customer_name = 'Bear2'
                    DELETE
                    FROM Customer
                    WHERE customer_name = 'Malvin'
