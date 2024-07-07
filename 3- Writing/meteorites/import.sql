CREATE TABLE "meteorites_temp" (
    "name" text,
    "id" int,
    "nametype" text,
    "class" text,
    "mass" real,
    "discovery" text,
    "year" int,
    "lat" real,
    "long" real,
    primary key(id)
);

.import --csv --skip 1 meteorites.csv meteorites_temp

update meteorites_temp
set mass = null
where mass ='';

update meteorites_temp
set lat = null
where lat = '';

update meteorites_temp
set long = null
where long = '';

update meteorites_temp
set year = null
where year = '';

update meteorites_temp
set lat = ROUND("lat",2);

update meteorites_temp
set mass = ROUND("mass",2);

update meteorites_temp
set  long = round("long", 2);

DELETE FROM "meteorites_temp" WHERE "nametype" = 'Relict';

CREATE TABLE "meteorites" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" NUMERIC,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" NUMERIC,
    "long" NUMERIC,
    PRIMARY KEY ("id")
);

INSERT INTO meteorites ("name", "class", "mass", "discovery", "year", "lat", "long")
SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "meteorites_temp" ORDER BY "year" , "name";

DROP TABLE "meteorites_temp";
