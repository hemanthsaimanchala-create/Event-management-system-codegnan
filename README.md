Event Management System - MySQL

A MySQL database project for managing technical events, participant registrations, attendance, and certificates.

📌 Project Overview

The Event Management System is a relational database project designed to manage the complete lifecycle of technical events. It stores event details, participant information, registrations, attendance records, and certificates.

The project also demonstrates practical SQL concepts including:

SELECT queries

INSERT, UPDATE, and DELETE operations

String and date functions

Aggregate functions

GROUP BY and HAVING

JOINs

Subqueries

Views

Transactions and SAVEPOINT

Stored procedures

Triggers

🎯 Problem Statement

Create a database to manage:

Technical events

Participant registrations

Attendance

Certificates

The expected outcome is to generate participant lists and attendance reports.

🗂️ Database Modules

The database contains five main modules:

Events

Participants

Registrations

Attendance

Certificates

🏗️ Database Structure

Events

Stores information about technical events.

Column

Description

event_id

Primary key

event_name

Name of the event

event_type

Type of event

event_date

Event date

venue

Event location

registration_fee

Registration fee

Participants

Stores participant information.

Column

Description

participant_id

Primary key

participant_name

Participant name

email

Email address

phone

Phone number

city

Participant city

Registrations

Connects participants with events.

Column

Description

registration_id

Primary key

event_id

Foreign key referencing Events

participant_id

Foreign key referencing Participants

registration_date

Date of registration

registration_status

Registration status

Attendance

Stores attendance information for registrations.

Column

Description

attendance_id

Primary key

registration_id

Foreign key referencing Registrations

attendance_date

Attendance date

attendance_status

Present / Absent

Certificates

Stores certificates issued to participants.

Column

Description

certificate_id

Primary key

registration_id

Foreign key referencing Registrations

certificate_type

Certificate type

issue_date

Certificate issue date

📊 Sample Data

The project includes sample data for:

8 Events

12 Participants

16 Registrations

14 Attendance records

11 Certificates

Sample events include AI Summit 2026, Cloud Computing Expo, Data Science Bootcamp, Cyber Security Meet, Web Development Hackathon, Machine Learning Conference, DevOps Hands-on Lab, and Tech Career Connect.

🔍 SQL Concepts Covered

The project contains 41 SQL tasks covering different levels of database querying.

Basic Queries

Display events with event type and venue

Filter participants by city

Update registration fees

Change registration status

Delete cancelled registrations

String Functions

Convert participant names to uppercase

Convert event names to lowercase

Extract the first four characters of event names

Concatenate participant name and city

Replace values in the event type column

Date Functions

Find events scheduled in the current month

Display day names

Calculate days between registration and event dates

Format event dates as DD-Month-YYYY

Extract month and year from certificate issue dates

Aggregate Functions

Count participants registered for each event

Calculate average registration fees by event type

Find the highest registration fee

Count registrations by status

Count Present and Absent participants

Count certificates by certificate type

JOINs

The project demonstrates relationships between:

Participants and Events

Events and Registrations

Participants and Registrations

Registrations and Attendance

Registrations and Certificates

It also includes LEFT JOIN scenarios to display events or participants even when they do not have related registration records.

Subqueries

Examples include:

Participants registered for events with fees above the average

Event with the highest number of registrations

Participants with attendance above the average

Participants who attended at least one workshop

Events that have never received a registration

Views

Two views are required:

Participant_Event_Details

Event_Attendance_Summary

These views provide reusable participant/event details and event-level attendance summaries.

Transactions

The project demonstrates:

START TRANSACTION

Updating registration fees

SAVEPOINT

Updating registration status

ROLLBACK TO SAVEPOINT

COMMIT

Stored Procedures

Two stored procedures are included in the project requirements:

Display all registrations made by a particular participant.

Calculate the total number of events attended by a particular participant.

Triggers

Two trigger-based operations are included:

Archive deleted registration details into Registrations_Archive.

Record attendance status changes in Attendance_History.

🛠️ Technologies Used

MySQL

SQL

Relational Database Concepts

Stored Procedures

Views

Transactions

Triggers

📁 Suggested Repository Structure

Event-Management-System-MySQL/
│
├── README.md
├── event_management_system.sql
└── screenshots/
    ├── database-structure.png
    ├── sample-data.png
    └── query-results.png

🚀 How to Run

1. Install MySQL

Install MySQL Server and MySQL Workbench, or use another MySQL-compatible SQL client.

2. Create the Database

Create a database for the project:

CREATE DATABASE event_management_system;
USE event_management_system;

3. Create the Tables

Create the following tables according to the database design:

Events
Participants
Registrations
Attendance
Certificates

4. Insert Sample Data

Run the INSERT statements provided in the project SQL file.

5. Execute SQL Queries

Run the required queries to generate:

Event information

Participant lists

Registration reports

Attendance reports

Certificate reports

Aggregated statistics

6. Test Advanced SQL Features

Execute the views, stored procedures, transactions, and triggers after the required tables and data have been created.

📈 Project Outcomes

This project provides hands-on practice with designing and querying a relational database for an event management scenario.

It demonstrates how SQL can be used to:

Manage structured event data

Track participant registrations

Monitor attendance

Manage certificates

Generate reports

Work with related tables using JOINs

Build reusable views and procedures

Maintain historical information using triggers

Safely manage changes using transactions

👨‍💻 Author

Hemanth Sai

BCA Graduate | SQL & Database Project
