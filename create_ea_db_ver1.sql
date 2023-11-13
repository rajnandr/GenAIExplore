CREATE TABLE IF NOT EXISTS "game" (
    name TEXT PRIMARY KEY,
    price INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS "genre" (
    type TEXT NOT NULL,
    game_name TEXT NOT NULL,
    FOREIGN KEY (game_name) REFERENCES game(name)
    UNIQUE (type, game_name)
);

CREATE TABLE IF NOT EXISTS "platform" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT CHECK (name IN ("PC", "PS", "XBOX", "NINTENDO", "MOBILE")) NOT NULL,
    game_name TEXT NOT NULL,
    FOREIGN KEY (game_name) REFERENCES game(name),
    UNIQUE (name, game_name)
);

CREATE TABLE IF NOT EXISTS "customer" (
    name TEXT PRIMARY KEY,
    country TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS "order" (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    platform_id INTEGER NULL,
    customer_name TEXT NOT NULL,
    FOREIGN KEY (platform_id) REFERENCES platform(id),
    FOREIGN KEY (customer_name) REFERENCES customer(name)
);

INSERT INTO "game" (name, price) VALUES
    ("FIFA", 10),
    ("MADDEN", 5),
    ("NHL", 20),
    ("UFC", 10),
    ("FI", 15),
    ("APEX", 5),
    ("BASEBALL", 5),
    ("BATTLEFIELD", 20);

INSERT INTO "genre" (type, game_name) VALUES
    ("SHOOTER", "BATTLEFIELD"),
    ("FP", "BATTLEFIELD"),
    ("SPORTS", "BASEBALL"),
    ("SHOOTER", "APEX"),
    ("FP", "APEX"),
    ("SPORTS", "FI"),
    ("ACTION", "FI"),
    ("SPORTS", "UFC"),
    ("ACTION", "UFC"),
    ("ADVENTURE", "NHL"),
    ("ADVENTURE", "MADDEN"),
    ("SPORTS", "FIFA");

INSERT INTO "platform" (name, game_name) VALUES
    ("PC", "BATTLEFIELD"),
    ("PC", "FIFA"),
    ("PC", "FI"),
    ("PS", "MADDEN"),
    ("PS", "NHL"),
    ("PS", "BATTELFIELD"),
    ("XBOX", "UFC"),
    ("XBOX", "BATTLEFIELD"),
    ("XBOX", "APEX"),
    ("NINTENDO", "UFC"),
    ("NINTENDO", "BASEBALL"),
    ("NINTENDO", "NHL"),
    ("MOBILE", "FI"),
    ("MOBILE", "MADDEN"),
    ("MOBILE", "FIFA");

INSERT INTO "customer" (name, country) VALUES
    ("SWADHA", "INDIA"),
    ("RAJ", "USA"),
    ("DINESH", "AUSTRALIA"),
    ("RATNAKAR", "INDIA"),
    ("SANDEEP", "UK"),
    ("RAHUL", "UK");

INSERT INTO "order" (platform_id, customer_name) VALUES
    (1, "SWADHA"),
    (1, "RAJ"),
    (2, "SANDEEP"),
    (3, "RAJ"),
    (4, "DINESH"),
    (4, "RAJ"),
    (4, "RAHUL"),
    (5, "SANDEEP"),
    (5, "RATNAKAR");