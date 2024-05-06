SELECT "first_name", "last_name", "salary"/"H" AS "dollars per hit"
FROM "players"
JOIN "salaries" ON "players"."id" = "salaries"."player_id" , "performances" ON "players"."id" = "performances"."player_id"
WHERE "salaries"."year" = "performances"."year" AND "performances"."year" = '2001' AND "performances"."H" != '0'
ORDER BY "dollars per hit" , "players"."first_name" , "players"."last_name"
LIMIT 10;
