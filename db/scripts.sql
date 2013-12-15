use koodb;

CREATE TABLE IF NOT EXISTS business_unit (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  login VARCHAR(16) NOT NULL,
  password VARCHAR(128),
  name VARCHAR(256) NOT NULL,
  category ENUM("Restaurant", "Barber") NOT NULL,
  sub_category VARCHAR(128),
  intro VARCHAR(2048) NULL,
  cover_image INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS bu_category (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bu_id INTEGER NOT NULL REFERENCES business_unit (id),
  name VARCHAR(128) NOT NULL,
  intro VARCHAR(2048) NULL,
  category_image INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS bu_item (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bu_id INTEGER NOT NULL REFERENCES business_unit (id),
  bu_category_id INTEGER NOT NULL REFERENCES bu_category (id),
  name VARCHAR(128) NOT NULL,
  intro VARCHAR(2048) NULL,
  item_image INTEGER DEFAULT 0
);

CREATE TABLE IF NOT EXISTS bu_tables (
  id INTEGER NOT NULL,
  bu_id INTEGER NOT NULL REFERENCES business_unit (id),
  capacity INTEGER DEFAULT 2,
  reserved BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS reservation (
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  bu_id INTEGER NOT NULL REFERENCES business_unit (id),
  table_id INTEGER NOT NULL,
  for_date DATE NOT NULL,
  for_time CHAR(4) NOT NULL
);
