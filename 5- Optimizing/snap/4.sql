SELECT "username" FROM "users" WHERE "id" IN (
    SELECT "to_user_id" FROM
        (
            SELECT "to_user_id",COUNT("to_user_id") AS mx_user
            FROM "messages"
            GROUP BY "to_user_id"
            ORDER BY mx_user DESC
            LIMIT 1
            )
);
