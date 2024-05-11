use posmack;

CREATE TABLE IF NOT EXISTS tutorials (
  id int NOT NULL AUTO_INCREMENT,
  title varchar(255) DEFAULT NULL,
  description varchar(255) DEFAULT NULL,
  published tinyint(1) DEFAULT NULL,
  createdAt datetime NOT NULL,
  updatedAt datetime NOT NULL,
  PRIMARY KEY (id)
);