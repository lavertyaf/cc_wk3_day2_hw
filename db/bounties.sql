DROP TABLE bounties;

CREATE TABLE bounties(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  homeworld VARCHAR(255),
  fave_weapon VARCHAR(255)
);
