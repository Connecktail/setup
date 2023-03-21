CREATE TABLE
    Bottles (
        id BIGSERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        quantity FLOAT NOT NULL,
        url TEXT NOT NULL,
        id_module MACADDR,
        price FLOAT NOT NULL
    );

CREATE TABLE
    Modules (
        mac_address MACADDR NOT NULL PRIMARY KEY,
        ip_address INET NOT NULL
    );

ALTER TABLE Bottles
ADD
    FOREIGN KEY (id_module) REFERENCES Modules(mac_address);

CREATE TABLE
    Cocktails(
        id BIGSERIAL PRIMARY KEY,
        name TEXT NOT NULL,
        description TEXT NOT NULL,
        price FLOAT NOT NULL,
        image_url TEXT,
        personalized BOOLEAN
    );

CREATE TABLE
    Steps(
        id BIGSERIAL PRIMARY KEY,
        quantity FLOAT NOT NULL,
        description TEXT,
        id_cocktail BIGINT NOT NULL,
        id_bottle BIGINT NOT NULL,
        message TEXT
    );

ALTER TABLE Steps
ADD
    FOREIGN KEY (id_cocktail) REFERENCES Cocktails(id);

ALTER TABLE Steps ADD FOREIGN KEY (id_bottle) REFERENCES Bottles(id);

CREATE TABLE
    Orders(
        id BIGSERIAL PRIMARY KEY,
        date TIMESTAMP NOT NULL,
        price FLOAT NOT NULL,
        status BOOLEAN
    );

CREATE TABLE
    Cocktails_Orders(
        id BIGSERIAL PRIMARY KEY,
        id_cocktail BIGINT NOT NULL,
        id_order BIGINT NOT NULL
    );

ALTER TABLE Cocktails_Orders
ADD
    FOREIGN KEY (id_cocktail) REFERENCES Cocktails(id);

ALTER TABLE Cocktails_Orders
ADD
    FOREIGN KEY (id_order) REFERENCES Orders(id);