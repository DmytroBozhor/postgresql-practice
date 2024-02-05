CREATE DATABASE company_repository;

CREATE SCHEMA company_storage;

CREATE TABLE "company"
(
    id   BIGSERIAL,
    name VARCHAR(128),
    date DATE,
    PRIMARY KEY (id),
    UNIQUE (name, date)
);

INSERT INTO company (name, date)
VALUES ('Google', '2024-02-01'),
       ('Apple', '2017-02-15'),
       ('Apple', '2015-02-15'),
       ('Facebook', '2015-03-27');

DROP TABLE company;

SELECT DISTINCT *
FROM company
ORDER BY name, date DESC
LIMIT 2 OFFSET 2;

SELECT *
FROM company
WHERE date BETWEEN '2020-01-01' and '2025-01-01'
UNION
SELECT *
FROM company
WHERE length(name) = 5
ORDER BY id;

SELECT *
FROM company;

DELETE
FROM company
WHERE id = 3;
