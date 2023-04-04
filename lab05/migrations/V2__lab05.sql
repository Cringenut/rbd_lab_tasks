DELETE from main_user.user; #DONT ACTIVATE YET

DROP TABLE main_user.passenger;
CREATE TABLE main_user.passenger(
    id serial PRIMARY KEY NOT NULL,

    user_id INT NOT NULL,
    CONSTRAINT id_user_fk FOREIGN KEY (user_id) REFERENCES main_user.user(id),
    preferred_payment_type_id INT NOT NULL,
    CONSTRAINT id_preferred_payment_fk FOREIGN KEY (preferred_payment_type_id) REFERENCES main_user.user(id)
);

ALTER TABLE main_vehicle.vehicle
    ADD COLUMN vehicle_type_id INT NOT NULL,
    ADD CONSTRAINT id_vehicle_type_fk
    FOREIGN KEY (vehicle_type_id) REFERENCES main_vehicle.vehicle_type(id);

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

ALTER TABLE main_user.driver
    ADD COLUMN user_id INT NOT NULL REFERENCES main_user.user(id);

ALTER TABLE main_drive.payment
    ADD COLUMN payment_type_id INT NOT NULL REFERENCES main_drive.payment_type(id);


