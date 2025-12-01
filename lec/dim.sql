
-- 1. Customer
CREATE TABLE Customer (
    ID_Customer char(5) primary key,
    Name_Cust varchar(80),
    Phone_Cust varchar(20),
    Email_Cust varchar(50),
    Address_Cust varchar(100)
);

INSERT ALL
    INTO Customer(ID_Customer, Name_Cust, Phone_Cust, Email_Cust, Address_Cust)
    VALUES('CS001', 'Marsya Junika', '+6281387693401', 'marsyajun01@gmail.com', 'Bekasi Barat')
    INTO Customer(ID_Customer, Name_Cust, Phone_Cust, Email_Cust, Address_Cust)
    VALUES('CS002', 'Kiki Putri', '+6280974456890', 'kikiputri02@gmail.com', 'Jakarta Selatan')
    INTO Customer(ID_Customer, Name_Cust, Phone_Cust, Email_Cust, Address_Cust)
    VALUES('CS003', 'Thalita Bila', '+6287677890432', 'thalitabil03@gmail.com', 'Bekasi Timur')
    INTO Customer(ID_Customer, Name_Cust, Phone_Cust, Email_Cust, Address_Cust)
    VALUES('CS004', 'Rafi Pasya', '+6289906443217', 'rafipasya04@gmail.com', 'Tangerang')
    INTO Customer(ID_Customer, Name_Cust, Phone_Cust, Email_Cust, Address_Cust)
    VALUES('CS005', 'Radit Kemal', '+6289077653342', 'raditkemal05@gmail.com', 'Bandung')
SELECT * FROM dual;

-- 2. Counter
CREATE TABLE Counter (
    ID_Counter char(5) primary key,
    Phone_Counter varchar(20),
    Email_Counter varchar(50),
    Number_Counter int
);

INSERT ALL
    INTO Counter(ID_Counter, Phone_Counter, Email_Counter, Number_Counter)
    VALUES('CR001', '+6289077543218', 'damricntr01@damri.id', 1)
    INTO Counter(ID_Counter, Phone_Counter, Email_Counter, Number_Counter)
    VALUES('CR002', '+6284551902367', 'damricntr02@damri.id', 2)
    INTO Counter(ID_Counter, Phone_Counter, Email_Counter, Number_Counter)
    VALUES('CR003', '+6280955431890', 'damricntr03@damri.id', 3)
    INTO Counter(ID_Counter, Phone_Counter, Email_Counter, Number_Counter)
    VALUES('CR004', '+6280965321678', 'damricntr04@damri.id', 4)
    INTO Counter(ID_Counter, Phone_Counter, Email_Counter, Number_Counter)
    VALUES('CR005', '+6280814357980', 'damricntr05@damri.id', 5)
SELECT * FROM dual;

-- 3. Staff
CREATE TABLE Staff (
    ID_Staff char(5) primary key,
    ID_Counter char(5),
    Name_Staff varchar(50),
    Phone_Staff varchar(20),
    Email_Staff varchar(50),
    Position_Staff varchar(30),

    FOREIGN KEY (ID_Counter) REFERENCES Counter(ID_Counter) ON DELETE CASCADE
);

INSERT ALL
    INTO Staff(ID_Staff, ID_Counter, Name_Staff, Phone_Staff, Email_Staff, Position_Staff)
    VALUES('ST001', 'CR001', 'Abel Dabelia', '+6280988543321', 'abel.dabel@damri.id', 'Customer Service')
    INTO Staff(ID_Staff, ID_Counter, Name_Staff, Phone_Staff, Email_Staff, Position_Staff)
    VALUES('ST002', 'CR002', 'Belva Imelva', '+6289077654329', 'belva.imel@damri.id', 'Cashier')
    INTO Staff(ID_Staff, ID_Counter, Name_Staff, Phone_Staff, Email_Staff, Position_Staff)
    VALUES('ST003', 'CR003', 'Cean Wicean', '+6289066543219', 'cean.wice@damri.id', 'Manager')
    INTO Staff(ID_Staff, ID_Counter, Name_Staff, Phone_Staff, Email_Staff, Position_Staff)
    VALUES('ST004', 'CR004', 'Dewa Sadewa', '+6280912637890', 'dewa.sade@damri.id', 'Customer Service')
    INTO Staff(ID_Staff, ID_Counter, Name_Staff, Phone_Staff, Email_Staff, Position_Staff)
    VALUES('ST005', 'CR005', 'Elsy Maelsy', '+6286799054431', 'elsy.mael@damri.id', 'Manager')
SELECT * FROM dual;

-- 4. Service Class
CREATE TABLE Service_Class (
    ID_Class char(5) primary key,
    Type_Class varchar(20),
    Price_Min int,
    Price_Max int
);

INSERT ALL
    INTO Service_Class(ID_Class, Type_Class, Price_Min, Price_Max)
    VALUES('CS001', 'Economy', 100000, 150000)
    INTO Service_Class(ID_Class, Type_Class, Price_Min, Price_Max)
    VALUES('CS002', 'Executive', 200000, 250000)
    INTO Service_Class(ID_Class, Type_Class, Price_Min, Price_Max)
    VALUES('CS003', 'Royal', 300000, 350000)
SELECT * FROM dual;

-- 5. Vehicle
CREATE TABLE Vehicle (
    ID_Vehicle char(5) primary key,
    ID_Class char(5),
    No_Plate varchar(9),
    Total_Capacity int,

    FOREIGN KEY (ID_Class) REFERENCES Service_Class(ID_Class) ON DELETE CASCADE
);

INSERT ALL
    INTO Vehicle(ID_Vehicle, ID_Class, No_Plate, Total_Capacity)
    VALUES('VH001', 'CS001', 'B 1299 WIN', 30)
    INTO Vehicle(ID_Vehicle, ID_Class, No_Plate, Total_Capacity)
    VALUES('VH002', 'CS002', 'BH 1 BRT', 50)
    INTO Vehicle(ID_Vehicle, ID_Class, No_Plate, Total_Capacity)
    VALUES('VH003', 'CS003', 'B 3467 ETA', 65)
    INTO Vehicle(ID_Vehicle, ID_Class, No_Plate, Total_Capacity)
    VALUES('VH004', 'CS001', 'BH 2901 BN', 30)
    INTO Vehicle(ID_Vehicle, ID_Class, No_Plate, Total_Capacity)
    VALUES('VH005', 'CS002', 'B 3209 PLN', 50)
SELECT * FROM dual;

-- 6. Seat
CREATE TABLE Seat (
    ID_Seat char(5) primary key,
    ID_Vehicle char(5),
    No_Seat varchar(10),
    Status_Avail varchar(20),

    FOREIGN KEY (ID_Vehicle) REFERENCES Vehicle(ID_Vehicle) ON DELETE CASCADE
);

INSERT ALL
    INTO Seat(ID_Seat, ID_Vehicle, No_Seat, Status_Avail)
    VALUES('ST001', 'VH001', 'A1', 'Available')
    INTO Seat(ID_Seat, ID_Vehicle, No_Seat, Status_Avail)
    VALUES('ST002', 'VH002', 'B2', 'Held')
    INTO Seat(ID_Seat, ID_Vehicle, No_Seat, Status_Avail)
    VALUES('ST003', 'VH003', 'C3', 'Booked')
    INTO Seat(ID_Seat, ID_Vehicle, No_Seat, Status_Avail)
    VALUES('ST004', 'VH001', 'D4', 'Available')
    INTO Seat(ID_Seat, ID_Vehicle, No_Seat, Status_Avail)
    VALUES('ST005', 'VH004', 'C5', 'Held')
SELECT * FROM dual;

-- 7. Trip
CREATE TABLE Trip (
    ID_Trip char(5) primary key,
    ID_Vehicle char(5),
    Depart_Time date,
    Start_Destination varchar(50),
    End_Destination varchar(50),

    FOREIGN KEY (ID_Vehicle) REFERENCES Vehicle(ID_Vehicle) ON DELETE CASCADE
);

INSERT ALL
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP001', 'VH001', DATE '2025-12-24', 'Jakarta', 'Bandung')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP002', 'VH002', DATE '2025-01-05', 'Lampung', 'Medan')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP003', 'VH003', DATE '2025-01-22', 'Bogor', 'Jakarta')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP004', 'VH001', DATE '2026-02-03', 'Malang', 'Surabaya')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP005', 'VH002', DATE '2026-02-30', 'Semarang', 'Malang')
SELECT * FROM dual;

-- 8. Booking
CREATE TABLE Booking (
    ID_Booking char(5) primary key,
    ID_Customer char(5),
    ID_Trip char(5),
    ID_Seat char(5),
    Time_Booking date,
    Status_Booking varchar(20),
    Total_Ticket int,
    Type_Booking varchar(20),

    FOREIGN KEY (ID_Customer) REFERENCES Customer(ID_Customer) ON DELETE CASCADE,
    FOREIGN KEY (ID_Trip) REFERENCES Trip(ID_Trip) ON DELETE CASCADE,
    FOREIGN KEY (ID_Seat) REFERENCES Seat(ID_Seat)) ON DELETE CASCADE
);

INSERT ALL
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, ID_Seat, Time_Booking, Status_Booking, Total_Ticket, Type_Booking)
    VALUES('BK001', 'CR001', 'TP001', 'ST001', DATE '2025-12-01', 'Pending', 1, 'Web')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, ID_Seat, Time_Booking, Status_Booking, Total_Ticket, Type_Booking)
    VALUES('BK002', 'CR002', 'TP002', 'ST002', DATE '2025-12-10', 'Confirmed', 2, 'Counter')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, ID_Seat, Time_Booking, Status_Booking, Total_Ticket, Type_Booking)
    VALUES('BK003', 'CR003', 'TP003', 'ST003', DATE '2026-01-18', 'Cancelled', 3, 'Web')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, ID_Seat, Time_Booking, Status_Booking, Total_Ticket, Type_Booking)
    VALUES('BK004', 'CR004', 'TP004', 'ST004', DATE '2026-01-26', 'Confirmed', 4, 'Counter')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, ID_Seat, Time_Booking, Status_Booking, Total_Ticket, Type_Booking)
    VALUES('BK005', 'CR005', 'TP005', 'ST005', DATE '2026-02-01', 'Pending', 5, 'Web')
SELECT * FROM dual;

-- 9. Ticket
CREATE TABLE Ticket (
    ID_Ticket char(5) primary key,
    ID_Booking char(5),
    Code_Booking varchar(10),
    Type_Ticket varchar(20),
    Price_Ticket int,
    Valid_Status varchar(20),

    FOREIGN KEY (ID_Booking) REFERENCES Booking(ID_Booking) ON DELETE CASCADE
);

INSERT ALL
    INTO Ticket(ID_Ticket, ID_Booking, Code_Booking, Type_Ticket, Price_Ticket, Valid_Status)
    VALUES('TK001', 'BK001', 'ABN091', 'Dewasa', 130000, 'Valid')
    INTO Ticket(ID_Ticket, ID_Booking, Code_Booking, Type_Ticket, Price_Ticket, Valid_Status)
    VALUES('TK002', 'BK002', 'BKL302', 'Anak', 220000, 'Used')
    INTO Ticket(ID_Ticket, ID_Booking, Code_Booking, Type_Ticket, Price_Ticket, Valid_Status)
    VALUES('TK003', 'BK003', 'CMP119', 'Bayi', 310000, 'Cancelled')
    INTO Ticket(ID_Ticket, ID_Booking, Code_Booking, Type_Ticket, Price_Ticket, Valid_Status)
    VALUES('TK004', 'BK004', 'DEO105', 'Dewasa', 330000, 'Valid')
    INTO Ticket(ID_Ticket, ID_Booking, Code_Booking, Type_Ticket, Price_Ticket, Valid_Status)
    VALUES('TK005', 'BK005', 'EEL014', 'Anak', 220000, 'Expired')
SELECT * FROM dual;

-- 10. Payment Method
CREATE TABLE Payment_Method (
    ID_PaymentMethod char(5) primary key,
    Payment_Type varchar(10),

    FOREIGN KEY (ID_Payment) REFERENCES Payment(ID_Payment) ON DELETE CASCADE
);

INSERT ALL
    INTO Payment_Method(ID_PaymentMethod, ID_Payment, Payment_Type)
    VALUES('PM001', 'Tunai')
    INTO Payment_Method(ID_PaymentMethod, ID_Payment, Payment_Type)
    VALUES('PM002', 'Transfer')
    INTO Payment_Method(ID_PaymentMethod, ID_Payment, Payment_Type)
    VALUES('PM003', 'E-Wallet')
SELECT * FROM dual;

-- 11. Payment
CREATE TABLE Payment (
    ID_Payment char(5) primary key,
    ID_Booking char(5),
    ID_PaymentMethod char(5),
    Total_Payment decimal(10,2),
    Date_Payment date,

    FOREIGN KEY (ID_Booking) REFERENCES Booking(ID_Booking) ON DELETE CASCADE
);

INSERT ALL
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment)
    VALUES('PY001', 'BK001', 'PM001', 230000, SYSDATE)
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment)
    VALUES('PY002', 'BK002', 'PM002' 250000, SYSDATE)
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment)
    VALUES('PY003', 'BK003', 'PM003', 280000, SYSDATE)
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment)
    VALUES('PY004', 'BK004', 'PM001', 310000, SYSDATE)
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment)
    VALUES('PY005', 'BK005', 'PM002', 330000, SYSDATE)
SELECT * FROM dual;

