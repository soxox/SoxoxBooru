BEGIN TRANSACTION;
CREATE TABLE users (
    "id" INTEGER PRIMARY KEY NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT,
    "password_salt" TEXT,
    "level" INTEGER NOT NULL DEFAULT (0),
    "created" INTEGER NOT NULL
)
COMMIT;
