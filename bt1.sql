CREATE DATABASE HospitalDB;

USE HospitalDB;

CREATE TABLE Patients (
    Patient_ID INT PRIMARY KEY,
    Full_Name VARCHAR(100),
    Age INT,
    Room_Number INT,
    HIV_Status VARCHAR(50),
    Mental_Health_History VARCHAR(255)
);

INSERT INTO Patients (Patient_ID, Full_Name, Age, Room_Number, HIV_Status, Mental_Health_History)
VALUES
(1, 'Minh Thu', 30, 101, 'Negative', 'None'),
(2, 'Hong Van', 40, 102, 'Positive', 'Anxiety'),
(3, 'Cao Cuong', 25, 103, 'Negative', 'None');

-- Tạo View cho lễ tân
CREATE VIEW Reception_Patient_View AS
SELECT 
    Patient_ID,
    Full_Name,
    Age,
    Room_Number
FROM Patients
WHERE Age >= 0
WITH CHECK OPTION;

-- =========================
-- KIỂM THỬ VIEW
-- =========================

-- 1. Xem dữ liệu qua View
SELECT * 
FROM Reception_Patient_View;

-- 2. UPDATE hợp lệ qua View
UPDATE Reception_Patient_View
SET Room_Number = 201
WHERE Patient_ID = 1;

-- Kiểm tra sau UPDATE
SELECT * 
FROM Reception_Patient_View
WHERE Patient_ID = 1;

-- 3. UPDATE vi phạm điều kiện WITH CHECK OPTION
-- Câu lệnh này sẽ bị lỗi vì Age < 0
UPDATE Reception_Patient_View
SET Age = -5
WHERE Patient_ID = 1;

-- 4. Kiểm tra dữ liệu bảng gốc
SELECT * 
FROM Patients;
