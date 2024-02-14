CREATE TABLE IF NOT EXISTS Person (
    person_id SERIAL PRIMARY KEY NOT NULL,
    person_name VARCHAR(50),
    sex VARCHAR(20) NOT NULL,
    person_age INTEGER
);

CREATE TABLE IF NOT EXISTS Job (
    person_id INTEGER PRIMARY KEY REFERENCES person (person_id),
    job_rank TEXT,
    influence INTEGER
);

CREATE TABLE IF NOT EXISTS Province (
    province_id SERIAL PRIMARY KEY NOT NULL,
    province_name VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Place (
    place_id SERIAL PRIMARY KEY NOT NULL,
    place_type VARCHAR(50) NOT NULL,
    adress VARCHAR(20) NOT NULL UNIQUE,
    province_id INTEGER REFERENCES province (province_id)
);

CREATE TABLE IF NOT EXISTS Visit (
    visit_id SERIAL PRIMARY KEY NOT NULL,
    visit_description TEXT,
    place_id INTEGER REFERENCES place (place_id),
    person_id INTEGER REFERENCES person (person_id)
);

CREATE TABLE IF NOT EXISTS Person_Mood (
    person_mood_id SERIAL PRIMARY KEY NOT NULL,
    person_mood_description TEXT,
    person_id INTEGER REFERENCES person (person_id),
    type_person_mood_id INTEGER REFERENCES type_person_mood (type_person_mood_id)
);

CREATE TABLE IF NOT EXISTS Type_Person_Mood (
    type_person_mood_id SERIAL PRIMARY KEY NOT NULL,
    type_person_mood_type VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Interaction (
    interaction_id SERIAL PRIMARY KEY NOT NULL,
    interaction_description TEXT,
    place_id INTEGER REFERENCES place (place_id),
    person_mood_id INTEGER REFERENCES person_mood (person_mood_id)
);