-- 1. CAR
CREATE TABLE Car( 
    Car_ID CHAR(5) PRIMARY KEY, 
    Serial_Number INT NOT NULL, 
    Make VARCHAR(20), 
    Model_Made VARCHAR(20), 
    Colour VARCHAR(20), 
    Year_Made DATE, 
    Car_For_Sale CHAR(1) CHECK (Car_For_Sale IN ('Y', 'N')) 
); 

INSERT ALL
    INTO Car (Car_ID, Serial_Number, Make, Model_Made, Colour, Year_Made, Car_For_Sale)
    VALUES ('TF001', 10000, 'Japan', 'SUV', 'Black', DATE '2018-05-13', 'Y')
    INTO Car (Car_ID, Serial_Number, Make, Model_Made, Colour, Year_Made, Car_For_Sale)
    VALUES ('HC002', 10002, 'Japan', 'Sedan', 'White', DATE '2020-06-11', 'Y')
    INTO Car (Car_ID, Serial_Number, Make, Model_Made, Colour, Year_Made, Car_For_Sale)
    VALUES ('HSF03', 10003, 'South Korea', 'SUV', 'Gray', DATE '2024-12-01', 'Y')
    INTO Car (Car_ID, Serial_Number, Make, Model_Made, Colour, Year_Made, Car_For_Sale)
    VALUES ('BMW30', 10004, 'Germany', 'Sedan', 'Silver', DATE '2022-01-01', 'Y')
    INTO Car (Car_ID, Serial_Number, Make, Model_Made, Colour, Year_Made, Car_For_Sale)
    VALUES ('MBS05', 10005, 'Germany', 'Sedan', 'Black', DATE '2019-11-09', 'Y')
SELECT * from dual;

    UPDATE Car
    SET Colour = 'Black', Car_for_Sale= 'N'
    WHERE Car_ID = 'TF001';
    
    UPDATE Car
    SET Year_Made = DATE '2025-01-21', Model_Made = 'SUV'
    WHERE Car_ID = 'HSF03';

-- 2. CUSTOMER
CREATE TABLE Customer( 
    Customer_ID CHAR(5) PRIMARY KEY, 
    Customer_First_Name VARCHAR(50) NOT NULL, 
    Customer_Last_Name VARCHAR(50) NOT NULL,
    Customer_Phone_Number VARCHAR(10), 
    Customer_Address VARCHAR(50), 
    Customer_City VARCHAR(50) NOT NULL, 
    Customer_State_Province VARCHAR(50), 
    Customer_Country VARCHAR(50) NOT NULL, 
    Customer_Postal_Code INT
); 

INSERT ALL
    INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Country, Customer_City)
    VALUES ('C1233', 'Budi', 'Santoso', 'Indonesia', 'Jakarta')
    INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Country, Customer_City)
    VALUES ('C1244', 'Susi', 'Rahmawati', 'Indonesia', 'Medan')
    INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Country, Customer_City)
    VALUES ('C1255', 'Agus', 'Pratama', 'Indonesia', 'Surabaya')
    INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Country, Customer_City)
    VALUES ('C1266', 'Dewi', 'Lestari', 'Indonesia', 'Jakarta')
    INTO Customer (Customer_ID, Customer_First_Name, Customer_Last_Name, Customer_Country, Customer_City)
    VALUES ('C1277', 'Rizky', 'Saputra', 'Indonesia', 'Jakarta')
SELECT * from  dual;

    UPDATE Customer
    SET First_Name = 'Bayu', Last_Name = 'Pratama'
    WHERE Customer_ID = 'C1233';
    
    UPDATE Customer
    SET Address = 'Jl. Merdeka No.10', Phone_Number = '081234567890'
    WHERE Customer_ID = 'C1277';

-- 3. SALESPERSON
CREATE TABLE Salesperson( 
    Salesperson_ID CHAR(5) PRIMARY KEY, 
    Last_Name VARCHAR(50) NOT NULL, 
    First_Name VARCHAR(50) NOT NULL 
); 

INSERT ALL
    INTO Salesperson (Salesperson_ID, Last_Name, First_Name)
    VALUES ('K0001', 'Santan', 'Kolak')
    INTO Salesperson (Salesperson_ID, Last_Name, First_Name)
    VALUES ('F0001', 'Susu', 'Fanta') 
    INTO Salesperson (Salesperson_ID, Last_Name, First_Name)
    VALUES ('L0001', 'Coklat', 'Lecker')
    INTO Salesperson (Salesperson_ID, Last_Name, First_Name)
    VALUES ('P0001', 'Madu', 'Pancake') 
    INTO Salesperson (Salesperson_ID, Last_Name, First_Name)
    VALUES ('D0001', 'Kentang', 'Donat')
SELECT * from dual;

    UPDATE Salesperson 
    SET First_Name = 'Kolak', Last_Name = 'Sumsum'
    WHERE Salesperson_ID = 'K0001';
    
    UPDATE Salesperson
    SET First_Name = 'Fruit'
    WHERE Salesperson_ID = 'F0001';

-- 4. SALES INVOICE
CREATE TABLE Sales_Invoice( 
    Invoice_ID CHAR(5) PRIMARY KEY, 
    Invoice_Number INT NOT NULL, 
    Date_1 DATE, 
    Car_ID CHAR(5), 
    Customer_ID CHAR(5), 
    Salesperson_ID CHAR(5), 

    FOREIGN KEY (CAR_ID) REFERENCES CAR(CAR_ID) ON DELETE CASCADE, 
    FOREIGN KEY (Customer_ID) REFERENCES CUSTOMER(Customer_ID) ON DELETE CASCADE, 
    FOREIGN KEY (Salesperson_ID) REFERENCES SALESPERSON(Salesperson_ID) ON DELETE CASCADE 
); 

INSERT ALL
    INTO Sales_Invoice (Invoice_ID, Invoice_Number, Date_1, CAR_ID, Customer_ID, Salesperson_ID)
    VALUES ('KJSH2', 00001, DATE '2024-12-12', 'TF001', 'C1233', 'K0001')
    INTO Sales_Invoice (Invoice_ID, Invoice_Number, Date_1, CAR_ID, Customer_ID, Salesperson_ID)
    VALUES ('KJSH9', 00002, DATE '2024-12-13', 'HC002', 'C1244', 'F0001') 
    INTO Sales_Invoice (Invoice_ID, Invoice_Number, Date_1, CAR_ID, Customer_ID, Salesperson_ID)
    VALUES ('KJSH5', 00003, DATE '2024-12-14', 'HSF03', 'C1255', 'L0001')
    INTO Sales_Invoice (Invoice_ID, Invoice_Number, Date_1, CAR_ID, Customer_ID, Salesperson_ID)
    VALUES ('KJSH1', 00004, DATE '2024-12-15', 'BMW30', 'C1266', 'P0001')
    INTO Sales_Invoice (Invoice_ID, Invoice_Number, Date_1, CAR_ID, Customer_ID, Salesperson_ID)
    VALUES ('KJSH6', 00005, DATE '2024-12-16', 'MBS05', 'C1277', 'D0001')
SELECT * from dual;

    UPDATE Sales_Invoice 
    SET Date_1 = DATE '2025-01-15'
    WHERE Invoice_ID = 'KJSH9';
    
    UPDATE Sales_Invoice 
    SET Salesperson_ID = 'F0001', Car_ID = 'MBS05'
    WHERE Invoice_ID = 'KJSH2';

-- 5. MECHANIC
CREATE TABLE MECHANIC( 
    Mechanic_ID CHAR(5) PRIMARY KEY, 
    Mechanic_First_Name VARCHAR(50) NOT NULL, 
    Mechanic_Last_Name VARCHAR(50) NOT NULL, 
    Experience_Years INT NOT NULL, 
    Availability_Status VARCHAR(20) DEFAULT 'Available' 
); 

INSERT ALL
    INTO MECHANIC (Mechanic_ID, Mechanic_First_Name, Mechanic_Last_Name, Experience_Years, Availability_Status)
    VALUES ('A0123', 'John', 'Doe', 10, 'Available') 
    INTO MECHANIC (Mechanic_ID, Mechanic_First_Name, Mechanic_Last_Name, Experience_Years, Availability_Status)
    VALUES ('A1123', 'Jane', 'Smith', 8, 'Available') 
    INTO MECHANIC (Mechanic_ID, Mechanic_First_Name, Mechanic_Last_Name, Experience_Years, Availability_Status)
    VALUES ('A2123', 'Mike', 'Johnson', 12, 'Not Available') 
    INTO MECHANIC (Mechanic_ID, Mechanic_First_Name, Mechanic_Last_Name, Experience_Years, Availability_Status)
    VALUES ('A3123', 'Emily', 'Davis', 6, 'Available')
    INTO MECHANIC (Mechanic_ID, Mechanic_First_Name, Mechanic_Last_Name, Experience_Years, Availability_Status)
    VALUES ('A4123', 'Robert', 'Brown', 9, 'Available')  
SELECT * from dual;

    UPDATE MECHANIC
    SET Availability_Status = 'Available'
    WHERE Mechanic_ID = 'A2123';
    
    UPDATE MECHANIC
    SET Experience_Years = 7
    WHERE Mechanic_ID = 'A3123';

-- 6. SERVICE
CREATE TABLE SERVICEE( 
    Service_ID CHAR(5) PRIMARY KEY, 
    Service_Name VARCHAR(50), 
    Hourly_Rate INT NOT NULL, 
    Estimated_Duration INT, 
    Availability_Status VARCHAR(20) DEFAULT 'Available' 
); 

INSERT ALL
    INTO SERVICEE (SERVICE_ID, SERVICE_NAME, HOURLY_RATE, ESTIMATED_DURATION, AVAILABILITY_STATUS)
    VALUES ('SVC01', 'Oil Change', 50, 30, 'Available') 
    INTO SERVICEE (SERVICE_ID, SERVICE_NAME, HOURLY_RATE, ESTIMATED_DURATION, AVAILABILITY_STATUS)
    VALUES ('SVC02', 'Brake Inspection', 40, 45, 'Available') 
    INTO SERVICEE (SERVICE_ID, SERVICE_NAME, HOURLY_RATE, ESTIMATED_DURATION, AVAILABILITY_STATUS)
    VALUES ('SVC03', 'Tire Rotation', 30, 20, 'Available') 
    INTO SERVICEE (SERVICE_ID, SERVICE_NAME, HOURLY_RATE, ESTIMATED_DURATION, AVAILABILITY_STATUS)
    VALUES ('SVC04', 'Engine Diagnostic', 70, 60, 'Available')
    INTO SERVICEE (SERVICE_ID, SERVICE_NAME, HOURLY_RATE, ESTIMATED_DURATION, AVAILABILITY_STATUS)
    VALUES ('SVC05', 'Battery Replacement', 45, 25, 'Available')
SELECT * from dual;

    UPDATE SERVICEE
    SET Hourly_Rate = 80
    WHERE Service_ID = 'SVC04';
    
    UPDATE Servicee
    SET Service_Name = 'Tire Rotation'
    WHERE Service_ID = 'SVC01';

-- 7. SERVICE MECHANIC
CREATE TABLE ServiceMechanic(
    Service_Mechanic_ID CHAR(5) PRIMARY KEY,  
    Ticket_ID CHAR(5) NOT NULL,  
    Service_ID CHAR(5), 
    Mechanic_ID CHAR(5), 
    Service_Hours INT NOT NULL,  
    Service_Comment VARCHAR(100),  
    Service_Rate INT, 
    
    FOREIGN KEY (Ticket_ID) REFERENCES Service_Ticket(Ticket_ID) ON DELETE CASCADE, 
    FOREIGN KEY (Service_ID) REFERENCES Servicee(Service_ID) ON DELETE CASCADE, 
    FOREIGN KEY (Mechanic_ID) REFERENCES Mechanic(Mechanic_ID) ON DELETE CASCADE
);

INSERT ALL
    INTO ServiceMechanic  (Service_Mechanic_ID, Ticket_ID, Service_ID, Mechanic_ID, Service_Hours, Service_Comment, Service_Rate) VALUES
    ('SQL01', 'ST001', 'SVC01', 'A0123', 60, 'Good', 8)  
    INTO ServiceMechanic  (Service_Mechanic_ID, Ticket_ID, Service_ID, Mechanic_ID, Service_Hours, Service_Comment, Service_Rate) VALUES
    ('SQL02', 'ST002', 'SVC02', 'A1123', 80, 'Not Really Good', 5) 
    INTO ServiceMechanic  (Service_Mechanic_ID, Ticket_ID, Service_ID, Mechanic_ID, Service_Hours, Service_Comment, Service_Rate) VALUES
    ('SQL03', 'ST003', 'SVC03', 'A2123', 60, 'Not Bad', 6) 
    INTO ServiceMechanic  (Service_Mechanic_ID, Ticket_ID, Service_ID, Mechanic_ID, Service_Hours, Service_Comment, Service_Rate) VALUES
    ('SQL04', 'ST004', 'SVC04', 'A3123', 50, 'Nice', 9) 
    INTO ServiceMechanic  (Service_Mechanic_ID, Ticket_ID, Service_ID, Mechanic_ID, Service_Hours, Service_Comment, Service_Rate) VALUES
    ('SQL05', 'ST005', 'SVC05', 'A4123', 90, 'Good', 7) 
SELECT * from dual;

    UPDATE ServiceMechanic
    SET Service_Comment = 'Average Service'
    WHERE Service_Mechanic_ID = 'SQL02';
    
    UPDATE ServiceMechanic
    SET Service_Rate = 9
    WHERE Service_Mechanic_ID = 'SQL05';

-- 8. SERVICE TICKET
CREATE TABLE SERVICE_TICKET( 
    Ticket_ID CHAR(5) PRIMARY KEY, 
    Ticket_Number INT NOT NULL, 
    Ticket_Date_Received VARCHAR(10), 
    Ticket_Comments VARCHAR(50), 
    Ticket_Date_Return_To_Customer VARCHAR(10), 
    Car_ID CHAR(5), 
    Customer_ID CHAR(5), 
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)  ON DELETE CASCADE, 
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)  ON DELETE CASCADE 
); 

INSERT ALL
    INTO Service_Ticket (ticket_id, ticket_number, ticket_date_received, ticket_comments, ticket_date_return_to_customer, car_id, customer_id) VALUES
    ('ST001', 12, DATE '2025-01-02', 'Ticket given to queue number 12.', DATE '2025-01-12', 'TF001', 'C1233') 
    INTO Service_Ticket (ticket_id, ticket_number, ticket_date_received, ticket_comments, ticket_date_return_to_customer, car_id, customer_id) VALUES
    ('ST002', 7, DATE '2025-03-12', 'Ticket given to queue number 7.', DATE '2025-03-13', 'HC002', 'C1244')
    INTO Service_Ticket (ticket_id, ticket_number, ticket_date_received, ticket_comments, ticket_date_return_to_customer, car_id, customer_id) VALUES
    ('ST003', 2, DATE '2025-02-13', 'Ticket given to queue number 2.', DATE '2025-03-01', 'HSF03', 'C1255')
    INTO Service_Ticket (ticket_id, ticket_number, ticket_date_received, ticket_comments, ticket_date_return_to_customer, car_id, customer_id) VALUES
    ('ST004', 15, DATE '2025-08-14', 'Ticket given to queue number 15.', DATE '2025-10-15', 'BMW30', 'C1266')
    INTO Service_Ticket (ticket_id, ticket_number, ticket_date_received, ticket_comments, ticket_date_return_to_customer, car_id, customer_id) VALUES
    ('ST005', 10, DATE '2025-03-15', 'Ticket given to queue number 10.', DATE '2025-03-19', 'MBS05', 'C1277')
SELECT * from dual;

    UPDATE SERVICE_TICKET
    SET Ticket_Date_Return_To_Customer = DATE '2025-02-25'
    WHERE Ticket_ID = 'ST003';
    
    UPDATE SERVICE_TICKET
    SET Ticket_Comments = 'Ticket processed and ready for pickup.'
    WHERE Ticket_ID = 'ST002';

-- 9. PARTS
CREATE TABLE PARTS( 
    Parts_ID CHAR(5) PRIMARY KEY, 
    Part_Number INT NOT NULL, 
    Part_Description VARCHAR(100) NOT NULL,
    Part_Purchase_Price INT NOT NULL, 
    Part_Retail_Price INT NOT NULL 
); 

INSERT ALL
    INTO Parts (parts_id, part_number, part_description, part_purchase_price, part_retail_price) VALUES
    ('PA001', 10, 'Ini adalah skrup untuk 1 roda mobil.', 10000, 10500)
    INTO Parts (parts_id, part_number, part_description, part_purchase_price, part_retail_price) VALUES
    ('PA002', 08, 'Ini adalah skrup 2 untuk roda mobil.', 11000, 11500)
    INTO Parts (parts_id, part_number, part_description, part_purchase_price, part_retail_price) VALUES
    ('PA003', 19, 'Ini adalah skrup 3 untuk roda mobil.', 12000, 12500)
    INTO Parts (parts_id, part_number, part_description, part_purchase_price, part_retail_price) VALUES
    ('PA004', 06, 'Ini adalah skrup 4 untuk roda mobil.', 13000, 13500)
    INTO Parts (parts_id, part_number, part_description, part_purchase_price, part_retail_price) VALUES
    ('PA005', 11, 'Ini adalah skrup 5 untuk roda mobil.', 14000, 14500)
SELECT * from dual;

    UPDATE Parts
    SET part_number = 15
    WHERE parts_ID = 'PA001';
    
    UPDATE Parts
    SET part_description = 'Ini adalah skrup dan baut 3 untuk roda mobil'
    WHERE parts_id='PA003';

-- 10. PARTS USED
CREATE TABLE PARTS_USED( 
    Parts_Used_ID CHAR(5) PRIMARY KEY, 
    Parts_Number_Used INT NOT NULL, 
    Parts_Used_Price INT NOT NULL, 
    Car_ID CHAR(5), 
    Ticket_ID CHAR(5), 
    Parts_ID CHAR(5),
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID) ON DELETE CASCADE, 
    FOREIGN KEY (Ticket_ID) REFERENCES Service_Ticket(Ticket_ID) ON DELETE CASCADE,
    FOREIGN KEY (Parts_ID) REFERENCES Parts(Parts_ID) ON DELETE CASCADE
); 

INSERT ALL
    INTO Parts_Used (parts_used_id, parts_number_used, parts_used_price, parts_id, car_id, ticket_id) VALUES
    ('PU001', 33, 120000, 'PA001', 'TF001', 'ST001')
    INTO Parts_Used (parts_used_id, parts_number_used, parts_used_price, parts_id, car_id, ticket_id) VALUES
    ('PU002', 7, 28000, 'PA002', 'HC002', 'ST002')
    INTO Parts_Used (parts_used_id, parts_number_used, parts_used_price, parts_id, car_id, ticket_id) VALUES
    ('PU003', 18, 44000, 'PA003', 'HSF03', 'ST003')
    INTO Parts_Used (parts_used_id, parts_number_used, parts_used_price, parts_id, car_id, ticket_id) VALUES
    ('PU004', 4, 9000, 'PA004', 'BMW30', 'ST004')
    INTO Parts_Used (parts_used_id, parts_number_used, parts_used_price, parts_id, car_id, ticket_id) VALUES
    ('PU005', 13, 16000, 'PA005', 'MBS05', 'ST005')
SELECT * from dual;
    
    UPDATE Parts_Used
    SET parts_number_used = 35
    WHERE parts_used_id = 'PU001';
    
    UPDATE Parts_Used
    SET parts_used_price = 50000
    WHERE parts_used_id = 'PU003';

-- CREATE VIEW
CREATE VIEW Sales_Report_View AS
WITH Car_Sales_Count AS (
    -- Subquery: menghitung jumlah penjualan per Salesperson
    SELECT 
        s.Salesperson_ID,
        COUNT(*) AS Total_Sales
    FROM Sales_Invoice si
    INNER JOIN Salesperson s ON si.Salesperson_ID = s.Salesperson_ID
    GROUP BY s.Salesperson_ID
),
Recent_Sales AS (
    -- Subquery: mengambil data penjualan setelah 2024-12-13
    SELECT * 
    FROM Sales_Invoice
    WHERE Date_1 > DATE '2024-12-13'
)

SELECT 
    si.Invoice_ID,
    si.Invoice_Number,
    si.Date_1,
    c.Make,
    c.Model_Made,
    c.Colour,
    c.Year_Made,
    s.First_Name || ' ' || s.Last_Name AS Salesperson_Name,
    cs.Total_Sales
FROM Recent_Sales si
INNER JOIN Car c ON si.Car_ID = c.CAR_ID
INNER JOIN Salesperson s ON si.Salesperson_ID = s.Salesperson_ID
INNER JOIN Car_Sales_Count cs ON s.Salesperson_ID = cs.Salesperson_ID

UNION

-- Set Operator UNION: kita tampilkan juga data Salesperson yang belum punya penjualan
SELECT 
    NULL AS Invoice_ID,
    NULL AS Invoice_Number,
    NULL AS Date_1,
    NULL AS Make,
    NULL AS Model_Made,
    NULL AS Colour,
    NULL AS Year_Made,
    s.First_Name || ' ' || s.Last_Name AS Salesperson_Name,
    0 AS Total_Sales
FROM Salesperson s
WHERE s.Salesperson_ID NOT IN (
    SELECT DISTINCT Salesperson_ID FROM Sales_Invoice
);

SELECT * FROM Sales_Report_View;
