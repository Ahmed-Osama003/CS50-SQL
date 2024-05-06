SELECT "city" , COUNT(*) AS "number of schools" FROM "schools"  WHERE "type" = 'Public School' GROUP BY "city" HAVING "number of schools" <= 3 ORDER BY "number of schools" DESC, "city" ;
