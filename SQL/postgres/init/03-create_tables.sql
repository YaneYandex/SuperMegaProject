\connect content

CREATE TABLE manufacturer (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT,
  cooperation_date TIMESTAMP
);

CREATE TABLE product (
  id SERIAL PRIMARY KEY,
  name TEXT,
  description TEXT,
  price REAL,
  status BOOLEAN,
  amount INT,
  manufacturer_id INT,
  CONSTRAINT fk_manufacturer
    FOREIGN KEY(manufacturer_id)
    REFERENCES manufacturer(id)
    ON DELETE SET NULL
);

CREATE TABLE product_photo (
  photo_id UUID,
  product_id INT,
  type INT,
  CONSTRAINT fk_product
    FOREIGN KEY(product_id)
    REFERENCES product(id)
    ON DELETE SET NULL
);

CREATE TABLE category (
  id SERIAL PRIMARY KEY,
  name TEXT
);

CREATE TABLE product_category (
  product_id INT,
  category_id INT,
  CONSTRAINT fk_product
    FOREIGN KEY(product_id)
    REFERENCES product(id)
    ON DELETE CASCADE,
  CONSTRAINT fk_category
    FOREIGN KEY(category_id)
    REFERENCES category(id)
    ON DELETE CASCADE,
  CONSTRAINT pk_product_category
    PRIMARY KEY (product_id, category_id)
);