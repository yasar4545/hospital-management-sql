DROP DATABASE IF EXISTS hospital_db;
CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    phone VARCHAR(15)
);

CREATE TABLE doctors (
    doctor_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(50)
);

CREATE TABLE appointments (
    appointment_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);

CREATE TABLE billing (
    bill_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id)
);


INSERT INTO patients (name, age, gender, phone) VALUES
('Yasar', 25, 'Male', '9876543210'),
('Arshiya', 26, 'Female', '9123456780'),
('Yalinaa', 2, 'Female', '9988776655');

INSERT INTO doctors (name, specialization) VALUES
('Dr. Kumar', 'Cardiology'),
('Dr. Meena', 'Neurology');

INSERT INTO appointments (patient_id, doctor_id, appointment_date) VALUES
(1, 1, '2026-04-01'),
(2, 2, '2026-04-02'),
(3, 1, '2026-04-03');

INSERT INTO billing (patient_id, amount, payment_status) VALUES
(1, 1500.00, 'Paid'),
(2, 2000.00, 'Pending'),
(3, 3000.00, 'Paid');


SELECT * FROM patients;
SELECT * FROM doctors;
SELECT * FROM appointments;
SELECT * FROM billing;


SELECT p.name AS patient, d.name AS doctor
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;


SELECT SUM(amount) AS total_revenue FROM billing;


SELECT d.name, COUNT(a.patient_id) AS total_patients
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;


SELECT * FROM billing
WHERE payment_status = 'Pending';

SELECT patient_id, SUM(amount) AS total_paid
FROM billing
GROUP BY patient_id
ORDER BY total_paid DESC
LIMIT 1;


SELECT appointment_date, COUNT(*) AS total_appointments
FROM appointments
GROUP BY appointment_date;


SELECT name FROM patients
WHERE patient_id IN (
    SELECT patient_id FROM billing WHERE amount > 2000
);


SELECT patient_id, amount,
RANK() OVER (ORDER BY amount DESC) AS rank_position
FROM billing;