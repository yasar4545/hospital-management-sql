# 🏥 Hospital Management System (SQL Project)

## 📌 Project Overview

This project is a **Hospital Management System** developed using SQL.
It is designed to manage and analyse hospital data including patients, doctors, appointments, and billing information.

---

## 🧱 Database Structure

The project consists of the following tables:

### 👤 Patients

* Stores patient details such as name, age, gender, and phone number.

### 👨‍⚕️ Doctors

* Contains doctor details and their specialization.

### 📅 Appointments

* Links patients with doctors and stores appointment dates.

### 💰 Billing

* Stores billing details including amount and payment status.

---

## ⚙️ Technologies Used

* SQL (MySQL)
* MySQL Workbench

---

## 🚀 Features

* Manage patient records
* Track doctor information
* Schedule appointments
* Monitor billing and payment status
* Analyse hospital data using SQL queries

---

## 🔥 SQL Concepts Used

* JOIN (INNER JOIN)
* GROUP BY
* Aggregate Functions (SUM, COUNT)
* Subqueries
* Window Functions (RANK)
* WHERE clause (filtering)
* ORDER BY (sorting)

---

## 📊 Sample Queries

### 🔹 Patient and Doctor Mapping

```sql
SELECT p.name AS patient, d.name AS doctor
FROM patients p
JOIN appointments a ON p.patient_id = a.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;
```

### 🔹 Total Revenue

```sql
SELECT SUM(amount) AS total_revenue FROM billing;
```

### 🔹 Patients per Doctor

```sql
SELECT d.name, COUNT(a.patient_id) AS total_patients
FROM doctors d
JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;
```

---

## 📈 Outcomes

* Designed a structured relational database
* Performed real-world data analysis using SQL
* Generated insights such as:

  * Total revenue
  * Doctor workload
  * Patient management

---

## 💼 Resume Description

**SQL Project: Hospital Management System**

* Designed a relational database with multiple tables
* Implemented SQL queries using JOIN, GROUP BY, and subqueries
* Analysed hospital data including revenue and patient flow

---

## 📷 Screenshots
doctorname-doctorname.PNG


---

## 🧠 Future Improvements

* Add medicine management system
* Add room allocation feature
* Integrate with Power BI dashboard

---

## 👨‍💻 Author

**Yasar Arafath**

---

⭐ If you like this project, give it a star!
