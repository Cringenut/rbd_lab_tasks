
 CREATE SCHEMA main_user;
 
 CREATE TABLE main_user.user (
 id serial PRIMARY KEY,
 name varchar(100),
 surame varchar(100),
 email varchar(100),
 phone_number varchar(100)
 );
 
  CREATE TABLE main_user.passenger (
 id serial PRIMARY KEY NOT NULL,
 paymenent_type int NOT NULL
 );
 
 CREATE TABLE main_user.passenger_rating (
 id serial PRIMARY KEY NOT NULL,
 behavior int NOT NULL,
 punktuality int NOT NULL
 );
 
 CREATE TABLE main_user.driver (
 id serial PRIMARY KEY NOT NULL,
 photo bytea[]
 );
 
 CREATE TABLE main_user.driver_rating (
 id serial PRIMARY KEY NOT NULL,
 skill int NOT NULL,
 car_state int NOT NULL,
 rules_following int NOT NULL
 );
 
  CREATE SCHEMA main_vehicle;
  
 CREATE TABLE main_vehicle.vehicle_type (
 id serial PRIMARY KEY NOT NULL,
 name varchar(100)
 );
 
 CREATE TABLE main_vehicle.vehicle (
 id serial PRIMARY KEY NOT NULL,
 brand varchar(100),
 model varchar(100)
 );
 
 CREATE TABLE main_vehicle.user_vehicle (
 id serial PRIMARY KEY NOT NULL,
 plate_number varchar(100),
 color varchar(100)
 );
 
   CREATE SCHEMA main_drive;
   
 CREATE TABLE main_drive.drive (
 id serial PRIMARY KEY NOT NULL,
 distnace double NOT NULL
 );  
 
 CREATE TABLE main_drive.payment_type (
 id serial PRIMARY KEY NOT NULL,
 name varchar(100)
 );  
 
 CREATE TABLE main_drive.payment (
 id serial PRIMARY KEY NOT NULL,
 amount float NOT NULL
 ); 
 
 CREATE TABLE main_drive.adress (
 id serial PRIMARY KEY NOT NULL,
 street_name varchar(255),
  building_number varchar(10),
  flat_number varchar(10),
  city varchar(25),
  zip_code varchar(25),
  country varchar(25)
 ); 
 
 CREATE TABLE main_drive.area (
 id serial PRIMARY KEY NOT NULL,
 name varchar(255)
 ); 



INSERT INTO 
  user (name, surname, phone_number, email)
VALUES
  ('Alex', 'Kokos', '456-123-752', 'email0@gmail.com'),
  ('Kuba', 'Libre', '448-035-841', 'email1@gmail.com'),
  ('Kosz', 'Koszewski', '246-319-622', 'email2@gmail.com'),
  ('Fidel', 'Kastro', '924-045-135', 'email3@gmail.com'),
  ('Antonio', 'Antones', '456-842-757', 'email4@gmail.com');
  
 
 INSERT INTO 
  passenger (paymenent_type)
VALUES
  ('Card'),
  ('Cash'),
  ('Cash'),
  ('Points'),
  ('Card');
  
INSERT INTO 
  passenger_rating (behavior, punktuality)
VALUES
  (5, 4),
  (5, 5),
  (3, 5),
  (0, 0),
  (1, 1);  
 
 

 INSERT INTO 
  driver_rating (skill, car_state, rules_following)
VALUES
  (5, 4, 5),
  (5, 5, 3),
  (3, 5, 1),
  (0, 0, 0),
  (1, 1, 5);  
  
  INSERT INTO 
  vehicle_type (name)
VALUES
  ("Sedan"),
  ("SUV"),
  ("Convertible"),
  ("Hatchback"),
  ("Van");
  
 INSERT INTO 
  vehicle (brand, model)
VALUES
  ("BMW", "i13"),
  ("Corvette", "s22"),
  ("Ford", "Polo"),
  ("Volvo", "c33"),
  ("Lada", "Priora");

INSERT INTO 
  user_vehicle (plate_number, color)
VALUES
  ("GW423", "Black"),
  ("KM524", "Red"),
  ("MS764", "Yellow"),
  ("Z214", "Orange"),
  ("KG325", "Pink");
  
  INSERT INTO 
  drive (distance)
VALUES
  (342),
  (3456),
  (5642),
  (2134),
  (974);
  
 INSERT INTO 
  drive (distance)
VALUES
  ("Cash"),
  ("Coupon"),
  ("Check"),
  ("Card"),
  ("NFC");
  
  INSERT INTO 
  adress (street_name, building_number, flat_number, city, zip_code, country)
VALUES
  ('Grunwaldzka', '2a', '3', 'Gdansk', '80-000', 'Poland'),
  ('Norwida', '19', '1c', 'Gdynia', '81-000', 'Poland'),
  ('Starogardzka', '54', '12', 'Bydgoszcz', '81-135', 'Poland'),
  ('Mochnackiego', '19', '1c', 'Wrocław', '51-132', 'Poland'),
  ('Dubois', '132', null, 'Wrocław', '51-098', 'Poland');
 
 INSERT INTO 
  area (name)
VALUES
  ("area1"),
  ("area2"),
  ("area3"),
  ("area4"),
  ("area5");


SELECT * FROM address;



