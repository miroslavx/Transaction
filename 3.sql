-- Убедимся, что находимся в чистом состоянии
DROP TABLE IF EXISTS person1;

-- Создаем таблицу
CREATE TABLE person1 (
    ID INT NOT NULL PRIMARY KEY,
    NAME VARCHAR(50) NOT NULL
);

-- Вставляем начальные данные
INSERT INTO person1 VALUES (101, 'Akash');
INSERT INTO person1 VALUES (102, 'Samir');
SELECT * FROM person1;

-- Демонстрация ROLLBACK внутри явной транзакции
START TRANSACTION;
INSERT INTO person1 VALUES (103, 'Hasan');
SELECT * FROM person1;
ROLLBACK;
SELECT * FROM person1;

-- Демонстрация COMMIT внутри явной транзакции
START TRANSACTION;
INSERT INTO person1 VALUES (103, 'Hasan');
SELECT * FROM person1;
COMMIT;
SELECT * FROM person1;

-- Изолированный ROLLBACK (не повлияет на зафиксированные данные)
ROLLBACK;
SELECT * FROM person1;

-- Обновление и откат
START TRANSACTION;
UPDATE person1 SET name = 'Sima' WHERE id = 103;
SELECT * FROM person1;
ROLLBACK;
SELECT * FROM person1;

-- Демонстрация SAVEPOINT
START TRANSACTION;
DELETE FROM person1 WHERE id = 103;
SELECT * FROM person1;

SAVEPOINT sav1;

INSERT INTO person1 VALUES (105, 'Hasan');
INSERT INTO person1 VALUES (106, 'Hasan');
INSERT INTO person1 VALUES (107, 'Hasan');
SELECT * FROM person1;

SAVEPOINT sav2;

ROLLBACK TO SAVEPOINT sav1;
SELECT * FROM person1;

COMMIT;
SELECT * FROM person1;
