CREATE DATABASE taxi;


 CREATE SCHEMA main_user;

 CREATE TABLE main_user.user (
 id serial PRIMARY KEY,
 name varchar(100),
 surname varchar(100),
 email varchar(100),
 phone_number varchar(100)
 );

  CREATE TABLE main_user.passenger (
 id serial PRIMARY KEY NOT NULL,
 payment_type varchar(100)
 );

 CREATE TABLE main_user.passenger_rating (
 id serial PRIMARY KEY NOT NULL,
 behavior int NOT NULL,
 punctuality int NOT NULL
 );

 CREATE TABLE main_user.driver (
 id serial PRIMARY KEY NOT NULL

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

 CREATE TABLE main_vehicle.user_vehicle1 (
 id serial PRIMARY KEY NOT NULL,
 plate_number varchar(100),
 color varchar(100)
 );

   CREATE SCHEMA main_drive;

 CREATE TABLE main_drive.drive (
 id serial PRIMARY KEY NOT NULL,
 distance decimal NOT NULL
 );

 CREATE TABLE main_drive.payment_type (
 id serial PRIMARY KEY NOT NULL,
 name varchar(100)
 );

 CREATE TABLE main_drive.payment (
 id serial PRIMARY KEY NOT NULL,
 amount float NOT NULL
 );

CREATE TABLE main_drive.address(
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
  main_user.user (name, surname, phone_number, email)
VALUES
  ('Alex', 'Kokos', '456-123-752', 'email0@gmail.com'),
  ('Kuba', 'Libre', '448-035-841', 'email1@gmail.com'),
  ('Kosz', 'Koszewski', '246-319-622', 'email2@gmail.com'),
  ('Fidel', 'Kastro', '924-045-135', 'email3@gmail.com'),
  ('Antonio', 'Antones', '456-842-757', 'email4@gmail.com');


 INSERT INTO
  main_user.passenger (payment_type)
VALUES
  ('Card'),
  ('Cash'),
  ('Cash'),
  ('Points'),
  ('Card');

INSERT INTO
  main_user.passenger_rating (behavior, punctuality)
VALUES
  (5, 4),
  (5, 5),
  (3, 5),
  (0, 0),
  (1, 1);



 INSERT INTO
  main_user.driver_rating (skill, car_state, rules_following)
VALUES
  (5, 4, 5),
  (5, 5, 3),
  (3, 5, 1),
  (0, 0, 0),
  (1, 1, 5);

  INSERT INTO
  main_vehicle.vehicle_type (name)
VALUES
  ('Sedan'),
  ('SUV'),
  ('Convertible'),
  ('Hatchback'),
  ('Van');

 INSERT INTO
  main_vehicle.vehicle (brand, model)
VALUES
  ('BMW', 'i13'),
  ('Corvette', 's22'),
  ('Ford', 'Polo'),
  ('Volvo', 'c33'),
  ('Lada', 'Priora');

INSERT INTO
  main_vehicle.user_vehicle (plate_number, color)
VALUES
  ('GW423', 'Black'),
  ('KM524', 'Red'),
  ('MS764', 'Yellow'),
  ('Z214', 'Orange'),
  ('KG325', 'Pink');

  INSERT INTO
  main_drive.drive (distance)
VALUES
  (342),
  (3456),
  (5642),
  (2134),
  (974);

  INSERT INTO
  main_drive.address (street_name, building_number, flat_number, city, zip_code, country)
VALUES
  ('Grunwaldzka', '2a', '3', 'Gdansk', '80-000', 'Poland'),
  ('Norwida', '19', '1c', 'Gdynia', '81-000', 'Poland'),
  ('Starogardzka', '54', '12', 'Bydgoszcz', '81-135', 'Poland'),
  ('Mochnackiego', '19', '1c', 'Wrocław', '51-132', 'Poland'),
  ('Dubois', '132', null, 'Wrocław', '51-098', 'Poland');

 INSERT INTO
  main_drive.area (name)
VALUES
  ('area1'),
  ('area2'),
  ('area3'),
  ('area4'),
  ('area5');


SELECT * FROM main_drive.address;
SELECT * FROM main_drive.drive;
SELECT * FROM main_vehicle.user_vehicle;
SELECT * FROM main_vehicle.vehicle;
SELECT * FROM main_vehicle.vehicle_type;
SELECT * FROM main_user.driver_rating;
SELECT * FROM main_user.passenger_rating;

DROP TABLE main_user.passenger_rating;


DELETE from main_user.user; --DONT ACTIVATE YET
SELECT * FROM main_user.user;

DROP TABLE main_user.passenger;
CREATE TABLE main_user.passenger(
    id serial PRIMARY KEY NOT NULL,

    user_id INT NOT NULL,
    CONSTRAINT id_user_fk FOREIGN KEY (user_id) REFERENCES main_user.user(id),
    preferred_payment_type_id INT NOT NULL,
    CONSTRAINT id_preferred_payment_fk FOREIGN KEY (preferred_payment_type_id) REFERENCES main_user.user(id)
);


CREATE TABLE main_user.passenger(
    id serial PRIMARY KEY NOT NULL,

    user_id INT NOT NULL,
    CONSTRAINT id_user_fk FOREIGN KEY (user_id) REFERENCES main_user.user(id),
    preferred_payment_type_id INT NOT NULL,
    CONSTRAINT id_preferred_payment_fk FOREIGN KEY (preferred_payment_type_id) REFERENCES main_user.user(id)
);

DROP TABLE main_drive.drive;
 CREATE TABLE main_drive.drive (
    id serial PRIMARY KEY NOT NULL,
    distance decimal NOT NULL,
    driver_id INT NOT NULL,
    CONSTRAINT id_driver_fk FOREIGN KEY (driver_id) REFERENCES main_user.driver(id),
    passenger_id INT NOT NULL,
    CONSTRAINT id_passenger_fk FOREIGN KEY (passenger_id) REFERENCES main_user.passenger(id),
    user_vehicle_id INT NOT NULL,
    CONSTRAINT id_user_vehicle_fk FOREIGN KEY (user_vehicle_id) REFERENCES main_vehicle.user_vehicle(id),
    payment_id INT NOT NULL,
    CONSTRAINT id_payment_fk FOREIGN KEY (payment_id) REFERENCES main_drive.payment(id),
    address_pickup_id INT NOT NULL,
    CONSTRAINT id_address_pickup_fk FOREIGN KEY (address_pickup_id) REFERENCES main_drive.address(id),
    address_destination_id INT NOT NULL,
    CONSTRAINT id_address_destination_fk FOREIGN KEY (address_destination_id) REFERENCES main_drive.address(id)
 );

CREATE TABLE main_vehicle.vehicle_type (
 id serial PRIMARY KEY NOT NULL,
 name varchar(100)
 );

 CREATE TABLE main_vehicle.vehicle_type1 (
 id serial PRIMARY KEY NOT NULL,
 name varchar(100)
 );


--ALTER TABLE main_user.driver
    --ADD COLUMN INT;
    --ADD COLUMN user_id INT REFERENCES main_user.user(id);

DROP TABLE main_drive.payment;

ALTER TABLE main_drive.payment
    --ADD COLUMN distance decimal NOT NULL,
    ADD COLUMN payment_type_id INT REFERENCES main_drive.payment_type(id);

ALTER TABLE main_vehicle.user_vehicle
    ADD COLUMN vehicle_id INT REFERENCES main_vehicle.vehicle(id),
    ADD COLUMN driver_id INT REFERENCES main_user.driver(id);

ALTER TABLE main_user.driver_rating
    ADD COLUMN driver_id INT REFERENCES main_user.driver(id),
    ADD COLUMN vehicle_id INT REFERENCES main_vehicle.vehicle(id);

ALTER TABLE main_drive.address
    ADD COLUMN area_id INT REFERENCES main_drive.area(id);




SELECT MAX(car_state) AS state
FROM main_user.driver_rating
WHERE car_state > 3
GROUP BY car_state
ORDER BY state DESC;







SELECT
    name,
    surname,
    phone_number
FROM main_user.user WHERE phone_number IN (SELECT phone_number FROM main_user.user WHERE phone_number LIKE '4%');

SELECT name
FROM main_vehicle.vehicle_type
LIMIT 10 OFFSET 30;

SELECT name
FROM main_vehicle.vehicle_type
UNION
SELECT surname FROM main_user.user;

SELECT name
FROM main_vehicle.vehicle_type
EXCEPT
SELECT name FROM main_vehicle.vehicle_type1;

SELECT name
FROM main_vehicle.vehicle_type
INTERSECT
SELECT name FROM main_vehicle.vehicle_type1;

SELECT * FROM main_vehicle.vehicle_type
FULL OUTER JOIN main_vehicle.vehicle_type1
ON main_vehicle.vehicle_type.name = main_vehicle.vehicle_type1.name;

SELECT * FROM main_vehicle.vehicle_type
INNER JOIN main_vehicle.vehicle_type1
ON main_vehicle.vehicle_type.name = main_vehicle.vehicle_type1.name;


SELECT * FROM main_vehicle.vehicle_type
LEFT JOIN main_vehicle.vehicle_type1
ON main_vehicle.vehicle_type.name = main_vehicle.vehicle_type1.name;

SELECT * FROM main_vehicle.vehicle_type
RIGHT JOIN main_vehicle.vehicle_type1
ON main_vehicle.vehicle_type.name = main_vehicle.vehicle_type1.name;

SELECT * FROM main_vehicle.vehicle_type
FULL OUTER JOIN main_vehicle.vehicle_type1
ON main_vehicle.vehicle_type.name = main_vehicle.vehicle_type1.name;







BEGIN TRANSACTION;

INSERT INTO
  main_vehicle.vehicle_type1 (id, name)
VALUES
  (41, 'SUV');





BEGIN TRANSACTION;



INSERT INTO
  main_vehicle.vehicle_type1 (id, name)
VALUES
  (42, 'Cargo');

COMMIT;





BEGIN TRANSACTION;

INSERT INTO
  main_vehicle.vehicle_type1 (id, name)
VALUES
  (43, 'Cargo');
ROLLBACK;

INSERT INTO
  main_vehicle.vehicle_type1 (id, name)
VALUES
  (44, 'Cargo');
ROLLBACK;




CREATE ROLE lele
LOGIN
PASSWORD 'foobar';

GRANT ALL PRIVILEGES ON DATABASE taxidb TO lele;

GRANT CREATE ON DATABASE taxidb TO lele;

GRANT SELECT ON ALL TABLES IN SCHEMA main_user TO lele;

GRANT SELECT, INSERT ON main_user.user TO lele;

GRANT SELECT (surname) ON main_user.user TO lele;

GRANT USAGE ON SCHEMA main_vehicle TO lele;

CREATE ROLE superlele
SUPERUSER
LOGIN
PASSWORD 'foobar123';

REVOKE SELECT, INSERT ON main_user.user FROM lele;



















CREATE VIEW blue_vehicles AS
    SELECT * FROM main_vehicle.user_vehicle
    WHERE user_vehicle.color = 'Blue';

CREATE INDEX plate_number ON main_vehicle.user_vehicle (plate_number);




CREATE PROCEDURE  add_is_black_column_to_vehicle()
LANGUAGE plpgsql
AS $$
BEGIN
  ALTER TABLE main_vehicle.user_vehicle ADD COLUMN is_black BOOL;
  UPDATE main_vehicle.user_vehicle SET is_black = true WHERE main_vehicle.user_vehicle.color = 'Black';
END;
$$;




CALL add_is_black_column_to_vehicle();

ALTER TABLE main_vehicle.user_vehicle
DROP COLUMN is_black;






CREATE OR REPLACE FUNCTION get_normal_size_payment(amount1 INTEGER, amount2 INTEGER)
RETURNS TABLE (id INTEGER, payment_type_id INTEGER)
LANGUAGE plpgsql
AS $$
BEGIN
    RETURN QUERY SELECT s.id::INTEGER, s.amount::INTEGER FROM main_drive.payment s
                 WHERE s.amount BETWEEN amount1 AND amount2;
END;
$$;

SELECT * FROM get_normal_size_payment(30, 75);





CREATE OR REPLACE FUNCTION check_payment() RETURNS trigger
LANGUAGE plpgsql
AS $$
BEGIN
  IF new.amount <= 0 THEN
    RAISE EXCEPTION 'Payment is to small';
    END IF;
  RETURN NEW;
  END;
$$;

CREATE TRIGGER check_payment_trigger
  BEFORE INSERT
  ON main_drive.payment
  FOR EACH
    ROW EXECUTE FUNCTION check_payment();


INSERT into main_drive.payment (id, amount, payment_type_id) VALUES (57, -1, 47);
