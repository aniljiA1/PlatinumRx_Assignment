📦 PlatinumRx Technical Assessment

This repository contains solutions to the SQL, Excel, and Python tasks for the PlatinumRx Technical Assignment. Each section is organized into separate folders with clean, production-ready code and documentation.

📁 Project Structure
PlatinumRx_Assignment/
│
├── SQL/
│   ├── hotel_schema.sql
│   ├── hotel_queries.sql
│   ├── clinic_schema.sql
│   └── clinic_queries.sql
│
├── Python/
│   ├── 01_Time_Converter.py
│   └── 02_Remove_Duplicates.py
│
├── Spreadsheets/
│   └── Ticket_Analysis.xlsx
│
└── README.md

🗂 SQL Tasks
1. Hotel Management Database

Includes:

Table creation script

Guest–Room relationships

Booking model

Revenue analysis queries

Room occupancy analytics

2. Clinic Management Database

Includes:

Patient registration

Appointment management

Doctor schedule system

Daily appointment insights

All SQL scripts follow clean normalization and include comments.

🧮 Excel Task – Ticket Analysis Dashboard

The Excel file includes:

ticket Sheet – Raw tickets

feedbacks Sheet – Customer feedback

summary Sheet

Lookup using INDEX + MATCH

Helper formula e.g. BASE+TICKET_ID

Total tickets

Average feedback score

Filter-ready table

This file is ready for analysis or BI import.

🐍 Python Tasks
1. Time Converter

Converts time between multiple formats:

12→24 hour

24→12 hour

Handles invalid formats gracefully.

2. Remove Duplicate Characters

Removes duplicates from a string while preserving order.

Works for any input (alphabets, special chars, mixed strings).

▶️ How to Run the Python Scripts
cd Python/

# Time Converter
python 01_Time_Converter.py

# Remove Duplicates
python 02_Remove_Duplicates.py

📦 How to Import SQL Files (MySQL Example)
mysql -u root -p < SQL/hotel_schema.sql
mysql -u root -p < SQL/hotel_queries.sql

🎯 Key Highlights

Clean, modular folder structure

Fully documented SQL schemas

Excel file with formulas and ready-to-analyze sheets

Simple and efficient Python solutions

Professional GitHub documentation
