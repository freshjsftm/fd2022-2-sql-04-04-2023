DROP TABLE a;
CREATE TABLE a(
  b int, 
  c int,
  CONSTRAINT "uniquePare"  PRIMARY KEY(b,c)
);
INSERT INTO a VALUES (2,1), (2,1), (1,2), (4,1);

//тільки унікальні пари