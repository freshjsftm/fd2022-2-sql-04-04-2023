-- coach - team

CREATE TABLE "teams"(
  "id" SERIAL PRIMARY KEY,
  "title" VARCHAR(64) NOT NULL
  -- "coachId" INT REFERENCES "coaches"("id")
);
CREATE TABLE "coaches"(
  "id" SERIAL PRIMARY KEY,
  "name" VARCHAR(64) NOT NULL,
  "teamId" INT REFERENCES "teams"("id")
);
ALTER TABLE "teams"
ADD COLUMN "coachId" INT REFERENCES "coaches"("id");