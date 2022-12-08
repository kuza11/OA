-- Up
CREATE TABLE truckers (
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  age INTEGER,
  qualification TEXT,
  current_truck_id INTEGER,
  FOREIGN KEY (current_truck_id) REFERENCES trucks(id)
);

CREATE TABLE trucks(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  name TEXT,
  required_qualification TEXT,
  condition NUMBER
);

CREATE TABLE cargo(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  trucker_id INTEGER,
  truck_id INTEGER,
  description TEXT,
  destination TEXT,
  FOREIGN KEY (trucker_id) REFERENCES truckers(id),
  FOREIGN KEY (truck_id) REFERENCES trucks(id)
);

CREATE TABLE jobs(
  id INTEGER PRIMARY KEY AUTOINCREMENT,
  trucker_id INTEGER,
  cargo_id INTEGER,
  income NUMBER,
  expanses NUMBER,
  distance NUMBER,
  FOREIGN KEY (trucker_id) REFERENCES truckers(id)
  FOREIGN KEY (cargo_id) REFERENCES cargo(id)

);

INSERT INTO truckers (name, age, qualification, current_truck_id) VALUES ("Josh", 40, "CE", 1);
INSERT INTO trucks (name, required_qualification, condition) VALUES ("Scania", "CE", 100);
INSERT INTO cargo (trucker_id, truck_id, description, destination) VALUES (1, 1, "oil", "London");
INSERT INTO jobs (trucker_id, cargo_id, income, expanses, distance) VALUES (1, 1, 1000, 300, 600);

-- Down
DROP TABLE truckers; 
DROP TABLE trucks;
DROP TABLE cargo;
DROP TABLE jobs;