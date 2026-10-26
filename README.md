# 🏘️ HOAManagement-CCINFOM (Animo HOA Database System)

[![Course](https://img.shields.io/badge/Course-CCINFOM-00693E.svg)](https://www.dlsu.edu.ph)
[![Database](https://img.shields.io/badge/Database-MySQL%208.0+-4479A1?logo=mysql&logoColor=white)](https://www.mysql.com/)
[![Schema](https://img.shields.io/badge/Schema-hoa__db-blue.svg)](#relational-schema--domain-modules)
[![Status](https://img.shields.io/badge/Status-Complete%20Database%20Design-success.svg)](#project-overview)

> Relational database design, Entity-Relationship Modeling (ERD), schema normalization, and implementation for a comprehensive **Homeowners Association (HOA) Management System**. Developed for **CCINFOM Design Case 01** (Section S19, Group 5).

---

## 📌 Table of Contents
1. [Project Overview](#-project-overview)
2. [Relational Schema & Modules](#-relational-schema--modules)
3. [Entity Relationship Diagram (ERD)](#-entity-relationship-diagram-erd)
4. [Frontend Status Analysis](#-frontend-status-analysis)
5. [Suggested Folder Hierarchy](#-suggested-folder-hierarchy)
6. [Database Setup & Installation](#-database-setup--installation)
7. [Repository File Inventory](#-repository-file-inventory)
8. [Authors & Academic Details](#-authors--academic-details)

---

## 📖 Project Overview

The **Animo HOA Management System** is a relational database designed to streamline and automate day-to-day operations for homeowners associations. The system centralizes administrative records, resident demographics, property allocations, financial accounting, vehicle gate-passes, security incident logging, and community charitable drives.

### Key Functional Capabilities
- **Geographic & Address Hierarchy**: Normalized tracking from regions, provinces, cities, down to barangays, zipcodes, and street coordinates.
- **HOA Governance & Administration**: Manages HOA branches, election cycles, quorum results, elected officers, officer duty schedules, and notarized bylaws/documents.
- **Homeowners, Residents & Households**: Tracks individuals, homeowner memberships, household units, resident relations, contact numbers, and ID card issuance.
- **Property Management**: Distinguishes residential dwellings from commercial spaces with tenant caps and square-meter lot records.
- **Vehicle Gate Access & Stickers**: Controls resident and commercial vehicle registrations, Land Transportation Office (LTO) OR/CR records, and annual gate pass stickers.
- **Billing, Dues & Accounting**: Implements monthly assessment generation, ledger balances, breakdown of basic dues/penalties, monetary discounts/incentives, and official payment receipts.
- **Security & Incident Logging**: Records community violations, investigating/seconding officers, persons involved (residents vs. non-residents), and attached digital evidence.
- **Community Drives & Donations**: Documents monetary and in-kind charitable contributions, donor addresses, acknowledgment forms, and photographic documentation.

---

## 🗄️ Relational Schema & Modules

The database schema (`hoa_db`) is fully normalized to **Third Normal Form (3NF)** and consists of **37 interrelated tables**:

```
hoa_db
├── 📍 Geographical & Address
│   ├── regions
│   ├── provinces
│   ├── cities
│   ├── zipcodes
│   └── address
├── 🏛️ HOA Administration & Governance
│   ├── hoa
│   ├── elections
│   ├── officer_positions
│   ├── hoa_officer
│   ├── hoaofficer_sched
│   └── hoa_files
├── 👥 Demographics & Residency
│   ├── individual
│   ├── homeowner
│   ├── household
│   ├── resident
│   ├── resident_idcard
│   └── mobile
├── 🏠 Properties & Assets
│   ├── property
│   ├── residential_prop
│   ├── commercial_prop
│   └── asset
├── 🚗 Vehicle & Gate Security
│   ├── vehicle
│   ├── orcr
│   └── sticker
├── 💳 Financials, Billing & Ledger
│   ├── receipt
│   ├── monthly_duebill
│   ├── dues
│   ├── household_account
│   ├── payments
│   ├── incentives_anddiscounts
│   └── nonmonetary_incentives
├── ⚖️ Violations & Incident Logs
│   ├── incident
│   ├── person_involved
│   └── evidence
└── 🎁 Community Donations
    ├── donation
    ├── donation_item
    └── donation_picture
```

---

## 🗺️ Entity Relationship Diagram (ERD)

The repository provides the complete data model in multiple formats:
- **Visual Diagram**: `docs/erd/CCINFOM_S19-05_DesignCase01.png` — High-resolution exported ERD visualization showing entity cardinalities, foreign key connections, and primary keys.
- **Workbench Model**: `docs/erd/CCINFOM_S19-05_DesignCase01.mwb` — Native MySQL Workbench model file for visual inspection and forward/reverse engineering.
- **Data Dictionary**: `docs/data_dictionary/CCINFOM_S19-05_DesignCase01.xlsx` — Table structures, attribute types, nullable flags, keys, and descriptions.

---

## 🖥️ Frontend Status Analysis

- **Current State**: **No Frontend**.
- **Assessment**: This repository is dedicated to the core **Relational Database Design and Implementation** (Data Layer). It contains SQL schema definitions (DDL), sample records (DML), ERD models, and design documentation.
- **Next Phase Recommendation**: If an interactive user application is to be developed, a modern full-stack web interface (e.g., React/Next.js frontend with Node.js/Express or Python FastAPI/Flask backend) can connect directly to `hoa_db` using standard connection pooling (e.g., `mysql2`, `Prisma`, or `SQLAlchemy`).

---

## 📂 Project Folder Hierarchy

### Current Structural Organization
The repository is organized according to standard enterprise database project conventions:

```text
HOAManagement-CCINFOM/
├── .gitignore                          # Git ignore rules for OS and temp files
├── README.md                           # Master project documentation
│
├── database/                           # Database scripts and schemas
│   ├── schema.sql                      # DDL schema definition (tables, constraints, drops)
│   ├── seed_data.sql                   # DML sample records (inserts)
│   └── CCINFOM_S19-05_DesignCase01.sql # Consolidated all-in-one deployment script
│
└── docs/                               # Project design documentation
    ├── erd/
    │   ├── CCINFOM_S19-05_DesignCase01.png  # High-resolution ERD diagram
    │   └── CCINFOM_S19-05_DesignCase01.mwb  # MySQL Workbench model
    ├── data_dictionary/
    │   └── CCINFOM_S19-05_DesignCase01.xlsx # Detailed attribute dictionary
    └── reports/
        └── CCINFOM_S19-05_DesignCase01.pdf  # Design case formal report
```

### Full-Stack Application Hierarchy (Future Development)
If a web application is built on top of this database:

```text
HOAManagement-CCINFOM/
├── client/                             # Frontend UI (React / Next.js / Vite)
│   ├── public/                         # Static assets & icons
│   ├── src/
│   │   ├── components/                 # Reusable UI widgets (cards, forms, tables)
│   │   ├── pages/ or app/              # Routes (Dashboard, Residents, Billing, Incidents)
│   │   ├── services/                   # Frontend API clients (Axios / Fetch)
│   │   └── styles/                     # CSS / Design tokens
│   ├── package.json
│   └── vite.config.js
│
├── server/                             # Backend API (Node.js / Express or Python FastAPI)
│   ├── src/
│   │   ├── config/                     # Database connection pool config
│   │   ├── controllers/                # Request handlers
│   │   ├── routes/                     # API endpoint definitions (/api/v1/...)
│   │   ├── services/                   # Business logic (billing computation, approvals)
│   │   └── models/                     # Data access layer / ORM models
│   ├── package.json / requirements.txt
│   └── server.js / main.py
│
├── database/                           # Database layer
│   ├── migrations/                     # Versioned schema migrations
│   └── seeds/                          # Initial and development seed datasets
│
└── docs/                               # ERD and documentation
```

---

## 🚀 Database Setup & Installation

### Prerequisites
- [MySQL Server 8.0+](https://dev.mysql.com/downloads/mysql/)
- [MySQL Workbench](https://dev.mysql.com/downloads/workbench/) (Optional, for visual management)

### Setup via Command Line (Terminal / PowerShell)

1. **Clone the repository**:
   ```bash
   git clone https://github.com/DaLouuu/HOAManagement-CCINFOM.git
   cd HOAManagement-CCINFOM
   ```

2. **Execute the SQL script**:
   - **Option A (Consolidated deployment)**:
     ```bash
     mysql -u root -p < database/CCINFOM_S19-05_DesignCase01.sql
     ```
   - **Option B (Modular deployment)**:
     ```bash
     mysql -u root -p < database/schema.sql
     mysql -u root -p < database/seed_data.sql
     ```

3. **Verify the database installation**:
   ```sql
   USE hoa_db;
   SHOW TABLES;
   SELECT COUNT(*) FROM hoa;
   SELECT COUNT(*) FROM resident;
   SELECT COUNT(*) FROM monthly_duebill;
   ```

---

## 📁 Repository File Inventory

| Path | Type | Description |
| :--- | :--- | :--- |
| `database/CCINFOM_S19-05_DesignCase01.sql` | SQL Script | Consolidated DDL schema and DML seed data for all 37 tables. |
| `database/schema.sql` | SQL Script | Modular DDL schema creation (tables, relationships, and constraints). |
| `database/seed_data.sql` | SQL Script | Modular DML insert dataset for records across all 37 tables. |
| `docs/erd/CCINFOM_S19-05_DesignCase01.png` | Image (PNG) | Visual Entity-Relationship Diagram (ERD). |
| `docs/erd/CCINFOM_S19-05_DesignCase01.mwb` | Workbench File | Source MySQL Workbench 8.0 model. |
| `docs/data_dictionary/CCINFOM_S19-05_DesignCase01.xlsx` | Spreadsheet | Data dictionary specifying data types, lengths, constraints, and keys. |
| `docs/reports/CCINFOM_S19-05_DesignCase01.pdf` | Document (PDF) | Comprehensive Design Case project documentation report. |
| `.gitignore` | Git Config | Excludes system, editor, and temporary database artifacts. |
| `README.md` | Markdown | Master project documentation, schema mapping, and setup guide. |

---

## 🎓 Authors & Academic Details
- **Course**: CCINFOM (Information Management / Database Systems)
- **Institution**: De La Salle University (DLSU)
- **Section & Group**: S19, Group 5
- **Design Case**: Design Case 01 — Relational Database Design
- **Maintainer**: [@DaLouuu](https://github.com/DaLouuu)
