CREATE TABLE
  IF NOT EXISTS accounts (
    id VARCHAR(255) NOT NULL PRIMARY KEY COMMENT 'primary key',
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
    name VARCHAR(255) COMMENT 'User Name',
    email VARCHAR(255) UNIQUE COMMENT 'User Email',
    picture VARCHAR(255) COMMENT 'User Picture'
  ) DEFAULT charset utf8mb4 COMMENT '';

CREATE TABLE
  cars (
    -- id should always be your first column
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    make VARCHAR(50) NOT NULL,
    model VARCHAR(100) NOT NULL,
    `year` SMALLINT UNSIGNED NOT NULL,
    price MEDIUMINT UNSIGNED NOT NULL,
    img_url VARCHAR(500) NOT NULL,
    description VARCHAR(500),
    engine_type ENUM ('V6', 'V8', 'V10', '4-cylinder', 'unknown') NOT NULL,
    color VARCHAR(50) NOT NULL,
    mileage MEDIUMINT UNSIGNED NOT NULL,
    has_clean_title BOOLEAN DEFAULT TRUE NOT NULL,
    creator_id VARCHAR(255) NOT NULL,
    FOREIGN KEY (creator_id) REFERENCES accounts (id) ON DELETE CASCADE
  );
DROP TABLE cars;
DROP TABLE houses;
DROP TABLE accounts;

  CREATE TABLE houses(
 id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 sqft INT NOT NULL,
 bedrooms INT NOT NULL,
 bathrooms DOUBLE NOT NULL,
 imgUrl VARCHAR(255) NOT NULL,
 description VARCHAR(255) NOT NULL,
 price INT NOT NULL,
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP COMMENT 'Time Created',
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Last Update',
creator_id VARCHAR(255) NOT NULL,
FOREIGN KEY (creator_id) REFERENCES accounts (id) ON DELETE CASCADE
);

INSERT INTO 
houses(
sqft,
bedrooms,
bathrooms,
imgUrl,
description,
price,
creator_id
)
VALUES
(
  100,
  1,
  1,
  "https://images.unsplash.com/photo-1580587771525-78b9dba3b914?q=80&w=1074&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
  "cool awesome house!",
  15000,
  "685320ea769bbf29d03dd468"

)

SELECT
  *
FROM
  houses;


INSERT INTO
  cars (
    make,
    model,
    `year`,
    price,
    img_url,
    description,
    engine_type,
    color,
    mileage,
    has_clean_title,
    creator_id
  )
VALUES
  (
    'vw',
    'golf',
    1980,
    40000,
    'https://images.unsplash.com/photo-1751528962027-ac9f0370ff5d?w=700&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHw0fHx8ZW58MHx8fHx8',
    'guacomobile',
    'V8',
    'avocado',
    100000,
    FALSE,
    '685320ea769bbf29d03dd468'
  );

SELECT
  *
FROM
  cars;

SELECT
  *
FROM
  cars;

SELECT
  *
FROM
  accounts;

SELECT
  cars.*,
  accounts.*
FROM
  cars
  JOIN accounts ON cars.creator_id = accounts.id
ORDER BY
  cars.created_at ASC;

SELECT
  cars.*,
  accounts.*
FROM
  cars
  JOIN accounts ON cars.creator_id = accounts.id
WHERE
  cars.id = 1;

SELECT
  cars.*,
  accounts.*
FROM
  cars
  JOIN accounts ON cars.creator_id = accounts.id
WHERE
  cars.id = 2;

UPDATE cars
SET
  color = 'green'
WHERE
  id = 3;