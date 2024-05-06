SELECT "name" , "per_pupil_expenditure" AS "ex_pu"
FROM "districts"
JOIN "expenditures"
ON "districts"."id" = "expenditures"."district_id"
WHERE "type" = "Public School District"
ORDER BY "ex_pu" DESC
LIMIT 10;
