                           --ОСНОВНОЕ ЗАДАНИЕ--

/*1.Найдите общее количество индивидуально обучающихся студентов для каждого уровня.*/

SELECT COUNT (*)
FROM student
WHERE education_form = 'personal';

/*2.Найдите общее количество учащихся школы с уровнем Advanced для каждой формы 
обучения.*/

SELECT level, education_form, COUNT (*)
FROM student
WHERE level = 'Advanced'
GROUP BY level, education_form;

/*3.Найдите общее количество учащихся школы в разрезе уровня и формы обучения, 
отсортированных по уровню в порядке возрастания и по форме обучения в порядке 
убывания.*/

SELECT level,education_form, COUNT (*)
FROM student
GROUP BY level, education_form
ORDER BY level, education_form DESC;

/*4.Найдите максимальное и минимальное id группы (одним запросом)*/

SELECT MIN (group_id), MAX (group_id)
FROM group_student;

/*5.Найдите количество учеников и id группы, в которой наибольшее количество учеников.*/

SELECT group_id, COUNT (*)
FROM group_student
GROUP BY group_id
ORDER BY COUNT DESC
LIMIT 1;
                               --ДОПОЛНИТЕЛЬНОЕ ЗАДАНИЕ--

/*Создать и заполнить таблицу customers*/

CREATE TABLE customers (
customer_id INTEGER,
customer_nm varchar (255)
);

INSERT INTO customers (customer_id, customer_nm)
VALUES 
(1, 'Oliver '),
(2, 'Rose'),
(3, 'Jacob '),
(4, 'Katy'),
(5, 'Oscar ');

/*Создать и заполнить таблицу sales*/

CREATE TABLE sales (
sale_id INTEGER,
store_id INTEGER,
customer_id INTEGER,
dt DATE,
amt numeric(10,2)
);

INSERT INTO sales (sale_id, store_id, customer_id, dt, amt)
VALUES 
(1, 1, 1, '2023-06-12', 950.99),
(2, 2, 2, '2023-06-17', 102.99),
(3, 3, 3, '2023-06-17', 1050.99),
(4, 4, 4, '2023-06-21', 2150.99),
(5, 5, 5, '2023-06-30', 5450.99),
(6, 1, 1, '2023-07-01', 100.99),
(7, 3, 2, '2023-07-01', 50.99),
(8, 3, 6, '2023-07-04', 3450.99),
(9, 4, 1, '2023-07-05', 1000.99),
(10, 5, 2, '2023-07-07', 250.99);

/*1.Выведите максимальную сумму покупки*/

SELECT  MAX (amt)
FROM sales;

/*2.Выведите минимальную дату покупки*/

SELECT  MIN (dt)
FROM sales;

/*3.Выведите среднюю сумму покупок для customer_id = 1*/

SELECT  AVG (amt)
FROM sales
WHERE customer_id = 1;

/*4.Выведите минимальную и максимальную сумму покупки, совершенную в магазине 
с store_id = 3 или покупателем с  customer_id = 2*/

SELECT MIN (amt), MAX (amt)
FROM sales
WHERE store_id = 3 OR customer_id = 2;

/*5.Выведите количество уникальных имен покупателей*/

SELECT COUNT (DISTINCT customer_nm )
FROM customers;
