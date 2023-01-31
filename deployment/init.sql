CREATE TABLE
    Bottles (
        id BIGSERIAL PRIMARY KEY,
        quantity FLOAT NOT NULL,
        url VARCHAR(255) NOT NULL,
        id_module BIGINT
    );

CREATE TABLE
    Modules (
        id BIGINT NOT NULL PRIMARY KEY,
        ip_address VARCHAR(255) NOT NULL
    );

ALTER TABLE Bottles
ADD
    FOREIGN KEY (id_module) REFERENCES Modules(id);

CREATE TABLE
    Cocktails(
        id BIGSERIAL PRIMARY KEY,
        price FLOAT NOT NULL,
        image VARCHAR(255) NOT NULL
    );

CREATE TABLE
    Steps(
        id BIGSERIAL PRIMARY KEY,
        quantity FLOAT NOT NULL,
        description VARCHAR(255) NOT NULL,
        id_cocktail BIGINT NOT NULL,
        id_bottle BIGINT NOT NULL
    );

ALTER TABLE Steps
ADD
    FOREIGN KEY (id_cocktail) REFERENCES Cocktails(id);

ALTER TABLE Steps ADD FOREIGN KEY (id_bottle) REFERENCES Bottles(id);

CREATE TABLE
    Orders(
        id BIGSERIAL PRIMARY KEY,
        date DATE NOT NULL,
        price FLOAT NOT NULL
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