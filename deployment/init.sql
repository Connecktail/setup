CREATE TABLE Bottles (
    id SERIAL PRIMARY KEY   , 
    quantity FLOAT NOT NULL, 
    url VARCHAR(255) NOT NULL,
    id_module INT NOT NULL
);

CREATE TABLE Modules (
    id SERIAL NOT NULL PRIMARY KEY, 
    ip_address VARCHAR(255) NOT NULL
);

ALTER TABLE Bottles ADD FOREIGN KEY (id_module) REFERENCES Modules(id);

CREATE TABLE Cocktails(
    id SERIAL PRIMARY KEY, 
    price FLOAT NOT NULL, 
    image VARCHAR(255) NOT NULL
);

CREATE TABLE Steps(
    id SERIAL PRIMARY KEY,
    quantity FLOAT NOT NULL,
    description VARCHAR(255) NOT NULL, 
    id_cocktail INT NOT NULL,
    id_bottle INT NOT NULL
);

ALTER TABLE Steps ADD FOREIGN KEY (id_cocktail) REFERENCES Cocktails(id);
ALTER TABLE Steps ADD FOREIGN KEY (id_bottle) REFERENCES Bottles(id);

CREATE TABLE Orders(
    id SERIAL PRIMARY KEY,
    date DATE NOT NULL,
    price FLOAT NOT NULL
);

CREATE TABLE Cocktails_Orders(
  	id SERIAL PRIMARY KEY,
    id_cocktail INT NOT NULL,
    id_order INT NOT NULL
);

ALTER TABLE Cocktails_Orders ADD FOREIGN KEY (id_cocktail) REFERENCES Cocktails(id);
ALTER TABLE Cocktails_Orders ADD FOREIGN KEY (id_order) REFERENCES Orders(id);