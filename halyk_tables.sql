DROP TABLE IF EXISTS History;
DROP TABLE IF EXISTS Products;
-- DROP DATABASE IF EXISTS HALYK;


CREATE DATABASE HALYK;

CREATE TABLE Products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);


CREATE TABLE History (
    id INT REFERENCES Products NOT NULL,
    amount INT NOT NULL,
    price INT NOT NULL,
    sell INT NOT NULL,
    left_amount INT NOT NULL ,
    change_date DATE NOT NULL,
    views INT NOT NULL
);




INSERT INTO Products (name) VALUES
('Iphone 14 Case'),
('Iphone 15 Case');



INSERT INTO History (id, amount, price, sell, left_amount, change_date, views) VALUES
(1, 50, 1000, 100, 0, '2023-09-22', 120),
(1, 100, 1000, 150, 0, '2023-09-23', 200),
(1, 5, 1000, 90, 0, '2023-09-24', 100),
(1, 15, 800, 90, 0, '2023-09-25', 120),
(1, 50, 800, 100, 0, '2023-09-26', 120),
(1, 100, 900, 150, 0, '2023-09-27', 200),
(1, 200, 800, 90, 0, '2023-09-28', 100),
(1, 15, 900, 50, 0, '2023-09-29', 120),
(1, 50, 700, 55, 0, '2023-09-30', 120),
(1, 5, 600, 40, 0, '2023-10-01', 150),
(1, 5, 500, 100, 0, '2023-10-02', 143),
(1, 25, 500, 200, 0, '2023-10-03', 342),
(1, 5, 600, 40, 0, '2023-10-04', 100),
(1, 5, 600, 40, 0, '2023-10-05', 168),
(1, 25, 600, 40, 0, '2023-10-06', 68),
(1, 37, 600, 40, 0, '2023-10-07', 150),
(1, 23, 600, 40, 0, '2023-10-08', 120),
(1, 33, 600, 40, 0, '2023-10-09', 170),
(1, 77, 600, 40, 0, '2023-10-10', 270),
(1, 12, 600, 40, 0, '2023-10-11', 89),
(1, 58, 600, 40, 0, '2023-10-12', 500),
(1, 12, 600, 40, 0, '2023-10-13', 230),
(1, 33, 600, 40, 0, '2023-10-14', 210),
(1, 5, 600, 30, 0, '2023-10-15', 50),
(1, 7, 600, 40, 0, '2023-10-16', 100),
(1, 39, 600, 10, 0, '2023-10-17', 20),
(1, 43, 500, 0, 0, '2023-10-18', 5),
(1, 4, 500, 3, 0, '2023-10-19', 10),
(1, 7, 500, 4, 0, '2023-10-20', 10),
(1, 12, 500, 7, 0, '2023-10-21', 15),
(1, 5, 500, 40, 0, '2023-10-22', 100),
(1, 5, 500, 45, 0, '2023-10-23', 100),
(1, 13, 500, 47, 0, '2023-10-24', 100),
(1, 50, 500, 40, 0, '2023-10-25', 123),
(1, 60, 500, 57, 0, '2023-10-26', 100),
(1, 66, 500, 23, 0, '2023-10-27', 200),
(1, 43, 500, 12, 0, '2023-10-28', 300),
(1, 53, 500, 50, 0, '2023-10-29', 135),
(1, 5, 500, 60, 0, '2023-10-30', 127),
(1, 5, 500, 48, 0, '2023-10-31', 200),
(1, 50, 500, 50, 0, '2023-11-01', 150),
(1, 40, 500, 48, 0, '2023-11-02', 200),
(1, 35, 500, 48, 0, '2023-11-03', 175),
(1, 33, 500, 47, 0, '2023-11-04', 200),
(1, 37, 500, 33, 0, '2023-11-05', 130),
(1, 22, 500, 12, 0, '2023-11-06', 215),
(1, 2, 500, 4, 0, '2023-11-07', 200),
(1, 14, 500, 48, 0, '2023-11-08', 203),
(1, 0, 500, 50, 0, '2023-11-09', 200),
(1, 12, 500, 43, 0, '2023-11-10', 200),
(1, 5, 500, 4, 0, '2023-11-11', 50);

INSERT INTO History (id, amount, price, sell, left_amount, change_date, views) VALUES
(2, 0, 5000, 760, 0, '2023-09-22', 1000),
(2, 100, 5000, 1500, 0, '2023-09-23', 2000),
(2, 50, 5000, 900, 0, '2023-09-24', 3000),
(2, 150, 5000, 900, 0, '2023-09-25', 1200),
(2, 500, 5000, 1000, 0, '2023-09-26', 1500),
(2, 100, 5000, 1500, 0, '2023-09-27', 2000),
(2, 200, 5000, 900, 0, '2023-09-28', 2000),
(2, 150, 5000, 500, 0, '2023-09-29', 1200),
(2, 500, 5000, 550, 0, '2023-09-30', 1500),
(2, 50, 5000, 400, 0, '2023-10-01', 1500),
(2, 50, 5000, 563, 0, '2023-10-02', 1430),
(2, 250, 5000, 212, 0, '2023-10-03', 3420),
(2, 50, 5000, 400, 0, '2023-10-04', 1000),
(2, 50, 4000, 400, 0, '2023-10-05', 1680),
(2, 250, 4500, 400, 0, '2023-10-06', 680),
(2, 370, 4000, 400, 0, '2023-10-07', 1500),
(2, 230, 3000, 400, 0, '2023-10-08', 1200),
(2, 330, 3000, 400, 0, '2023-10-09', 1700),
(2, 770, 3000, 400, 0, '2023-10-10', 2700),
(2, 120, 2700, 400, 0, '2023-10-11', 890),
(2, 580, 2500, 400, 0, '2023-10-12', 1370),
(2, 120, 2300, 400, 0, '2023-10-13', 1230),
(2, 330, 2000, 400, 0, '2023-10-14', 2100),
(2, 50, 2000, 300, 0, '2023-10-15', 500),
(2, 70, 2000, 400, 0, '2023-10-16', 1000),
(2, 390, 2000, 100, 0, '2023-10-17', 200),
(2, 43, 2000, 0, 0, '2023-10-18', 500),
(2, 4, 2000, 300, 0, '2023-10-19', 730),
(2, 70, 2000, 434, 0, '2023-10-20', 700),
(2, 120, 2000, 70, 0, '2023-10-21', 150),
(2, 50, 2000, 40, 0, '2023-10-22', 100),
(2, 50, 2000, 45, 0, '2023-10-23', 200),
(2, 130, 2000, 47, 0, '2023-10-24', 200),
(2, 500, 2000, 40, 0, '2023-10-25', 123),
(2, 60, 2000, 57, 0, '2023-10-26', 100),
(2, 660, 2000, 23, 0, '2023-10-27', 200),
(2, 0, 2000, 120, 0, '2023-10-28', 120),
(2, 53, 1500, 50, 0, '2023-10-29', 135),
(2, 50, 1500, 60, 0, '2023-10-30', 127),
(2, 5, 1500, 48, 0, '2023-10-31', 200),
(2, 50, 1500, 50, 0, '2023-11-01', 150),
(2, 40, 1500, 48, 0, '2023-11-02', 200),
(2, 35, 1500, 48, 0, '2023-11-03', 175),
(2, 33, 1500, 47, 0, '2023-11-04', 200),
(2, 37, 1500, 33, 0, '2023-11-05', 130),
(2, 22, 1500, 12, 0, '2023-11-06', 215),
(2, 20, 1500, 4, 0, '2023-11-07', 200),
(2, 14, 1500, 48, 0, '2023-11-08', 203),
(2, 0, 1500, 50, 0, '2023-11-09', 200),
(2, 12, 1500, 43, 0, '2023-11-10', 200),
(2, 5, 1500, 4, 0, '2023-11-11', 500);

SELECT * FROM History;

SELECT * FROM Products;

-- SELECT id FROM Products WHERE name = 'Laptop';

SELECT * FROM History WHERE id = 2 AND change_date BETWEEN '2023-10-05' AND '2023-10-25' ORDER BY change_date ASC;

SELECT name FROM Products;


-- INSERT INTO History (id, amount, price, sell, left_amount, change_date, views) VALUES
-- (1, 100, 253, 50, 50, '2023-11-11', 14),
-- (2, 120, 153, 60, 60, '2023-11-10', 22),
-- (3, 80, 303, 40, 40, '2023-11-09', 18),
-- (4, 140, 203, 70, 70, '2023-11-08', 37),
-- (5, 60, 253, 30, 30, '2023-11-07', 6),
-- (6, 90, 303, 45, 45, '2023-11-06', 11),
-- (7, 110, 153, 55, 55, '2023-11-05', 45),
-- (8, 70, 203, 35, 35, '2023-11-04', 28),
-- (9, 130, 253, 65, 65, '2023-11-03', 31),
-- (10, 50, 303, 25, 25, '2023-11-02', 19),
-- (11, 80, 153, 40, 40, '2023-11-01', 24),
-- (12, 100, 203, 50, 50, '2023-10-31', 33),
-- (13, 60, 253, 30, 30, '2023-10-30', 10),
-- (14, 90, 303, 45, 45, '2023-10-29', 26),
-- (15, 110, 153, 55, 55, '2023-10-28', 42),
-- (16, 70, 203, 35, 35, '2023-10-27', 17),
-- (17, 130, 253, 65, 65, '2023-10-26', 39),
-- (18, 50, 303, 25, 25, '2023-10-25', 15),
-- (19, 80, 153, 40, 40, '2023-10-24', 21),
-- (20, 100, 203, 50, 50, '2023-10-23', 35),
-- (21, 60, 253, 30, 30, '2023-10-22', 7),
-- (22, 90, 303, 45, 45, '2023-10-21', 12),
-- (23, 110, 153, 55, 55, '2023-10-20', 48),
-- (24, 70, 203, 35, 35, '2023-10-19', 16),
-- (25, 130, 253, 65, 65, '2023-10-18', 36),



-- INSERT INTO Products (name) VALUES
-- ('Apple'),
-- ('Banana'),
-- ('Orange'),
-- ('Grape'),
-- ('Strawberry'),
-- ('Mango'),
-- ('Pineapple'),
-- ('Watermelon'),
-- ('Cantaloupe'),
-- ('Honeydew'),
-- ('Peach'),
-- ('Pear'),
-- ('Plum'),
-- ('Cherry'),
-- ('Kiwi'),
-- ('Laptop'),
-- ('Smartphone'),
-- ('Tablet'),
-- ('Desktop Computer'),
-- ('Smartwatch'),
-- ('Wireless Earbuds'),
-- ('Smart Speaker'),
-- ('Virtual Reality Headset'),
-- ('Gaming Console'),
-- ('Smart Home Device'),
-- ('Kitchen Appliance'),
-- ('Wearable Fitness Tracker'),
-- ('Electric Vehicle'),
-- ('Drone'),
-- ('Camera');
--
-- -- Insert some history records into the History table
-- INSERT INTO History (id, amount, price, sell, left_amount, change_date, views) VALUES
-- (1, 10, 500, 200, 300, '2023-11-11', 100),
-- (1, 5, 450, 150, 300, '2023-10-11', 200),
-- (1, 2, 400, 100, 200, '2023-09-11', 300),
-- (2, 15, 800, 300, 500, '2023-11-11', 250),
-- (2, 8, 750, 250, 500, '2023-10-11', 350),
-- (2, 4, 700, 200, 500, '2023-09-11', 450),
-- (3, 12, 600, 200, 400, '2023-11-11', 300),
-- (3, 6, 550, 150, 400, '2023-10-11', 400),
-- (3, 3, 500, 100, 400, '2023-09-11', 500),
-- (4, 20, 1000, 300, 700, '2023-11-11', 350),
-- (4, 10, 950, 250, 700, '2023-10-11', 450),
-- (4, 5, 900, 200, 700, '2023-09-11', 550),
-- (5, 7, 250, 70, 180, '2023-11-11', 400),
-- (5, 4, 220, 60, 160, '2023-10-11', 500),
-- (5, 2, 190, 50, 140, '2023-09-11', 600),
-- (6, 18, 120, 30, 90, '2023-11-11', 450),
-- (6, 10, 110, 25, 85, '2023-10-11', 550),
-- (6, 6, 100, 20, 80, '2023-09-11', 650),
-- (7, 14, 150, 40, 110, '2023-11-11', 500),
-- (7, 8, 140, 36, 104, '2023-10-11', 600),
-- (7, 4, 130, 32, 98, '2023-09-11', 700),
-- (8, 30, 400, 100, 300, '2023-11-11', 550),
-- (9, 130, 253, 65, 65, '2023-11-03', 31),
-- (10, 50, 303, 25, 25, '2023-11-02', 19),
-- (11, 80, 153, 40, 40, '2023-11-01', 24),
-- (12, 100, 203, 50, 50, '2023-10-31', 33),
-- (13, 60, 253, 30, 30, '2023-10-30', 10),
-- (14, 90, 303, 45, 45, '2023-10-29', 26),
-- (15, 110, 153, 55, 55, '2023-10-28', 42),
-- (16, 70, 203, 35, 35, '2023-10-27', 17),
-- (17, 130, 253, 65, 65, '2023-10-26', 39),
-- (18, 50, 303, 25, 25, '2023-10-25', 15),
-- (19, 80, 153, 40, 40, '2023-10-24', 21),
-- (20, 100, 203, 50, 50, '2023-10-23', 35),
-- (21, 60, 253, 30, 30, '2023-10-22', 7),
-- (22, 90, 303, 45, 45, '2023-10-21', 12),
-- (23, 110, 153, 55, 55, '2023-10-20', 48),
-- (24, 70, 203, 35, 35, '2023-10-19', 16),
-- (25, 130, 253, 65, 65, '2023-10-18', 36);