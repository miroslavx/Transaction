

-- Создаём таблицу и вставляем данные
CREATE TABLE developers (
    ID INT PRIMARY KEY,
    NAME VARCHAR(50),
    SPECIALTY VARCHAR(20),
    EXPERIENCE INT,
    SALARY INT
);
-- Отключаем автокоммит
SET autocommit = 0;

INSERT INTO developers (ID, NAME, SPECIALTY, EXPERIENCE, SALARY) VALUES
(1, 'Eugene Suleimanov', 'Java', 2, 2500),
(2, 'Peter Romanenko', 'Java', 3, 3500),
(3, 'Andrei Komarov', 'C++', 3, 2500),
(4, 'Konstantin Geiko', 'C#', 2, 2000),
(5, 'Asya Suleimanova', 'UI/UX', 2, 1800),
(6, 'Ludmila Geiko', 'UI/UX', 2, 1800),
(7, 'Ivan Ivanov', 'C#', 1, 900);
SELECT * FROM developers ;

-- Удаляем C++ разработчиков и коммитим
DELETE FROM developers WHERE SPECIALTY = 'C++';
COMMIT;
SELECT * FROM developers;
ROLLBACK;
SELECT * FROM developers;

-- Работа с SAVEPOINT
SAVEPOINT SP1;

DELETE FROM developers WHERE ID = 7;
DELETE FROM developers WHERE ID = 6;
DELETE FROM developers WHERE ID = 5;
SELECT * FROM developers ORDER BY ID;
ROLLBACK TO SP1;
SELECT * FROM developers ORDER BY ID;
RELEASE SAVEPOINT SP1;
COMMIT;
SELECT * FROM developers ORDER BY ID;
-- Эти команды устанавливают режим для СЛЕДУЮЩИХ транзакций в текущей сессии.
SET SESSION TRANSACTION READ ONLY;
SET SESSION TRANSACTION READ WRITE;



Этот скрипт выполняет те же логические шаги, но вывод будет состоять в основном из результатов SELECT * FROM developers в ключевых точках, без дополнительных текстовых сообщений от сервера.
