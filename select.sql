SELECT *
FROM "users";
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users";
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "isMale" = false;
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "id" %5 = 0
  AND "isMale" = false;
--дістати усіх чоловіків з непарними id
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "id" %2 = 1
  AND "isMale" = true;
--дістати усіх з іменем Don
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "firstName" = 'Don';
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "firstName" IN ('Don', 'Mary', 'Alex', 'Sara');
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "id" >= 300
  AND "id" < 305;
SELECT "id",
  "firstName",
  "lastName",
  "isMale"
FROM "users"
WHERE "id" BETWEEN SYMMETRIC 307 AND 305;
--виберіть усіх чоловіків зі зростом в діапазоні від 1.80 до 1.95
-- не включаючи межі
-- включаючи межі
SELECT "id",
  "firstName",
  "lastName",
  "isMale",
  "height"
FROM "users"
WHERE (
    "height" >= 1.80
    AND "height" <= 1.95
  )
  AND "isMale" = TRUE;
SELECT "id",
  "firstName",
  "isMale",
  "birthday",
  age("birthday"),
  extract(
    "years"
    FROM age("birthday")
  ) AS "age",
  extract(
    "years"
    FROM "birthday"
  ) AS "year of bday"
FROM "users";
--витягти усіх молодше 28 років
SELECT "id",
  "firstName",
  "lastName",
  "isMale",
  extract(
    "years"
    FROM age("birthday")
  ) AS "age",
  extract(
    "years"
    FROM "birthday"
  ) AS "age of bday"
FROM "users"
WHERE extract(
    "years"
    FROM age("birthday")
  ) < 28;
SELECT "id",
  "firstName",
  "lastName",
  "isMale",
  extract(
    "years"
    FROM age("birthday")
  ) AS "age",
  extract(
    "years"
    FROM "birthday"
  ) AS "age of bday"
FROM "users"
WHERE age("birthday") < make_interval(28);
--витягти усіх жінок від 25 до 29 включно
SELECT "id",
  "firstName",
  "birthday",
  "isMale",
  extract(
    "years"
    FROM age("birthday")
  ) AS "age"
FROM "users"
WHERE age("birthday") BETWEEN make_interval(25) AND make_interval(29)
  AND "isMale" = FALSE;
SELECT "id",
  "firstName",
  "birthday",
  "isMale",
  extract(
    "years"
    FROM age("birthday")
  ) AS "age"
FROM "users"
WHERE extract(
    "years"
    FROM age("birthday")
  ) BETWEEN 25 AND 27
  AND "isMale" = FALSE;
--витягти усіх, хто народився 1998 році
SELECT "id",
  "firstName",
  "lastName",
  "isMale",
  "birthday"
FROM "users"
WHERE extract(
    "years"
    FROM "birthday"
  ) = 1998;
--витягти усі, хто народився 13 числа
SELECT "id",
  "firstName",
  "lastName",
  "isMale",
  "birthday"
FROM "users"
WHERE extract(
    "days"
    FROM "birthday"
  ) = 13;
--витягти усіх чоловіків, які народилися влітку
SELECT "id",
  "firstName",
  "birthday",
  "isMale",
  "birthday"
FROM "users"
WHERE extract(
    "months"
    FROM "birthday"
  ) IN (6, 7, 8)
  AND "isMale" = TRUE;
--витягти усіх чоловіків віком старше 45 зі зростом менше 1.75
SELECT "id",
  "firstName",
  "lastName",
  "isMale",
  extract(
    "years"
    FROM age("birthday")
  ) AS "age",
  "birthday",
  "height"
FROM "users"
WHERE extract(
    "years"
    FROM age("birthday")
  ) > 45
  AND "isMale" = TRUE
  AND "height" < 1.75;
--дістати пошту усіх чоловіків старше 35 і зростом вище 1.65
SELECT "id",
  "email",
  "isMale",
  extract(
    "years"
    FROM age("birthday")
  ) AS "вік",
  "height"
FROM "users"
WHERE extract(
    "years"
    FROM age("birthday")
  ) > 35
  AND "isMale" = TRUE
  AND "height" > 1.65
LIMIT 10 OFFSET 10;
SELECT "firstName" || ' ' || "lastName" AS "fullName"
FROM "users";
SELECT concat("firstName", ' ', "lastName") AS "fullName"
FROM "users"
LIMIT 10 OFFSET 10;
--вибрати усіх з довжиною повного імені від 15 до 20 сиволів  [15;20)
SELECT *
FROM (
  SELECT concat("firstName", ' ', "lastName") AS "fullName",
    length(concat("firstName", ' ', "lastName")) AS "length"
  FROM "users"  
) AS "fn_length"
WHERE "fn_length"."length"=18