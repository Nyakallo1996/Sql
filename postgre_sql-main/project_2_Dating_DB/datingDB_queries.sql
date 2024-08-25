-- This script was generated by the ERD tool in pgAdmin 4.
-- Please log an issue at https://github.com/pgadmin-org/pgadmin4/issues/new/choose if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.profession
(
    prof_id bigserial NOT NULL,
    profession character varying(50) NOT NULL,
    PRIMARY KEY (prof_id),
    UNIQUE (prof_id)
        INCLUDE(prof_id)
);

CREATE TABLE IF NOT EXISTS public.zip_code
(
    zip_code character varying(4) NOT NULL,
    city character varying(50) NOT NULL,
    province character varying(50) NOT NULL,
	CHECK (zip_code ~ '^\d{4}$'),
    PRIMARY KEY (zip_code)
);

CREATE TABLE IF NOT EXISTS public.status
(
    status_id bigserial NOT NULL,
    status text,
    PRIMARY KEY (status_id)
);

CREATE TABLE IF NOT EXISTS public.my_contacts
(
    contact_id bigserial NOT NULL,
    last_name character varying(50) NOT NULL,
    first_name character varying(30) NOT NULL,
    phone integer,
    email character varying(60) NOT NULL,
    gender character(2) NOT NULL,
    birthday date NOT NULL,
    prof_id bigserial NOT NULL,
    zip_code character varying(4) NOT NULL,
    status_id bigserial,
    PRIMARY KEY (contact_id)
);

CREATE TABLE IF NOT EXISTS public.interests
(
    interest_id bigserial NOT NULL,
    interest character varying(50) NOT NULL,
    PRIMARY KEY (interest_id)
);

CREATE TABLE IF NOT EXISTS public.seeking
(
    seeking_id bigserial NOT NULL,
    seeking character varying(50) NOT NULL,
    PRIMARY KEY (seeking_id)
);

CREATE TABLE IF NOT EXISTS public.contact_interest
(
    contact_id bigserial NOT NULL,
    interest_id bigserial NOT NULL,
    PRIMARY KEY (contact_id, interest_id)
);

CREATE TABLE IF NOT EXISTS public.contacts_seeking
(
    contact_id bigserial NOT NULL,
    seeking_id bigserial NOT NULL,
    PRIMARY KEY (contact_id, seeking_id)
);

ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (prof_id)
    REFERENCES public.profession (prof_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (zip_code)
    REFERENCES public.zip_code (zip_code) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.my_contacts
    ADD FOREIGN KEY (status_id)
    REFERENCES public.status (status_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interest
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contact_interest
    ADD FOREIGN KEY (interest_id)
    REFERENCES public.interests (interest_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contacts_seeking
    ADD FOREIGN KEY (contact_id)
    REFERENCES public.my_contacts (contact_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.contacts_seeking
    ADD FOREIGN KEY (seeking_id)
    REFERENCES public.seeking (seeking_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

INSERT INTO zip_code (zip_code, province, city) VALUES
('0001', 'Gauteng', 'Johannesburg'),
('0002', 'Gauteng', 'Pretoria'),
('1001', 'Western Cape', 'Cape Town'),
('1002', 'Western Cape', 'Stellenbosch'),
('2001', 'KwaZulu-Natal', 'Durban'),
('2002', 'KwaZulu-Natal', 'Pietermaritzburg'),
('3001', 'Eastern Cape', 'Port Elizabeth'),
('3002', 'Eastern Cape', 'East London'),
('4001', 'Free State', 'Bloemfontein'),
('4002', 'Free State', 'Welkom'),
('5001', 'Limpopo', 'Polokwane'),
('5002', 'Limpopo', 'Thohoyandou'),
('6001', 'Mpumalanga', 'Nelspruit'),
('6002', 'Mpumalanga', 'Witbank'),
('7001', 'North West', 'Mahikeng'),
('7002', 'North West', 'Rustenburg'),
('8001', 'Northern Cape', 'Kimberley'),
('8002', 'Northern Cape', 'Upington'),
('9001', 'North West', 'Mafikeng'),
('9002', 'North West', 'Potchefstroom');

-- Insert professions
INSERT INTO profession (profession) VALUES
('Software Developer'), ('Teacher'), ('Doctor'), ('Nurse');

-- Insert status
INSERT INTO status (status) VALUES
('Single'), ('Married'), ('Divorced');

-- Insert interests
INSERT INTO interests (interest) VALUES
('Music'), ('Sports'), ('Reading'), ('Traveling'), ('Cooking'), ('Photography');

-- Insert contacts
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id) VALUES
('Smith', 'John', 1234567, 'john.smith@example.com', 'M', '1985-02-20', 1, '0001', 1),
('Doe', 'Jane', 23456789, 'jane.doe@example.com', 'F', '1990-03-15', 2, '0002', 2),
('Brown', 'Michael', 34567890, 'michael.brown@example.com', 'M', '1982-04-10', 3, '1001', 1),
('Taylor', 'Jessica', 4567890, 'jessica.taylor@example.com', 'F', '1995-05-25', 4, '1002', 3),
('Johnson', 'Emily', 56789012, 'emily.johnson@example.com', 'F', '1987-06-30', 1, '2001', 2),
('Williams', 'Daniel', 6789012, 'daniel.williams@example.com', 'M', '1984-07-14', 2, '2002', 1),
('Jones', 'Sophia', 7890123, 'sophia.jones@example.com', 'F', '1992-08-18', 3, '3001', 3),
('Miller', 'James', 8901234, 'james.miller@example.com', 'M', '1988-09-22', 4, '3002', 2),
('Davis', 'Olivia', 9012345, 'olivia.davis@example.com', 'F', '1991-10-03', 1, '4001', 1),
('Garcia', 'Liam', 1234509, 'liam.garcia@example.com', 'M', '1983-11-07', 2, '4002', 3),
('Martinez', 'Isabella', 2345610, 'isabella.martinez@example.com', 'F', '1994-12-12', 3, '5001', 2),
('Rodriguez', 'Lucas', 3456721, 'lucas.rodriguez@example.com', 'M', '1986-01-01', 4, '5002', 1),
('Martinez', 'Ella', 4567832, 'ella.martinez@example.com', 'F', '1993-02-17', 1, '6001', 3),
('Hernandez', 'Alexander', 5678943, 'alexander.hernandez@example.com', 'M', '1989-03-22', 2, '6002', 2),
('Lopez', 'Mia', 6789054, 'mia.lopez@example.com', 'F', '1996-04-26', 3, '7001', 1),
('Gonzalez', 'Mason', 7890165, 'mason.gonzalez@example.com', 'M', '1981-05-31', 4, '7002', 2);


To populate the my_contacts table with more than 15 contacts and assign each contact more than two interests, you can follow these steps:

1. Insert Contacts into my_contacts Table
You need to insert at least 15 contacts into the my_contacts table, making sure to reference the appropriate prof_id, zip_code, and status_id.

2. Assign Interests to Each Contact
For each contact, you'll assign more than two interests by inserting records into the contact_interest table.

SQL Script Example
Here's an example script that populates the my_contacts table with 16 contacts and assigns more than two interests to each contact:

sql
Copy code
-- Insert professions
INSERT INTO profession (profession) VALUES
('Software Developer'), ('Teacher'), ('Doctor'), ('Nurse');

-- Insert status
INSERT INTO status (status) VALUES
('Single'), ('Married'), ('Divorced');

-- Insert interests
INSERT INTO interests (interest) VALUES
('Music'), ('Sports'), ('Reading'), ('Traveling'), ('Cooking'), ('Photography');

-- Insert contacts
INSERT INTO my_contacts (last_name, first_name, phone, email, gender, birthday, prof_id, zip_code, status_id) VALUES
('Smith', 'John', 1234567890, 'john.smith@example.com', 'M', '1985-02-20', 1, '0001', 1),
('Doe', 'Jane', 2345678901, 'jane.doe@example.com', 'F', '1990-03-15', 2, '0002', 2),
('Brown', 'Michael', 3456789012, 'michael.brown@example.com', 'M', '1982-04-10', 3, '1001', 1),
('Taylor', 'Jessica', 4567890123, 'jessica.taylor@example.com', 'F', '1995-05-25', 4, '1002', 3),
('Johnson', 'Emily', 5678901234, 'emily.johnson@example.com', 'F', '1987-06-30', 1, '2001', 2),
('Williams', 'Daniel', 6789012345, 'daniel.williams@example.com', 'M', '1984-07-14', 2, '2002', 1),
('Jones', 'Sophia', 7890123456, 'sophia.jones@example.com', 'F', '1992-08-18', 3, '3001', 3),
('Miller', 'James', 8901234567, 'james.miller@example.com', 'M', '1988-09-22', 4, '3002', 2),
('Davis', 'Olivia', 9012345678, 'olivia.davis@example.com', 'F', '1991-10-03', 1, '4001', 1),
('Garcia', 'Liam', 1234509876, 'liam.garcia@example.com', 'M', '1983-11-07', 2, '4002', 3),
('Martinez', 'Isabella', 2345610987, 'isabella.martinez@example.com', 'F', '1994-12-12', 3, '5001', 2),
('Rodriguez', 'Lucas', 3456721098, 'lucas.rodriguez@example.com', 'M', '1986-01-01', 4, '5002', 1),
('Martinez', 'Ella', 4567832109, 'ella.martinez@example.com', 'F', '1993-02-17', 1, '6001', 3),
('Hernandez', 'Alexander', 5678943210, 'alexander.hernandez@example.com', 'M', '1989-03-22', 2, '6002', 2),
('Lopez', 'Mia', 6789054321, 'mia.lopez@example.com', 'F', '1996-04-26', 3, '7001', 1),
('Gonzalez', 'Mason', 7890165432, 'mason.gonzalez@example.com', 'M', '1981-05-31', 4, '7002', 2);



-- Assigning interests to contact 1
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(1, 1), 
(1, 2),  
(1, 3);  

-- Assigning interests to contact 2
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(2, 1), 
(2, 4), 
(2, 5); 

-- Assigning interests to contact 3
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(3, 2), 
(3, 3),
(3, 6);  

-- Continue for other contacts...

-- Assigning interests to contact 4
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(4, 1), (4, 2), (4, 3);

-- Assigning interests to contact 5
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(5, 1), (5, 4), (5, 5);

-- Assigning interests to contact 6
INSERT INTO contact_interest (contact_id, interest_id) VALUES
(6, 2), (6, 3), (6, 6);

-- Continue similarly for contacts 7 through 15...

-- Ensure each contact gets more than two interests

-- left join
SELECT 
    profession.profession, 
    zip_code.zip_code, 
    zip_code.city, 
    zip_code.province, 
    status.status, 
    interests.interest, 
    seeking.seeking
FROM my_contacts
LEFT JOIN profession ON my_contacts.prof_id = profession.prof_id
LEFT JOIN zip_code ON my_contacts.zip_code = zip_code.zip_code
LEFT JOIN status ON my_contacts.status_id = status.status_id
LEFT JOIN contact_interest ON my_contacts.contact_id = contact_interest.contact_id
LEFT JOIN interests ON contact_interest.interest_id = interests.interest_id
LEFT JOIN contacts_seeking ON my_contacts.contact_id = contacts_seeking.contact_id
LEFT JOIN seeking ON contacts_seeking.seeking_id = seeking.seeking_id;



END;