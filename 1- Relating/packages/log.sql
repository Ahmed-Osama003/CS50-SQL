
-- *** The Lost Letter ***
SELECT "type" FROM "addresses" WHERE "address" = '900 Somerville Avenue';
SELECT "address" FROM "addresses" WHERE "id" = (
    SELECT "to_address_id" FROM "packages" WHERE "from_address_id" = (
        SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
    )
);
-- *** The Devious Delivery ***
SELECT "contents" FROM "packages" where "from_address_id" is NULL;
SELECT "type" from "addresses" WHERE "id" = (
    SELECT "address_id" from "scans" WHERE "action" = 'Drop'
    AND
     "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" is NULL
    )
);
-- *** The Forgotten Gift ***
SELECT "contents" FROM "packages" WHERE "from_address_id" = (
    SELECT "id" from "addresses" WHERE "address" = '109 Tileston Street'
    );

SELECT "name" FROM "drivers" WHERE "id" IN (
    SELECT "driver_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '109 Tileston Street')
            AND
            "to_address_id" = (
                SELECT "id" FROM "addresses" WHERE "address" = '728 Maple Place')
                )

            AND "timestamp" = (
        SELECT MAX("timestamp") FROM "scans" WHERE "package_id" = 9523)
);
