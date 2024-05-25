CREATE TABLE "Ingredients"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" NUMERIC NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Dounts"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER NOT NULL,
    "price" NUMERIC NOT NULL,
    "ingrediant_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("ingrediant_id") REFERENCES "Ingredients"("id")
);

CREATE TABLE "Customers"(
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE Orders(
    "id" INTEGER,
    "donut_id" INTEGER,
    "customer_id" INTEGER,
    PRIMARY KEY ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "Donuts"("id")
    FOREIGN KEY ("customer_id") REFERENCES "Customers"("id")
);
