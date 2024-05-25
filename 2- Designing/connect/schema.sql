CREATE TABLE "Users"(
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("username")
);

CREATE TABLE "Schools"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "Companies"(
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "User_Connections"(
    "A" TEXT,
    "B" TEXT,
    FOREIGN KEY ("A") REFERENCES "Users"("username"),
    FOREIGN KEY ("B") REFERENCES "Users"("username")
);


CREATE TABLE "School_Connections"(
    "end_date" TEXT,
    "start_date" TEXT NOT NULL,
    "school_id" INTEGER,
    "user_name" TEXT ,
    "degree" TEXT NOT NULL,
    FOREIGN KEY ("school_id") REFERENCES "Schools"("id"),
    FOREIGN KEY ("user_name") REFERENCES "Users"("username")
);

CREATE TABLE "Companies_Connections"(
    "end_date" TEXT,
    "start_date" TEXT NOT NULL,
    "company_id" INTEGER,
    "user_name" TEXT ,
    "title" TEXT NOT NULL,
    FOREIGN KEY ("company_id") REFERENCES "Companies"("id"),
    FOREIGN KEY ("user_name") REFERENCES "Users"("username")
);
