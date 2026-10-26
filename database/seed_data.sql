USE hoa_db;

-- -----------------------------------------------------
-- Add records to regions
-- -----------------------------------------------------
INSERT INTO	regions (region)
	VALUES	('Region I'),
			('Region II'),
			('Region III'),
			('Region IV-A'),
            ('Region IV-B'),
            ('Region V'),
            ('Region VI'),
            ('Region VII'),
            ('Region VIII'),
            ('Region IX'),
            ('Region X'),
            ('Region XI'),
            ('Region XII'),
            ('Region XIII'),
            ('NCR'),
            ('CAR'),
            ('BARMM');

-- -----------------------------------------------------
-- Add records to provinces
-- -----------------------------------------------------
INSERT INTO	provinces (province_name, region)
	VALUES	('Metro Manila','NCR'),
			('Bataan','Region III'),
			('Batangas','Region IV-A'),
			('Cavite','Region IV-A'),
            ('Laguna','Region IV-A');

-- -----------------------------------------------------
-- Add records to cities
-- -----------------------------------------------------
INSERT INTO	cities (city, province)
	VALUES	('Manila','Metro Manila'),
			('Pasay','Metro Manila'),
			('Pasig','Metro Manila'),
			('Dasmarinas','Cavite'),
            ('Santa Rosa','Laguna');
            
-- -----------------------------------------------------
-- Add records to zipcodes
-- -----------------------------------------------------
INSERT INTO	zipcodes (zipcode, brgy, city, province)
	VALUES	('1001','680','Manila','Metro Manila'),
			('1002','780','Manila','Metro Manila'),
			('1003','880','Manila','Metro Manila');

-- -----------------------------------------------------
-- Add records to address
-- -----------------------------------------------------
INSERT INTO	address (address_id, stno, stname, brgy, city, province, zipcode, x_coord, y_coord)
	VALUES	(10000020, '24', 'De La Salle St.', '680', 'Manila', 'Metro Manila', 1001, 123.4567, 234.5678),
			(10000021, '45', 'De La Salle St.', '680', 'Manila', 'Metro Manila', 1001, 345.6789, 456.7890),
			(10000022, '77', 'Benilde St.', '680', 'Manila', 'Metro Manila', 1001, 567.8901, 678.9101),
            (10000023, '13', 'Mutien-Marie St.', '680', 'Manila', 'Metro Manila', 1001, 789.1011, 891.0111),
            (10000024, '50', 'Green Archer St.', '780', 'Manila', 'Metro Manila', 1002, 910.1112, 101.1121),
            (10000025, '11', 'Reims St.', '780', 'Manila', 'Metro Manila', 1002, 131.4151, 617.1819),
(10000026, '11', 'Reims St.', '780', 'Manila', 'Metro Manila', 1002, 131.4151, 617.1819);
-- -----------------------------------------------------
-- Add records to hoa
-- -----------------------------------------------------
INSERT INTO	hoa (hoa_name, office_add, year_est, website, subd_name, dues_collection)
	VALUES	('Animo HOA', 10000020, 1911, 'www.animohoa.ph', 'Animo Green Homes', '15'),
			('Archer’s HOA', 10000024, 1999, 'www.archershoa.ph', 'Archer’s Residences', '10'),
			('Berde 1 HOA', 10000025, 2005, 'www.berdehoa.ph', 'Berde Subdivision 1', '20');

-- -----------------------------------------------------
-- Add records to individual
-- -----------------------------------------------------
INSERT INTO	individual (individual_id, indiv_lastname, indiv_firstname, indiv_mi, email, birthday, gender, fb_url, picture, indiv_type)
	VALUES	(2023202410, 'Dela Cruz', 'Juan', 'R', 'juandelacruz@gmail.com', '2000-01-05', 'M', 'jdlcruz', 'pic1.jpg', 'R'),
			(2023202411, 'Dela Cruz', 'Juanita', 'G', 'juanitadelacruz@gmail.com', '2002-10-10', 'F', 'juanitadlc', 'pic2.jpg', 'HR'),
			(2023202412, 'Rizal', 'Jose', 'P', 'joserizal@gmail.com', '1961-06-19', 'M', 'jprizal', 'pic3.jpg', 'HR'),
			(2023202413, 'Bonifacio', 'Andres', 'A', 'andresbonifacio@gmail.com', '1983-11-30', 'M', NULL, 'pic4.jpg', 'R'),
			(2023202414, 'Silang', 'Gabriela', 'R', 'gabrielasilang@gmail.com', '1991-03-19', 'F', 'grsilang', 'pic5.jpg', 'HR'),
			(2023202415, 'Luna', 'Juan', 'M', 'juanluna@gmail.com', '1991-03-19', 'M', 'jluna', 'pic5.jpg', 'H'),
			(2023202416, 'Aguinaldo', 'Emilio', ' ', 'eaguinaldo@yahoo.com', '1969-03-22', 'M', 'eaguin', 'pic6.jpg','HR'),
			(2023202417, 'Felipe', 'Julian', 'R', 'julian_felipe@hotmail.com', '1969-01-28', 'M', NULL, 'pic7.jpg','H'),
			(2023202418, 'Agoncillo', 'Lorenza', 'M', 'flagoncillo@gmail.com', '1990-09-05', 'F', 'loragoncillo', 'pic6.jpg','R');

-- -----------------------------------------------------
-- Add records to homeowner
-- -----------------------------------------------------
INSERT INTO	homeowner (homeowner_id, years_ho, undertaking, membership, is_resident, current_add, other_add, other_email, hoa_name, individual_id)
	VALUES	(30011, 5, 1, 1, 1, 10000021, NULL, NULL, 'Animo HOA', 2023202410),
			(30012, 12, 1, 1, 1, 10000022, NULL, NULL, 'Animo HOA', 2023202412),
			(30013, 10, 1, 1, 1, 10000023, NULL, NULL, 'Animo HOA', 2023202414),
            (30014, 6, 1, 1, 1, 10000024, NULL, NULL, 'Animo HOA', 2023202415),
            (30015, 15, 1, 1, 1, 10000025, NULL, NULL, 'Animo HOA', 2023202416),
            (30016, 16, 1, 1, 1, 10000026, NULL, NULL, 'Animo HOA', 2023202417);

-- -----------------------------------------------------
-- Add records to officer_positions
-- -----------------------------------------------------
INSERT INTO	officer_positions (position_name)
	VALUES	('President'),
			('Vice-President'),
			('Secretary'),
			('Treasurer'),
			('Auditor');

-- -----------------------------------------------------
-- Add records to elections
-- -----------------------------------------------------
INSERT INTO	elections (elec_date, venue, quorum, witness_lastname, witness_firstname, witness_mi, witness_mobile, hoa_name)
	VALUES	('2022-01-12', 'Animo Clubhouse', 0, 'Aquino', 'Melchora', 'B',9172001434, 'Animo HOA'),
			('2022-11-19', 'Animo Clubhouse', 0, 'Del Pilar', 'Gregorio', 'A',9224657809, 'Animo HOA'),
			('2022-11-26', 'Animo Clubhouse', 1, 'Balagtas', 'Francisco', 'K',9224657809, 'Animo HOA');

-- -----------------------------------------------------
-- Add records to hoa_officer
-- -----------------------------------------------------
INSERT INTO	hoa_officer (officer_id, homeowner_id, position_name, office_start, office_end, elec_date)
	VALUES	(99901, 30012, 'President', '2023-01-09','2024-01-07','2022-11-26'),
			(99902, 30013, 'Secretary', '2023-01-09','2024-01-07','2022-11-26'),
            (99903, 30014, 'Treasurer', '2023-01-09', '2024-01-07', '2022-11-26'), 
			(99904, 30015, 'Vice-President', '2023-01-09', '2024-01-07', '2022-11-26'),
			(99905, 30016, 'Auditor', '2023-01-09', '2024-01-07', '2022-11-26');

-- -----------------------------------------------------
-- Add records to hoa_files
-- -----------------------------------------------------
INSERT INTO	hoa_files (file_id, file_name, description, location, file_type, date_submitted, file_owner, file_uploader, hoa_name)
	VALUES	(555556661,'bylaws.pdf', 'notarized by-laws','D:/Animo HOA Documents/', 'pdf', '2020-03-17', 'Jose Rizal', 99901, 'Animo HOA'),
			(555556662,'ABC1234-ORCR2022.pdf', 'ABC1234 ORCR 2022','D:/Animo HOA Documents/Vehicle Registration/', 'pdf', '2022-05-06', 'Juan Dela Cruz', 99902, 'Animo HOA'),
            (555556663,'DEF6789-ORCR2022.pdf', 'DEF6789 ORCR 2022','D:/Animo HOA Documents/Vehicle Registration/', 'pdf', '2022-05-10', 'Emilio Aguinaldo', 99902, 'Animo HOA'),
            (555556669, 'donation_form_01.pdf', 'Donation Form 01', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-08-25', 'Mariano Ponce', 99901, 'Animo HOA'),
			(555556670, 'donation_form_02.pdf', 'Donation Form 02', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-08-27', 'Antonio Luna', 99901, 'Animo HOA'),
			(555556671, 'donation_form_03.pdf', 'Donation Form 03', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-08-30', 'Josefa Llanes Escoda', 99902, 'Animo HOA'),
			(555556672, 'donation_form_04.pdf', 'Donation Form 04', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-02', 'Hilaria Del Rosario', 99902, 'Animo HOA'),
			(555556673, 'donation_form_05.pdf', 'Donation Form 05', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-05', 'Jose Rizal', 99901, 'Animo HOA'),
			(555556674, 'donation_form_06.pdf', 'Donation Form 06', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-08', 'Mariano Ponce', 99901, 'Animo HOA'),
			(555556675, 'donation_form_07.pdf', 'Donation Form 07', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-10', 'Antonio Luna', 99901, 'Animo HOA'),
			(555556676, 'donation_form_08.pdf', 'Donation Form 08', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-13', 'Josefa Llanes Escoda', 99902, 'Animo HOA'),
			(555556677, 'donation_form_09.pdf', 'Donation Form 09', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-15', 'Hilaria Del Rosario', 99902, 'Animo HOA'),
			(555556678, 'donation_form_10.pdf', 'Donation Form 10', 'D:/Animo HOA Documents/Donation Forms/', 'pdf', '2022-09-18', 'Jose Rizal', 99901, 'Animo HOA');

-- -----------------------------------------------------
-- Add records to property
-- -----------------------------------------------------
INSERT INTO	property (property_code, size, turnover, property_type, homeowner_id)
	VALUES	('B35L02', 300.00, '2018-02-15', 'R', 30011),
			('B11L08', 180.00, '2011-03-16', 'R', 30012),
            ('B42L09', 225.00, '2013-04-17', 'R', 30013),
            ('B25L10', 250.00, '2017-05-18', 'R', 30014),
			('B39L13', 180.00, '2020-06-19', 'C', 30014);

-- -----------------------------------------------------
-- Add records to household
-- -----------------------------------------------------
INSERT INTO	household (household_id)
	VALUES	(42001),
			(42002),
			(42003),
            (42004),
            (42005), 
			(42006),
			(42007),
			(42008),
			(42009),
			(42010);

-- -----------------------------------------------------
-- Add records to resident
-- -----------------------------------------------------
INSERT INTO	resident (resident_id, is_renter, relation_ho, undertaking, household_id, authorized_resident, individual_id)
	VALUES	(40011, 0, 'husband', 1, 42001, 1, 2023202410),
			(40012, 0, 'homeowner', 1, 42001, 1, 2023202411),
            (40013, 0, 'homeowner', 1, 42002, 1, 2023202412),
            (40014, 1, 'none', 1, 42003, 0, 2023202413),
            (40015, 0, 'homeowner', 1, 42004, 1, 2023202414),
            (40016, 1, 'none', 1, 42005, 0, 2023202415), 
			(40017, 0, 'homeowner', 1, 42006, 1, 2023202416),
			(40018, 0, 'none', 1, 42007, 1, 2023202417),
			(40019, 1, 'none', 1, 42008, 0, 2023202418);

-- -----------------------------------------------------
-- Add records to receipt
-- -----------------------------------------------------
INSERT INTO	receipt (or_no, transact_date, total_amount)
	VALUES	(202379991,'2023-07-20',1500.00),
			(202379992,'2023-08-25',2250.00),
            (202379993,'2023-09-01',830.00);

-- -----------------------------------------------------
-- Add records to resident_idcard
-- -----------------------------------------------------
INSERT INTO	resident_idcard (resident_idcardno, date_requested, request_reason, date_issued, authorizing_officer, or_no, amount_paid, id_status, resident_id)
	VALUES	('ANIMO22001', '2022-01-30', 'New ID', '2022-02-04', 99902, NULL, 0.00, 'Active', 40013),
			('ANIMO22002', '2022-02-20', 'New ID', '2022-02-04', 99902, NULL, 0.00, 'Active', 40011),
            ('ANIMO22003', '2022-02-20', 'New ID', '2022-02-04', 99902, NULL, 0.00, 'Active', 40012),
            ('ANIMO22004', '2022-03-15', 'New ID', '2022-03-20', 99902, NULL, 0.00, 'Active', 40014), 
			('ANIMO22005', '2022-03-25', 'New ID', '2022-03-30', 99902, NULL, 0.00, 'Active', 40015);

-- -----------------------------------------------------
-- Add records to mobile
-- -----------------------------------------------------
INSERT INTO	mobile (mobile_no, individual_id)
	VALUES	(9175459870, 2023202410),
			(9173110229, 2023202411),
            (9207639255, 2023202412),
            (9226974142, 2023202413),
            (9181008621, 2023202414),
            (9224489773, 2023202415);

-- -----------------------------------------------------
-- Add records to vehicle
-- -----------------------------------------------------
INSERT INTO	vehicle (plate_no, owner_lastname, owner_firstname, owner_mi, resident_id, vehicle_class, vehicle_type, date_registered, reg_fee, or_no)
	VALUES	('ABC1234', 'Dela Cruz', 'Juan', 'R', 40011, 'P', 'SUV', '2023-07-20', 150.00, 202379991),
			('DEF6789', 'Aguinaldo', 'Emilio', 'N', NULL, 'C', 'truck', '2023-09-01', 500.00, 202379992);

-- -----------------------------------------------------
-- Add records to orcr
-- -----------------------------------------------------
INSERT INTO	orcr (orcr, plate_no, years_valid, orcr_file)
	VALUES	('ORCR-109634885P', 'ABC1234', '2023-02-20 to 2024-02-19', 555556662),
			('ORCR-217459009C', 'DEF6789', '2023-06-25 to 2024-06-24', 555556663);

-- -----------------------------------------------------
-- Add records to sticker
-- -----------------------------------------------------
INSERT INTO	sticker (sticker_id, year_valid, plate_no, owner_type, authorizing_officer, date_acquired, amount_paid, or_no)
	VALUES	(202300100, 2023, 'ABC1234', 'R', 99902, '2023-07-20', 0.00, NULL),
			(202300600, 2023, 'DEF6789', 'NR', 99902, '2023-09-01', 1500.00, 202379992);

-- -----------------------------------------------------
-- Add records to hoaofficer_sched
-- -----------------------------------------------------
INSERT INTO	hoaofficer_sched (officer_id, sched_time, avail_Mon, avail_Tue, avail_Wed, avail_Thu, avail_Fri, avail_Sat, avail_Sun)
	VALUES	(99901, 'AM', 1, 1, 1, 1, 1, 1, 1),
			(99902, 'PM', 1, 1, 1, 1, 1, 1, 1);

-- -----------------------------------------------------
-- Add records to asset
-- -----------------------------------------------------
INSERT INTO	asset (asset_id, asset_name, description, date_acquired, for_rent, asset_value, asset_type, asset_status, location, location_x, location_y, hoa_name, asset_container)
	VALUES	('P000000001', 'Animo HOA Clubhouse', 'clubhouse', '1995-10-06', 1, 18000000.00, 'P', 'W', '24 De La Salle St.', 123.4567, 234.5678, 'Animo HOA', NULL),
			('E000000001', 'LED projector', 'projector', '2021-12-01', 1, 75000.00, 'E', 'W', '24 De La Salle St.', 123.4567, 234.5678, 'Animo HOA', 'P000000001'),
            ('P000000002', 'Animo HOA Basketball Court', 'basketball court', '1996-04-01', 1, 9000000.00, 'P', 'W', '01 Benilde St.', 543.2100, 765.4321, 'Animo HOA', NULL);

-- -----------------------------------------------------
-- Add records to commercial_prop
-- -----------------------------------------------------
INSERT INTO	commercial_prop (property_code, commercial_type, commercial_maxten)
	VALUES	('B39L13','M',10);

-- -----------------------------------------------------
-- Add records to residential_prop
-- -----------------------------------------------------
INSERT INTO	residential_prop (property_code, household_id)
	VALUES	('B35L02', 42001),
			('B11L08', 42002),
            ('B42L09', 42003),
            ('B25L10', 42004);

-- -----------------------------------------------------
-- Add records to monthly_duebill
-- -----------------------------------------------------
	INSERT INTO	monthly_duebill (monthly_duebillid, date_generated, household_id)
	VALUES	(10001, '2023-11-01', 42001), 
			(10002, '2023-11-01', 42002),
			(10003, '2023-11-01', 42003),
			(10004, '2023-11-01', 42004),
            (10005, '2023-11-01', 42005),
			(10006, '2023-11-01', 42006),
			(10007, '2023-11-01', 42007),
			(10008, '2023-11-01', 42008),
			(10009, '2023-11-01', 42009),
			(10010, '2023-11-01', 42010);
            
-- -----------------------------------------------------
-- Add records to payments
-- -----------------------------------------------------
INSERT INTO	payments (or_number, payment_date, amount_paid, paying_resident, receiving_officer)
	VALUES	('PMT01', '2023-11-05', 580.00, 40011, 99901),
			('PMT02', '2023-11-05', 585.00, 40012, 99902),
			('PMT03', '2023-11-05', 545.00, 40013, 99903),
			('PMT04', '2023-11-05', 625.00, 40014, 99904),
			('PMT05', '2023-11-05', 650.00, 40015, 99905),
			('PMT06', '2023-11-05', 535.00, 40016, 99903), 
			('PMT07', '2023-11-05', 480.00, 40017, 99904), 
			('PMT08', '2023-11-05', 490.00, 40018, 99905), 
			('PMT09', '2023-11-05', 470.00, 40019, 99901);
-- -----------------------------------------------------
-- Add records to household_account
-- -----------------------------------------------------
INSERT INTO household_account (household_id, outstanding_balance)
	VALUES (42001, 0.0),
		   (42002, -300.0),
           (42003, 1000.0), 
           (42004, -10.0),
           (42005, 0.0),
           (42006, 40.0),
           (42007, 2000.0),
           (42008, -1200.0),
           (42009, 5.5),
           (42010, 9.0);
-- -----------------------------------------------------
-- Add records to dues
-- -----------------------------------------------------
INSERT INTO dues (due_id, due_desc, due_amount, date_incurred, household_id)
	VALUES (111222, 'Penalty', 2000.00, '2023-11-05', 42001),
		   (111223, 'Property damage', 100.00, '2023-11-02', 42002),
           (111224, 'Property damage', 100.00, '2023-11-02', 42005),
           (111225, 'Penalty', 1300.00, '2023-11-10', 42009),
           (111226, 'Basic', 100.00, '2023-11-02', 42002),
           (111227, 'Asset rehab', 100.00, '2023-11-06', 42004),
           (111228, 'School bus service', 100.00, '2023-11-04', 42005),
           (111229, 'Basic', 100.00, '2023-11-02', 42010),
           (111230, 'Property damage', 100.00, '2023-11-02', 42006);
-- -----------------------------------------------------
-- Add records to incident
-- -----------------------------------------------------
INSERT INTO	incident (incident_id, date, description, rulenum_violated, investigating_officer, seconding_officer)
	VALUES	(30001, '2023-01-15', 'Noise Complaint', 1, 99901, 99902), 
			(30002, '2023-02-02', 'Unauthorized Parking', 2, 99902, 99901),
			(30003, '2023-02-10', 'Trash Disposal Violation', 3, 99901, 99902),
			(30004, '2023-02-20', 'Pet Policy Violation', 4, 99902, 99901),
			(30005, '2023-03-05', 'Loud Party Complaint', 5, 99901, 99902),
			(30006, '2023-03-12', 'Unauthorized Renovation', 6, 99902, 99901),
			(30007, '2023-04-01', 'Graffiti Found', 7, 99901, 99902),
			(30008, '2023-04-10', 'Pool Rule Violation', 8, 99902, 99901),
			(30009, '2023-04-25', 'Late Rent Payment', 9, 99901, 99902),
			(30010, '2023-05-02', 'Unauthorized Guest', 10, 99902, 99901);
-- -----------------------------------------------------
-- Add records to person_involved
-- -----------------------------------------------------
INSERT INTO	person_involved (person_involvedid, first_name, middle_name, last_name, pi_type, penalty_imposed, resident_id, incident_id)    
	VALUES	(35001, 'Juan', 'R', 'Dela Cruz', 'R', 50.00, 40011, 30001), 
			(35002, 'Juanita', 'G', 'Dela Cruz', 'R', 30.00, 40012, 30002),
			(35003, 'Jose', 'P', 'Rizal', 'R', 30.00, 40013, 30002),
			(35004, 'Andres', 'A', 'Bonifacio', 'R', 20.00, 40014, 30003),
			(35005, 'Gabriela', 'R', 'Silang', 'R', 20.00, 40015, 30003),
			(35006, 'Juan', 'M', 'Luna', 'R', 20.00, NULL, 30003),
			(35007, 'John', 'R', 'Smith', 'NR', 40.00, NULL, 30004),
			(35008, 'Jane', 'G', 'Smith', 'NR', 40.00, NULL, 30008),
			(35009, 'Maria', 'P', 'Garcia', 'NR', 50.00, NULL, 30009),
			(35010, 'Carlos', 'A', 'Garcia', 'NR', 50.00, NULL, 30010);
-- -----------------------------------------------------
-- Add records to evidence
-- -----------------------------------------------------
INSERT INTO	evidence (evidence_id, name, description, file_name, submitting_resident, accepting_officer, date_submitted, incident_id)
	VALUES	(50001, 'Picture of Graffiti', 'Found on building wall', 'graffiti.jpg', 40011, 99901, '2023-01-15', 30001), 
			(50002, 'Unauthorized Parking Vehicle', 'Unauthorized vehicle parked in restricted area', 'parking.jpg', 40013, 99902, '2023-01-16', 30002),
			(50003, 'Trash Bags in Common Area', 'Trash bags left in common area', 'trash.jpg', 40011, 99901, '2023-01-17', 30003),
			(50004, 'Unauthorized Pet in Premises', 'Unauthorized pet inside the building', 'pet.jpg', 40014, 99902, '2023-01-18', 30004),
			(50005, 'Noise Complaint Audio Clip', 'Loud party complaint', 'noise.wav', 40012, 99901, '2023-01-19', 30005);
    
-- -----------------------------------------------------
-- Add records to incentives_anddiscounts
-- -----------------------------------------------------
INSERT INTO	incentives_anddiscounts (incentives_anddiscounts_id, bill_period, awarded_resident, classification, amount_orrate, reason, authorizing_officer)
	VALUES	(70001, 10001, 40011, 'I', 20.00, 'Exemplary Behavior', 99901), 
			(70002, 10002, 40012, 'D', 10.00, 'Early Payment', 99902),
			(70003, 10003, 40013, 'I', 15.00, 'Loyalty Reward', 99901),
			(70004, 10004, 40014, 'D', 5.00, 'Neighborly Support', 99902);

-- -----------------------------------------------------
-- Add records to nonmonetary_incentives
-- -----------------------------------------------------
INSERT INTO	nonmonetary_incentives (incentive_id, description, validity_startdate, validity_enddate, status, reason, authorizing_officer, awarded_resident)
	VALUES	(80011, 'Free Art Workshop Pass', '2023-01-01', '2023-12-31', 'Valid', 'Creative Skill Development Program', 99901, 40011),
			(80012, 'Community Clean-up Initiative', '2023-01-15', '2023-12-31', 'Expired', 'Neighborhood Cleanup Drive', 99902, 40012),
			(80013, 'Gardening Workshop Access', '2023-02-01', '2023-12-31', 'Valid', 'Green Thumb Workshop Series', 99901, 40013),
			(80014, 'Complimentary Yoga Classes', '2023-02-15', '2023-12-31', 'Availed', 'Holistic Health Program', 99902, 40014),
			(80015, 'Community Cookbook Contributor', '2023-03-01', '2023-12-31', 'Cancelled', 'Culinary Creations Collaboration', 99901, 40015),
			(80016, 'Art Installation Showcase', '2023-03-15', '2023-12-31', 'Valid', 'Community Art Exhibit Feature', 99902, 40011),
			(80017, 'Recognition for Community Safety', '2023-04-01', '2023-12-31', 'Valid', 'Neighborhood Watch Program', 99901, 40012),
			(80018, 'Digital Art Showcase Opportunity', '2023-04-15', '2023-12-31', 'Valid', 'Creative Digital Expression Platform', 99902, 40013),
			(80019, 'Tree Planting Project Support', '2023-05-01', '2023-12-31', 'Valid', 'Greening the Community Initiative', 99901, 40014),
			(80020, 'Active Participation in Events', '2023-05-15', '2023-12-31', 'Valid', 'Community Event Involvement Recognition', 99902, 40015);
-- -----------------------------------------------------
-- Add records to donation
-- -----------------------------------------------------
INSERT INTO	donation (donation_id, donor_firstname, donor_middlename, donor_lastname, donor_type, donor_address, donation_date, donation_form, status, accepting_officer)
	VALUES	(60001, 'Juan', 'R', 'Dela Cruz', 'R', 10000020, '2023-01-05', 555556663, 'Existing', 99901),
            (60002, 'Juanita', 'G', 'Dela Cruz', 'R', 10000021, '2023-01-10', 555556662, 'Deleted', 99902),
            (60003, 'Jose', 'P', 'Rizal', 'R', 10000022, '2023-01-15', 555556678, 'Existing', 99902),
            (60004, 'Andres', 'A', 'Bonifacio', 'R', 10000023, '2023-02-01', 555556677, 'Existing', 99901),
            (60005, 'Gabriela', 'R', 'Silang', 'R', 10000024, '2023-02-05', 555556670, 'Existing', 99902),
            (60006, 'Juan', 'M', 'Luna', 'R', 10000025, '2023-02-10', 555556669, 'Existing', 99901),
            (60007, 'Carlos', 'P', 'Garcia', 'NR', 10000026, '2023-02-15', 555556670, 'Deleted', 99902);
-- -----------------------------------------------------
-- Add records to donation_picture
-- -----------------------------------------------------
INSERT INTO	donation_picture (donation_pictureid, picture, donation_id)
	VALUES	(62001, 'receipt_2023.jpg', 60001), 
            (62002, 'thank_you_note.jpg', 60002),
            (62003, 'certificate_of_appreciation.jpg', 60002),
            (62004, 'donor_group_photo.jpg', 60002),
            (62005, 'donation_event_snapshot.jpg', 60005),
            (62006, 'donation_received.jpg', 60006),
            (62007, 'donor_thank_you_card.jpg', 60007);
-- -----------------------------------------------------
-- Add records to donation_item
-- -----------------------------------------------------
INSERT INTO	donation_item (donation_itemid, amount, description, donation_id)
	VALUES	(65001, 100.00, 'Cash donation for school supplies', 60001), 
            (65002, 250.00, 'Food donation for community event', 60002),
            (65003, 150.00, 'Clothing donation for winter drive', 60003),
            (65004, 500.00, 'Cash donation for medical expenses', 60004),
            (65005, 300.00, 'Toy donation for children in need', 60005),
            (65006, 200.00, 'Book donation for local library', 60006),
            (65007, 350.00, 'Cash donation for disaster relief', 60007),
			(65011, 220.00, 'Clothing donation for local shelter', 60001);
