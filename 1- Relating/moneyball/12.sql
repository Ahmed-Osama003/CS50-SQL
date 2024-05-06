SELECT * FROM(
    SELECT "first_name", "last_name"
    FROM "players" JOIN "salaries"
    ON "players"."id" = "salaries"."player_id"
    , "performances" ON "players"."id" = "performances"."player_id"
    WHERE "salaries"."year" = "performances"."year" AND "performances"."year" = '2001' AND "H" > '0'
    ORDER BY ("salary" / "H") , "players"."first_name" , "players"."last_name"
    LIMIT 10
)


INTERSECT

SELECT * FROM(
    SELECT "first_name", "last_name"
    FROM "players"
    JOIN "salaries" ON "players"."id" = "salaries"."player_id" , "performances" ON "players"."id" = "performances"."player_id"
    WHERE "salaries"."year" = "performances"."year" AND "performances"."year" = '2001' AND "performances"."RBI" != '0'
    ORDER BY ("salary"/"RBI") , "players"."first_name" , "players"."last_name"
    LIMIT 10
)
ORDER BY "last_name";
