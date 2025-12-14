
-- 1. Customer
CREATE TABLE Customer (
    ID_Customer char(5) primary key,
    Name_Cust varchar(80),
    Phone_Cust varchar(15),
    Email_Cust varchar(50),

    CONSTRAINT ck_custname CHECK(LENGTH(Name_Cust > 3),
    CONSTRAINT ck_custid CHECK(REGEXP_LIKE(ID_Customer, '^CR[0-9{3}$')),
    CONSTRAINT ck_custphone CHECK(Phone_Cust LIKE '+62%'),
    CONSTRAINT ck_emailcust CHECK(Email_Cust LIKE '%@gmail.com')
    
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

-- 4. Service Class
CREATE TABLE Service_Class (
    ID_Class char(5) primary key,
    Type_Class varchar(20),
    
    CONSTRAINT ck_classid CHECK(REGEXP_LIKE(ID_Class, '^CS[0-9{3}$')),
    CONSTRAINT ck_classtype CHECK(Type_Class IN 'Business', 'Executive', 'Royal')
);


-- 1. Customer
CREATE TABLE Customer (
    ID_Customer char(5) primary key,
    Name_Cust varchar(80) NOT NULL,
    Phone_Cust varchar(15) NOT NULL,
    Email_Cust varchar(50) NOT NULL,
    Address_Cust varchar(100) NOT NULL,

    CONSTRAINT ck_custname CHECK(LENGTH(Name_Cust > 3),
    CONSTRAINT ck_custid CHECK(REGEXP_LIKE(ID_Customer, '^CR[0-9{3}$')),
    CONSTRAINT ck_custphone CHECK(Phone_Cust LIKE '+62%'),
    CONSTRAINT ck_emailcust CHECK(Email_Cust LIKE '%@gmail.com')
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

-- 4. Service Class
CREATE TABLE Service_Class (
    ID_Class char(5) primary key,
    Type_Class varchar(20) NOT NULL,
    
    CONSTRAINT ck_classid CHECK(REGEXP_LIKE(ID_Class, '^CS[0-9{3}$')),
    CONSTRAINT ck_classtype CHECK(Type_Class IN 'Business', 'Executive', 'Royal')
);

INSERT ALL
    INTO Service_Class(ID_Class, Type_Class)
    VALUES('CS001', 'Business')
    INTO Service_Class(ID_Class, Type_Class)
    VALUES('CS002', 'Executive')
    INTO Service_Class(ID_Class, Type_Class)
    VALUES('CS003', 'Royal')
SELECT * FROM dual;

-- 5. Vehicle
CREATE TABLE Vehicle (
    ID_Vehicle char(5) primary key,
    Type_Vehicle varchar(50) NOT NULL,
    No_Plate varchar(10) NOT NULL,
    Total_Capacity int NOT NULL,
    
    CONSTRAINT ck_vehid CHECK(REGEXP_LIKE(ID_Vehicle, '^VH[0-9{3}$')),
    CONSTRAINT ck_vehtype CHECK(Type_Vehicle IN 'Bus Besar', 'Sleeper Bus', 'Bus Kecil')
);

INSERT ALL
    INTO Vehicle(ID_Vehicle, Type_Vehicle, No_Plate, Total_Capacity)
    VALUES('VH001', 'Bus Besar', 'B 1299 WIN', 39)
    INTO Vehicle(ID_Vehicle, Type_Vehicle, No_Plate, Total_Capacity)
    VALUES('VH002', 'Sleeper Bus', 'BH 1 RT', 10)
    INTO Vehicle(ID_Vehicle, Type_Vehicle, No_Plate, Total_Capacity)
    VALUES('VH003', 'Bus Kecil', 'B 3467 ETA', 32)
SELECT * FROM dual;

-- 6. Seat
CREATE TABLE Seat (
    ID_Seat char(5) primary key,
    ID_Trip char(50) NOT NULL,
    No_Seat varchar(10) NOT NULL,

    FOREIGN KEY (ID_Trip) REFERENCES Trip(ID_Trip) ON DELETE CASCADE,
    CONSTRAINT ck_seatid CHECK(REGEXP_LIKE(ID_Seat, '^ST[0-9{3}$'))
);

INSERT ALL
    INTO Seat(ID_Seat, ID_Trip, No_Seat)
    VALUES('ST001', 'TP001', 'A1')
    INTO Seat(ID_Seat, ID_Trip, No_Seat)
    VALUES('ST002', 'TP002', 'B2')
    INTO Seat(ID_Seat, ID_Trip, No_Seat)
    VALUES('ST003', 'TP003', 'C3')
    INTO Seat(ID_Seat, ID_Trip, No_Seat)
    VALUES('ST004', 'TP004', 'D4')
    INTO Seat(ID_Seat, ID_Trip, No_Seat)
    VALUES('ST005', 'TP005', 'C5')
SELECT * FROM dual;

-- 7. Trip
CREATE TABLE Trip (
    ID_Trip char(5) primary key,
    ID_Vehicle char(5) NOT NULL,
    ID_Class char(5) NOT NULL,
    Depart_Time date NOT NULL,
    Start_Location varchar(50) NOT NULL,
    End_Location varchar(50) NOT NULL,

    FOREIGN KEY (ID_Vehicle) REFERENCES Vehicle(ID_Vehicle) ON DELETE CASCADE,
    FOREIGN KEY (ID_Class) REFERENCES Service_Class(ID_Class) ON DELETE CASCADE,
    CONSTRAINT ck_tripid CHECK(REGEXP_LIKE(ID_Trip, '^TP[0-9{3}$'))
);

INSERT ALL
    INTO Trip(ID_Trip, ID_Vehicle, ID_Class, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP001', 'VH001', 'CS001', DATE '2025-12-24', 'Jakarta', 'Bandung')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP002', 'VH002', 'CS002', DATE '2025-01-05', 'Lampung', 'Medan')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP003', 'VH003', 'CS003', DATE '2025-01-22', 'Bogor', 'Jakarta')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP004', 'VH001', 'CS001', DATE '2026-02-03', 'Malang', 'Surabaya')
    INTO Trip(ID_Trip, ID_Vehicle, Depart_Time, Start_Destination, End_Destination)
    VALUES('TP005', 'VH002', 'CS003', DATE '2026-02-30', 'Semarang', 'Malang')
SELECT * FROM dual;

-- 8. Booking
CREATE TABLE Booking (
    ID_Booking char(5) primary key,
    ID_Customer char(5) NOT NULL,
    ID_Trip char(5) NOT NULL,
    Code_Booking varchar(10) NOT NULL,
    Time_Booking date NOT NULL,
    Status_Booking varchar(20) NOT NULL,

    FOREIGN KEY (ID_Customer) REFERENCES Customer(ID_Customer) ON DELETE CASCADE,
    FOREIGN KEY (ID_Trip) REFERENCES Trip(ID_Trip) ON DELETE CASCADE,
    CONSTRAINT ck_bookid CHECK(REGEXP_LIKE(ID_Booking, '^BK[0-9{3}$')),
    CONSTRAINT ck_statbook CHECK(Status_Booking IN 'Pending', 'Confirmed', 'Cancelled')
);

INSERT ALL
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, Code_Booking, Time_Booking, Status_Booking)
    VALUES('BK001', 'CR001', 'TP001', 'ABN301', DATE '2025-12-01', 'Pending')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, Code_Booking, Time_Booking, Status_Booking)
    VALUES('BK002', 'CR002', 'TP002', 'BKL302', DATE '2025-12-10', 'Confirmed')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, Code_Booking, Time_Booking, Status_Booking)
    VALUES('BK003', 'CR003', 'TP003', 'CMP119', DATE '2026-01-18', 'Cancelled')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, Code_Booking, Time_Booking, Status_Booking)
    VALUES('BK004', 'CR004', 'TP004', 'DEO105', DATE '2026-01-26', 'Confirmed')
    INTO Booking(ID_Booking, ID_Customer, ID_Trip, Code_Booking, Time_Booking, Status_Booking)
    VALUES('BK005', 'CR005', 'TP005', 'EEL014', DATE '2026-02-01', 'Pending')
SELECT * FROM dual;

CREATE TABLE Booking_Detail (
    ID_BookingDetail char(5) primary key,
    ID_Booking char(5) NOT NULL,
    ID_Seat char(5) NOT NULL,
    BookingPrice int NOT NULL,
    Status_Detail varchar(20)

    FOREIGN KEY (ID_Booking) REFERENCES Booking(ID_Booking)) ON DELETE CASCADE,
    FOREIGN KEY (ID_Seat) REFERENCES Seat(ID_Seat)) ON DELETE CASCADE,
    CONSTRAINT ck_bookdetid CHECK(REGEXP_LIKE(ID_BookingDetail, '^BD[0-9{3}$')),
    CONSTRAINT ck_statdetbook CHECK(Status_Detail IN 'Pending', 'Confirmed', 'Cancelled')
);

INSERT ALL
    INTO BookingDetail(ID_BookingDetail, ID_Booking, ID_Seat, BookingPrice, Status_Detail)
    VALUES('BD001', 'BK001', 'ST001', 150000, 'Pending')
    INTO BookingDetail(ID_BookingDetail, ID_Booking, ID_Seat, BookingPrice, Status_Detail)
    VALUES('BD002', 'BK002', 'ST002', 200000, 'Pending')
    INTO BookingDetail(ID_BookingDetail, ID_Booking, ID_Seat, BookingPrice, Status_Detail)
    VALUES('BD003', 'BK003', 'ST003', 250000, 'Pending')
    INTO BookingDetail(ID_BookingDetail, ID_Booking, ID_Seat, BookingPrice, Status_Detail)
    VALUES('BD004', 'BK004', 'ST004', 150000, 'Pending')
    INTO BookingDetail(ID_BookingDetail, ID_Booking, ID_Seat, BookingPrice, Status_Detail)
    VALUES('BD005', 'BK005', 'ST005', 250000, 'Pending')
SELECT * FROM dual;


-- 9. Ticket
CREATE TABLE Ticket (
    ID_Ticket char(5) primary key,
    ID_Booking char(5) NOT NULL,
    No_Ticket varchar(10) NOT NULL,
    Valid_Status varchar(20) NOT NULL,

    FOREIGN KEY (ID_Booking) REFERENCES Booking(ID_Booking) ON DELETE CASCADE,
    CONSTRAINT ck_ticketid CHECK(REGEXP_LIKE(ID_Ticket, '^TK[0-9{3}$')),
    CONSTRAINT ck_statvalid CHECK(Valid_Status IN 'Valid', 'Used', 'Expired')
);

INSERT ALL
    INTO Ticket(ID_Ticket, ID_Booking, No_Ticket, Valid_Status)
    VALUES('TK001', 'BK001', (), 'Valid')
    INTO Ticket(ID_Ticket, ID_Booking, No_Ticket, Valid_Status)
    VALUES('TK002', 'BK002', (), 'Valid')
    INTO Ticket(ID_Ticket, ID_Booking, No_Ticket, Valid_Status)
    VALUES('TK003', 'BK003', (), 'Valid')
    INTO Ticket(ID_Ticket, ID_Booking, No_Ticket, Valid_Status)
    VALUES('TK004', 'BK004', (), 'Valid')
    INTO Ticket(ID_Ticket, ID_Booking, No_Ticket, Valid_Status)
    VALUES('TK005', 'BK005', (), 'Valid')
SELECT * FROM dual;

-- 10. Payment Method
CREATE TABLE Payment_Method (
    ID_PaymentMethod char(5) primary key,
    Payment_Type varchar(10) NOT NULL,

    CONSTRAINT ck_paymetid CHECK(REGEXP_LIKE(ID_PaymentMethod, '^PM[0-9{3}$')),
    CONSTRAINT ck_paytype CHECK(Payment_Type IN 'Bank Transfer', 'E-wallet', 'Card')
);

INSERT ALL
    INTO Payment_Method(ID_PaymentMethod, ID_Payment, Payment_Type)
    VALUES('PM001', 'Bank Transfer')
    INTO Payment_Method(ID_PaymentMethod, ID_Payment, Payment_Type)
    VALUES('PM002', 'E-wallet')
    INTO Payment_Method(ID_PaymentMethod, ID_Payment, Payment_Type)
    VALUES('PM003', 'Card')
SELECT * FROM dual;

-- 11. Payment
CREATE TABLE Payment (
    ID_Payment char(5) primary key,
    ID_Booking char(5) NOT NULL,
    ID_PaymentMethod char(5) NOT NULL,
    Total_Payment decimal(10,2) NOT NULL,
    Date_Payment date NOT NULL,
    Status_Payment varchar(20) NOT NULL,

    FOREIGN KEY (ID_Booking) REFERENCES Booking(ID_Booking) ON DELETE CASCADE,
    FOREIGN KEY (ID_PaymentMethod) REFERENCES Payment_Method(ID_PaymentMethod) ON DELETE CASCADE,
    CONSTRAINT ck_statpay CHECK(Status_Payment IN 'Pending', 'Success', 'Failed')
);

INSERT ALL
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment, Status_Payment)
    VALUES('PY001', 'BK001', 'PM001', 150000, SYSDATE, 'Success')
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment, Status_Payment)
    VALUES('PY002', 'BK002', 'PM002' 200000, SYSDATE, 'Success')
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment, Status_Payment)
    VALUES('PY003', 'BK003', 'PM003', 250000, SYSDATE, 'Success')
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment, Status_Payment)
    VALUES('PY004', 'BK004', 'PM001', 150000, SYSDATE, 'Success')
    INTO Payment(ID_Payment, ID_Booking, ID_PaymentMethod, Total_Payment, Date_Payment, Status_Payment)
    VALUES('PY005', 'BK005', 'PM002', 250000, SYSDATE, 'Success')
SELECT * FROM dual;
