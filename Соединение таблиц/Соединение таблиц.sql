/*1.Найдите учеников и все группы, в которых преподает учитель с 
почтой blanda.jamil@yahoo.com */

SELECT g.user_id,
g.group_id
FROM group_student AS g
JOIN teacher AS t
ON g.group_id = t.group_id
WHERE t.email = 'blanda.jamil@yahoo.com';

/*2.Выведите уровень ученика с почтой gpagac@jacobs.com */

SELECT s.level
FROM student AS s
JOIN users AS u
ON s.user_id = u.user_id
WHERE u.user_email = 'gpagac@jacobs.com';

/*3.Выведите уникальные названия предметов, которые изучает
ученик c user_id=11300 (таблицы users и subject).*/

SELECT DISTINCT s.subject_title
FROM subject AS s
JOIN users AS u
ON s.subject_id = u.subject_id
WHERE u.user_id = 11300;

/*4.Выведите уникальные уровни учеников, которые занимаются в группе с id = 10.*/

SELECT DISTINCT s.level
FROM student AS s
JOIN group_student AS g
ON s.user_id = g.user_id
WHERE g.group_id = 10;

                                       /*Дополнительное задание*/
									   
/*Cоздать и заполнить таблицу "positions".*/	

CREATE TABLE positions (
id_check INTEGER,
id_pos INTEGER,
art VARCHAR(3),
quantity INTEGER
);

INSERT INTO positions (id_check, id_pos, art, quantity)
VALUES 
(1, 1, 'A1', 1),
(1, 2, 'A4', 3),
(1, 3, 'A2', 2),
(1, 4, 'A10', 1),
(1, 5, 'A8', 4),
(2, 1, 'A5', 1),
(2, 2, 'A7', 1),
(2, 3, 'A3', 2),
(3, 1, 'A2', 1),
(3, 2, 'A9', 1),
(3, 3, 'A5', 2),
(3, 4, 'A6', 1),
(3, 5, 'A3', 3),
(4, 1, 'A1', 3),
(4, 2, 'A2', 1),
(5, 1, 'A2', 1),
(5, 2, 'A8', 5),
(5, 3, 'A3', 1),
(5, 4, 'A4', 1),
(5, 5, 'A5', 1);

/*Cоздать и заполнить таблицу "products".*/

CREATE TABLE products (
art VARCHAR(3),
product TEXT,
category TEXT
);

INSERT INTO products (art, product, category)
VALUES 
('A1', 'кроссовки', 'обувь'),
('A2', 'кеды', 'обувь'),
('A3', 'сланцы', 'обувь'),
('A4', 'куртка', 'одежда'),
('A5', 'ветровка', 'одежда'),
('A6', 'шорты', 'одежда'),
('A7', 'палатка', 'туризм'),
('A8', 'коврик', 'туризм'),
('A9', 'спальник', 'туризм'),
('A10', 'рюкзак', 'туризм'),
('A11', 'туфли', 'обувь'),
('A12', 'солнечные очки', 'аксессуары');


/*1.Выведите названия уникальных категорий, которые были куплены в чеке с id = 3.*/

SELECT DISTINCT pr.category
FROM products AS pr
JOIN positions AS p
ON pr.art = p.art
WHERE p.id_check = 3;

/*2.Выведите артикулы продуктов, которые не покупали
(т. е. они не встречаются ни в одном чеке).*/

SELECT pr.art
FROM products AS pr
LEFT OUTER JOIN positions AS p
ON pr.art = p.art
WHERE p.id_check IS NULL

/*3.Посчитайте количество чеков, в которых куплено больше двух пар одинаковой обуви.*/

SELECT COUNT (DISTINCT p.id_check) AS kol_vo_checkov
FROM products AS pr
JOIN positions AS p
ON pr.art = p.art
WHERE pr.category = 'обувь' AND p.quantity > 2;

/*4.Посчитайте количество чеков, в которых куплено больше двух позиций любой одежды.*/
 
SELECT COUNT (*)
FROM(SELECT p.id_check
FROM products AS pr
JOIN positions AS p
ON pr.art = p.art
WHERE pr.category = 'одежда'
GROUP BY p.id_check
HAVING SUM(p.quantity)>2) AS t;

