-- from the terminal run:
-- psql < medical_center.sql
DROP DATABASE IF EXISTS medical_center;
CREATE DATABASE medical_center;
\c medical_center
CREATE TABLE doctors(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);
CREATE TABLE patients(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  birthday TEXT NOT NULL
);
CREATE TABLE visits(
  id SERIAL PRIMARY KEY,
  doctor_id INTEGER REFERENCES doctors(id),
  patient_id INTEGER REFERENCES patients(id),
  date TEXT NOT NULL
);
CREATE TABLE diseases(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  description TEXT NOT NULL
);
CREATE TABLE patients_diagnosis(
  id SERIAL PRIMARY KEY,
  visit_id INTEGER REFERENCES visits (id),
  disease_id INTEGER REFERENCES diseases(id)
);