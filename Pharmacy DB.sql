CREATE DATABASE pharmacy;
USE pharmacy;

CREATE TABLE Tablets(
    Tablet_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Tablet_weight INT,
    disease VARCHAR(50),
    symtoms VARCHAR(100)
);

INSERT INTO Tablets(Tablet_ID, Name, Tablet_weight, disease, symtoms)
VALUES
(001, 'Paracetamol 500 mg', 500, 'Fever', 'High temperature, headache, body pain'),
(002, 'Ibuprofen 400 mg', 400, 'Inflammation', 'Swelling, pain, redness'),
(003, 'Amoxicillin 250 mg', 250, 'Bacterial Infection', 'Fever, sore throat, cough'),
(004, 'Cetirizine 10 mg', 10, 'Allergy', 'Sneezing, itching, runny nose'),
(005, 'Metformin 500 mg', 500, 'Type 2 Diabetes', 'Frequent urination, excessive thirst, fatigue'),
(006, 'Amlodipine 5 mg', 5, 'High Blood Pressure', 'Headache, dizziness, blurred vision'),
(007, 'Omeprazole 20 mg', 20, 'Acid Reflux', 'Heartburn, chest discomfort, sour taste'),
(008, 'Azithromycin 500 mg', 500, 'Respiratory Infection', 'Cough, fever, breathing difficulty'),
(009, 'Atorvastatin 20 mg', 20, 'High Cholesterol', 'Chest pain, fatigue, no obvious symptoms'),
(010, 'Levocetirizine 5 mg', 5, 'Seasonal Allergy', 'Watery eyes, sneezing, nasal congestion');

SELECT * FROM Tablets;

ALTER TABLE Tablets 
RENAME COLUMN disease TO used_for_tablets;

ALTER TABLE Tablets
RENAME COLUMN symtoms TO symtoms_occurs;

UPDATE Tablets
SET used_for_tablets = 'Body pains and headache'
WHERE Tablet_ID = 001;

UPDATE Tablets
SET used_for_tablets = 'Allergy and body infection'
WHERE Tablet_ID = 002;

SELECT * FROM Tablets;


SELECT Tablet_weight, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY Tablet_weight;


SELECT used_for_tablets, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY used_for_tablets;


SELECT Tablet_weight, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY Tablet_weight
HAVING COUNT(*) > 1;


SELECT used_for_tablets, COUNT(*) AS Total_Tablets
FROM Tablets
GROUP BY used_for_tablets
HAVING COUNT(*) >= 1;


TRUNCATE TABLE Tablets;

DROP TABLE Tablets;