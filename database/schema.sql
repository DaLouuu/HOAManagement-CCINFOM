-- -----------------------------------------------------
-- Schema hoa_db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS hoa_db;
CREATE SCHEMA IF NOT EXISTS hoa_db;
USE hoa_db;

-- -----------------------------------------------------
-- Table regions
-- -----------------------------------------------------
DROP TABLE IF EXISTS regions;
CREATE TABLE IF NOT EXISTS regions (
  region		VARCHAR(45) NOT NULL,
  PRIMARY KEY	(`region`)
);

-- -----------------------------------------------------
-- Table provinces
-- -----------------------------------------------------
DROP TABLE IF EXISTS provinces;
CREATE TABLE IF NOT EXISTS provinces (
  province_name VARCHAR(45) NOT NULL,
  region 		VARCHAR(45) NOT NULL,
  PRIMARY KEY 	(province_name),
  INDEX 		(region ASC),
  FOREIGN KEY	(region)
    REFERENCES	regions(region)
);

-- -----------------------------------------------------
-- Table cities
-- -----------------------------------------------------
DROP TABLE IF EXISTS cities;
CREATE TABLE IF NOT EXISTS cities (
  city			VARCHAR(45) NOT NULL,
  province		VARCHAR(45) NOT NULL,
  PRIMARY KEY	(city),
  INDEX			(province ASC),
  FOREIGN KEY	(province)
    REFERENCES	provinces(province_name)
);

-- -----------------------------------------------------
-- Table zipcodes
-- -----------------------------------------------------
DROP TABLE IF EXISTS zipcodes;
CREATE TABLE IF NOT EXISTS zipcodes (
  zipcode		INT NOT NULL,
  brgy			VARCHAR(45) NOT NULL,
  city			VARCHAR(45) NOT NULL,
  province		VARCHAR(45) NOT NULL,
  PRIMARY KEY	(zipcode),
  INDEX			(city ASC),
  INDEX			(province ASC),
  FOREIGN KEY	(city)
    REFERENCES	cities(city),
  FOREIGN KEY	(province)
    REFERENCES	provinces(province_name)
);

-- -----------------------------------------------------
-- Table address
-- -----------------------------------------------------
DROP TABLE IF EXISTS address;
CREATE TABLE IF NOT EXISTS address (
  address_id	INT NOT NULL,
  stno			VARCHAR(45) NOT NULL,
  stname		VARCHAR(45) NOT NULL,
  brgy			VARCHAR(45) NOT NULL,
  city			VARCHAR(45) NOT NULL,
  province		VARCHAR(45) NOT NULL,
  zipcode		INT NOT NULL,
  x_coord		FLOAT NOT NULL,
  y_coord		FLOAT NOT NULL,
  PRIMARY KEY	(address_id),
  INDEX			(city ASC),
  INDEX			(province ASC),
  INDEX			(zipcode ASC),
  FOREIGN KEY	(city)
    REFERENCES	cities(city),
  FOREIGN KEY	(province)
    REFERENCES	provinces(province_name),
  FOREIGN KEY	(zipcode)
    REFERENCES	zipcodes(zipcode)
);

-- -----------------------------------------------------
-- Table hoa
-- -----------------------------------------------------
DROP TABLE IF EXISTS hoa;
CREATE TABLE IF NOT EXISTS hoa (
  hoa_name			VARCHAR(45) NOT NULL,
  office_add		INT NOT NULL,
  year_est			INT(4) NOT NULL,
  website			VARCHAR(45) NULL,
  subd_name			VARCHAR(45) NOT NULL,
  dues_collection	VARCHAR(45) NOT NULL,
  PRIMARY KEY		(hoa_name),
  UNIQUE INDEX		(subd_name ASC),
  INDEX				(office_add ASC),
  FOREIGN KEY		(office_add)
    REFERENCES		address(address_id)
);

-- -----------------------------------------------------
-- Table individual
-- -----------------------------------------------------
DROP TABLE IF EXISTS individual;
CREATE TABLE IF NOT EXISTS individual (
  individual_id		INT NOT NULL,
  indiv_lastname	VARCHAR(45) NOT NULL,
  indiv_firstname	VARCHAR(45) NOT NULL,
  indiv_mi			VARCHAR(45) NOT NULL,
  email				VARCHAR(45) NOT NULL,
  birthday			DATE NOT NULL,
  gender			ENUM('M', 'F') NOT NULL,
  fb_url			VARCHAR(45) NULL,
  picture			BLOB NOT NULL,
  indiv_type		ENUM('R', 'H', 'HR') NOT NULL,
  PRIMARY KEY		(individual_id),
  UNIQUE INDEX		(email ASC),
  UNIQUE INDEX		(fb_url ASC)
);

-- -----------------------------------------------------
-- Table homeowner
-- -----------------------------------------------------
DROP TABLE IF EXISTS homeowner;
CREATE TABLE IF NOT EXISTS homeowner (
  homeowner_id	INT(5) NOT NULL,
  years_ho		INT(2) NOT NULL,
  undertaking	TINYINT(1) NOT NULL,
  membership	TINYINT(1) NOT NULL,
  is_resident	TINYINT(1) NOT NULL,
  current_add	INT NOT NULL,
  other_add		INT NULL,
  other_email	VARCHAR(45) NULL,
  hoa_name		VARCHAR(45) NOT NULL,
  individual_id	INT NOT NULL,
  PRIMARY KEY	(homeowner_id),
  INDEX			(hoa_name ASC),
  INDEX			(current_add ASC),
  INDEX			(other_add ASC),
  INDEX			(individual_id ASC),
  FOREIGN KEY	(hoa_name)
    REFERENCES	hoa(hoa_name),
  FOREIGN KEY	(current_add)
    REFERENCES	address(address_id),
  FOREIGN KEY	(other_add)
    REFERENCES	address(address_id),
  FOREIGN KEY	(individual_id)
    REFERENCES	individual(individual_id)
);

-- -----------------------------------------------------
-- Table officer_positions
-- -----------------------------------------------------
DROP TABLE IF EXISTS officer_positions;
CREATE TABLE IF NOT EXISTS officer_positions (
  position_name	VARCHAR(25) NOT NULL,
  PRIMARY KEY	(position_name)
);

-- -----------------------------------------------------
-- Table elections
-- -----------------------------------------------------
DROP TABLE IF EXISTS elections;
CREATE TABLE IF NOT EXISTS elections (
  elec_date			DATE NOT NULL,
  venue				VARCHAR(45) NOT NULL,
  quorum			TINYINT(1) NOT NULL,
  witness_lastname	VARCHAR(45) NOT NULL,
  witness_firstname	VARCHAR(45) NOT NULL,
  witness_mi		VARCHAR(45) NOT NULL,
  witness_mobile	BIGINT(10) NOT NULL,
  hoa_name			VARCHAR(45) NOT NULL,
  PRIMARY KEY		(elec_date),
  FOREIGN KEY		(hoa_name)
    REFERENCES		hoa(hoa_name)
);

-- -----------------------------------------------------
-- Table hoa_officer
-- -----------------------------------------------------
DROP TABLE IF EXISTS hoa_officer;
CREATE TABLE IF NOT EXISTS hoa_officer (
  officer_id	INT(5) NOT NULL,
  homeowner_id	INT(5) NOT NULL,
  position_name	VARCHAR(25) NOT NULL,
  office_start	DATE NOT NULL,
  office_end	DATE NOT NULL,
  elec_date		DATE NOT NULL,
  PRIMARY KEY	(officer_id),
  INDEX			(homeowner_id ASC),
  INDEX			(position_name ASC),
  INDEX			(elec_date ASC),
  FOREIGN KEY	(homeowner_id)
    REFERENCES	homeowner(homeowner_id),
  FOREIGN KEY	(position_name)
    REFERENCES	officer_positions(position_name),
  FOREIGN KEY	(elec_date)
    REFERENCES	elections(elec_date)
);

-- -----------------------------------------------------
-- Table hoa_files
-- -----------------------------------------------------
DROP TABLE IF EXISTS hoa_files;
CREATE TABLE IF NOT EXISTS hoa_files (
  file_id			INT NOT NULL,
  file_name			VARCHAR(45) NOT NULL,
  description		VARCHAR(45) NOT NULL,
  location			VARCHAR(45) NOT NULL,
  file_type			ENUM('document', 'spreadsheet', 'pdf', 'image', 'others') NOT NULL,
  date_submitted	DATETIME NOT NULL,
  file_owner		VARCHAR(45) NOT NULL,
  file_uploader		INT(5) NOT NULL,
  hoa_name			VARCHAR(45) NOT NULL,
  PRIMARY KEY		(file_id),
  INDEX				(hoa_name ASC),
  INDEX				(file_uploader ASC),
  FOREIGN KEY		(hoa_name)
    REFERENCES		hoa(hoa_name),
  FOREIGN KEY		(file_uploader)
    REFERENCES		hoa_officer(officer_id)
);

-- -----------------------------------------------------
-- Table property
-- -----------------------------------------------------
DROP TABLE IF EXISTS property;
CREATE TABLE IF NOT EXISTS property (
  property_code		VARCHAR(6) NOT NULL,
  size				DECIMAL NOT NULL,
  turnover			DATE NOT NULL,
  property_type		ENUM('R', 'C') NOT NULL,
  homeowner_id		INT(5) NOT NULL,
  PRIMARY KEY		(property_code),
  INDEX				(homeowner_id ASC),
  FOREIGN KEY		(homeowner_id)
    REFERENCES		homeowner(homeowner_id)
);


-- -----------------------------------------------------
-- Table household
-- -----------------------------------------------------
DROP TABLE IF EXISTS household;
CREATE TABLE IF NOT EXISTS household (
  household_id		INT(5) NOT NULL,
  PRIMARY KEY		(household_id)
);

-- -----------------------------------------------------
-- Table resident
-- -----------------------------------------------------
DROP TABLE IF EXISTS resident;
CREATE TABLE IF NOT EXISTS resident (
  resident_id			INT(5) NOT NULL,
  is_renter				TINYINT(1) NOT NULL,
  relation_ho			VARCHAR(45) NOT NULL,
  undertaking			TINYINT(1) NOT NULL,
  household_id			INT(5) NOT NULL,
  authorized_resident	TINYINT(1) NOT NULL,
  individual_id			INT NOT NULL,
  PRIMARY KEY			(resident_id),
  INDEX					(household_id ASC),
  INDEX					(individual_id ASC),
  FOREIGN KEY			(household_id)
    REFERENCES			household(household_id),
  FOREIGN KEY			(individual_id)
    REFERENCES			individual(individual_id)
);

-- -----------------------------------------------------
-- Table receipt
-- -----------------------------------------------------
DROP TABLE IF EXISTS receipt;
CREATE TABLE IF NOT EXISTS receipt (
  or_no			INT NOT NULL,
  transact_date DATETIME NOT NULL,
  total_amount	FLOAT NOT NULL,
  PRIMARY KEY	(or_no)
);

-- -----------------------------------------------------
-- Table resident_idcard
-- -----------------------------------------------------
DROP TABLE IF EXISTS resident_idcard;
CREATE TABLE IF NOT EXISTS resident_idcard (
  resident_idcardno		VARCHAR(10) NOT NULL,
  date_requested		DATETIME NOT NULL,
  request_reason		VARCHAR(45) NOT NULL,
  date_issued			DATETIME NOT NULL,
  authorizing_officer	VARCHAR(45) NOT NULL,
  or_no					INT NULL,
  amount_paid			FLOAT NOT NULL,
  id_status				ENUM('Active', 'Inactive', 'Lost') NOT NULL,
  resident_id			INT(5) NOT NULL,
  PRIMARY KEY			(resident_idcardno),
  INDEX					(resident_id ASC),
  INDEX					(or_no ASC),
  FOREIGN KEY			(resident_id)
    REFERENCES			resident(resident_id),
  FOREIGN KEY			(or_no)
    REFERENCES			receipt (or_no)
);

-- -----------------------------------------------------
-- Table mobile
-- -----------------------------------------------------
DROP TABLE IF EXISTS mobile;
CREATE TABLE IF NOT EXISTS mobile (
  mobile_no		BIGINT(10) NOT NULL,
  individual_id INT NOT NULL,
  PRIMARY KEY	(mobile_no),
  INDEX			(individual_id ASC),
  FOREIGN KEY	(individual_id)
    REFERENCES	individual(individual_id)
);

-- -----------------------------------------------------
-- Table vehicle
-- -----------------------------------------------------
DROP TABLE IF EXISTS vehicle;
CREATE TABLE IF NOT EXISTS vehicle (
  plate_no			VARCHAR(7) NOT NULL,
  owner_lastname	VARCHAR(45) NOT NULL,
  owner_firstname	VARCHAR(45) NOT NULL,
  owner_mi			VARCHAR(45) NOT NULL,
  resident_id		INT(5) NULL,
  vehicle_class		ENUM('P', 'C') NOT NULL,
  vehicle_type		ENUM('sedan', 'SUV', 'MPV/AUV', 'van', 'truck', 'motorcycle/scooter', 'others') NOT NULL,
  date_registered	DATETIME NOT NULL,
  reg_fee			DECIMAL NOT NULL,
  or_no				INT NOT NULL,
  PRIMARY KEY		(plate_no),
  INDEX				(resident_id ASC),
  INDEX				(or_no ASC),
  FOREIGN KEY		(resident_id)
    REFERENCES		resident(resident_id),
  FOREIGN KEY		(or_no)
    REFERENCES		receipt(or_no)
);

-- -----------------------------------------------------
-- Table orcr
-- -----------------------------------------------------
DROP TABLE IF EXISTS orcr;
CREATE TABLE IF NOT EXISTS orcr (
  orcr			VARCHAR(45) NOT NULL,
  plate_no		VARCHAR(7) NOT NULL,
  years_valid	VARCHAR(45) NOT NULL,
  orcr_file		INT NOT NULL,
  PRIMARY KEY	(orcr),
  INDEX			(plate_no ASC),
  INDEX			(orcr_file ASC),
  FOREIGN KEY	(plate_no)
    REFERENCES	vehicle(plate_no),
  FOREIGN KEY	(orcr_file)
    REFERENCES	hoa_files(file_id)
);

-- -----------------------------------------------------
-- Table sticker
-- -----------------------------------------------------
DROP TABLE IF EXISTS sticker;
CREATE TABLE IF NOT EXISTS sticker (
  sticker_id			INT NOT NULL,
  year_valid			INT(4) NOT NULL,
  plate_no				VARCHAR(7) NOT NULL,
  owner_type			ENUM('R', 'NR') NOT NULL,
  authorizing_officer	INT(5) NOT NULL,
  date_acquired			DATETIME NOT NULL,
  amount_paid			DECIMAL NOT NULL,
  or_no					INT NULL,
  PRIMARY KEY			(sticker_id),
  INDEX					(plate_no ASC),
  INDEX					(authorizing_officer ASC),
  INDEX					(or_no ASC),
  FOREIGN KEY			(plate_no)
    REFERENCES			vehicle(plate_no),
  FOREIGN KEY			(authorizing_officer)
    REFERENCES			hoa_officer(officer_id),
  FOREIGN KEY			(or_no)
    REFERENCES			receipt(or_no)
);

-- -----------------------------------------------------
-- Table hoaofficer_sched
-- -----------------------------------------------------
DROP TABLE IF EXISTS hoaofficer_sched;
CREATE TABLE IF NOT EXISTS hoaofficer_sched (
  officer_id	INT(5) NOT NULL,
  sched_time	ENUM('AM', 'PM') NOT NULL,
  avail_Mon		TINYINT(1) NOT NULL, 
  avail_Tue		TINYINT(1) NOT NULL,
  avail_Wed		TINYINT(1) NOT NULL,
  avail_Thu		TINYINT(1) NOT NULL,
  avail_Fri		TINYINT(1) NOT NULL,
  avail_Sat		TINYINT(1) NOT NULL,
  avail_Sun		TINYINT(1) NOT NULL,
  PRIMARY KEY	(officer_id, sched_time),
  INDEX			(officer_id ASC),
  FOREIGN KEY	(officer_id)
    REFERENCES	hoa_officer(officer_id)
);

-- -----------------------------------------------------
-- Table asset
-- -----------------------------------------------------
DROP TABLE IF EXISTS asset;
CREATE TABLE IF NOT EXISTS asset (
  asset_id			VARCHAR(10) NOT NULL,
  asset_name		VARCHAR(45) NOT NULL,
  description		VARCHAR(45) NOT NULL,
  date_acquired		DATE NOT NULL,
  for_rent			TINYINT(1) NOT NULL,
  asset_value		FLOAT NOT NULL,
  asset_type		ENUM('P', 'E', 'F', 'O') NOT NULL,
  asset_status		ENUM('W', 'DE', 'FR', 'FD', 'DI') NOT NULL,
  location			VARCHAR(45) NOT NULL,
  location_x		FLOAT NOT NULL,
  location_y		FLOAT NOT NULL,
  hoa_name			VARCHAR(45) NOT NULL,
  asset_container	VARCHAR(10) NULL,
  PRIMARY KEY		(asset_id),
  INDEX				(hoa_name ASC),
  INDEX				(asset_container ASC),
  FOREIGN KEY		(hoa_name)
    REFERENCES		hoa(hoa_name),
  FOREIGN KEY		(asset_container)
    REFERENCES		asset(asset_id)
);

-- -----------------------------------------------------
-- Table commercial_prop
-- -----------------------------------------------------
DROP TABLE IF EXISTS commercial_prop;
CREATE TABLE IF NOT EXISTS commercial_prop (
  property_code			VARCHAR(6) NOT NULL,
  commercial_type		ENUM('O', 'L', 'R', 'M') NOT NULL,
  commercial_maxten		INT NOT NULL,
  INDEX					(property_code ASC),
  PRIMARY KEY			(property_code),
  FOREIGN KEY			(property_code)
    REFERENCES			property(property_code)
);

-- -----------------------------------------------------
-- Table residential_prop
-- -----------------------------------------------------
DROP TABLE IF EXISTS residential_prop;
CREATE TABLE IF NOT EXISTS residential_prop (
  property_code VARCHAR(6) NOT NULL,
  household_id	INT(5) NOT NULL,
  INDEX			(property_code ASC),
  PRIMARY KEY	(property_code),
  INDEX			(household_id ASC),
  FOREIGN KEY	(property_code)
    REFERENCES	property(property_code),
  FOREIGN KEY	(household_id)
    REFERENCES	household(household_id)
);

-- -----------------------------------------------------
-- Table monthly_duebill
-- -----------------------------------------------------
DROP TABLE IF EXISTS monthly_duebill;
CREATE TABLE IF NOT EXISTS monthly_duebill (
  monthly_duebillid  INT NOT NULL,
  date_generated 	 DATE NOT NULL,
  household_id 		 INT(5) NOT NULL,
  INDEX 			 (monthly_duebillid ASC),
  INDEX 			 (date_generated ASC),
  INDEX 			 (household_id ASC),
  PRIMARY KEY 		 (monthly_duebillid),
  FOREIGN KEY 		 (household_id)
	REFERENCES 		 household(household_id)
);

-- -----------------------------------------------------
-- Table dues
-- -----------------------------------------------------
DROP TABLE IF EXISTS dues;
CREATE TABLE IF NOT EXISTS dues 
(
	due_id INT NOT NULL,
    due_desc VARCHAR(45) NOT NULL,
    due_amount DECIMAL(10,2) NOT NULL,
    date_incurred DATE NOT NULL,
    household_id INT(5) NOT NULL,
    
    PRIMARY KEY (due_id),
    FOREIGN KEY (household_id)
		REFERENCES household(household_id)
);

-- -----------------------------------------------------
-- Table household_account
-- -----------------------------------------------------
DROP TABLE IF EXISTS household_account;
CREATE TABLE IF NOT EXISTS household_account
(
	household_id INT NOT NULL,
    outstanding_balance DECIMAL(10,2) NOT NULL, 
	/*
    Last month's balance. If negative, there are unpaid dues.
    If positive, this month's dues are first deducted from remaining balance.
    Either way, this month's total amounts to outstanding_balance - sum of dues accumulated this month.
    
    Monthly due calculation (deduction_amount): sum of dues + sum of penalties.
    Monthly balance calculation: outstanding balance - monthly dues.
    */
    
    PRIMARY KEY (household_id),
    FOREIGN KEY (household_id)
		REFERENCES household(household_id)
);

-- -----------------------------------------------------
-- Table payments
-- -----------------------------------------------------
DROP TABLE IF EXISTS payments;
CREATE TABLE IF NOT EXISTS payments (
  or_number 		VARCHAR(5) NOT NULL,
  payment_date 		DATE NOT NULL,
  amount_paid 		DECIMAL(10,2) NOT NULL,
  paying_resident 	INT(5) NOT NULL, 
  receiving_officer INT(5) NOT NULL,
  INDEX 			(or_number ASC),
  INDEX 			(payment_date ASC),
  INDEX 			(paying_resident ASC),
  PRIMARY KEY 		(or_number),
  FOREIGN KEY 		(paying_resident)
	REFERENCES 		resident(resident_id),
  FOREIGN KEY 		(receiving_officer)
	REFERENCES 		hoa_officer(officer_id)
);

-- -----------------------------------------------------
-- Table incident
-- -----------------------------------------------------
DROP TABLE IF EXISTS incident;
CREATE TABLE IF NOT EXISTS incident (
  incident_id 			INT NOT NULL,
  date 					DATE NOT NULL,
  description 			VARCHAR(255) NOT NULL,
  rulenum_violated 		INT NOT NULL,
  investigating_officer INT(5) NOT NULL,
  seconding_officer 	INT(5) NOT NULL,
  INDEX 				(incident_id ASC),
  INDEX 				(date ASC),
  INDEX 				(rulenum_violated ASC),
  INDEX 				(investigating_officer ASC),
  INDEX 				(seconding_officer ASC),
  PRIMARY KEY 			(incident_id),
  FOREIGN KEY 			(investigating_officer)
	REFERENCES 			hoa_officer(officer_id),
  FOREIGN KEY 			(seconding_officer)
	REFERENCES 			hoa_officer(officer_id)
);

-- -----------------------------------------------------
-- Table person_involved
-- -----------------------------------------------------
DROP TABLE IF EXISTS person_involved;
CREATE TABLE IF NOT EXISTS person_involved (
  person_involvedid INT NOT NULL,
  first_name 		VARCHAR(45) NOT NULL,
  middle_name 		VARCHAR(45) NOT NULL,
  last_name 		VARCHAR(45) NOT NULL,
  pi_type 			ENUM('R','NR') NOT NULL,
  penalty_imposed 	DECIMAL(10,2) NOT NULL, 
  resident_id		INT NULL,
  incident_id 		INT NOT NULL,
  INDEX 			(person_involvedid ASC),
  INDEX 			(first_name ASC),
  INDEX 			(last_name ASC),
  INDEX 			(pi_type ASC),
  INDEX 			(incident_id ASC),
  PRIMARY KEY 		(person_involvedid),
  FOREIGN KEY 		(incident_id)
	REFERENCES 		incident(incident_id),
  FOREIGN KEY 		(resident_id)
	REFERENCES 		resident(resident_id)
  
);

-- -----------------------------------------------------
-- Table evidence
-- -----------------------------------------------------
DROP TABLE IF EXISTS evidence;
CREATE TABLE IF NOT EXISTS evidence (
  evidence_id 		  INT NOT NULL,
  name 				  VARCHAR(45) NOT NULL,
  description 		  VARCHAR(250) NOT NULL,
  file_name 		  VARCHAR(45) NOT NULL,
  submitting_resident INT(5),
  accepting_officer   INT NOT NULL,
  date_submitted 	  DATE NOT NULL,
  incident_id 		  INT NOT NULL,
  INDEX 			  (evidence_id ASC),
  INDEX 			  (name ASC),
  INDEX 			  (file_name ASC),
  INDEX 			  (submitting_resident ASC),
  INDEX 			  (accepting_officer ASC),
  INDEX 			  (incident_id ASC),
  PRIMARY KEY 		  (evidence_id),
  FOREIGN KEY 		  (submitting_resident)
	REFERENCES 		  resident(resident_id),
  FOREIGN KEY 		  (accepting_officer)
	REFERENCES 		  hoa_officer(officer_id),
  FOREIGN KEY 		  (incident_id)
	REFERENCES 		  incident(incident_id)
);

-- -----------------------------------------------------
-- Table incentives_anddiscounts
-- -----------------------------------------------------
DROP TABLE IF EXISTS incentives_anddiscounts;
CREATE TABLE IF NOT EXISTS incentives_anddiscounts (
    incentives_anddiscounts_id INT NOT NULL,
    bill_period 			   INT NOT NULL,
    awarded_resident 		   INT NOT NULL,
    classification 			   ENUM('I','D') NOT NULL,
    amount_orrate 			   DECIMAL(10,2) NOT NULL,
    reason 					   VARCHAR(255) NOT NULL,
    authorizing_officer 	   INT(5) NOT NULL,
    INDEX 					   (incentives_anddiscounts_id ASC),
    INDEX 					   (awarded_resident ASC),
    INDEX 					   (bill_period ASC),
    INDEX 					   (classification ASC),
    INDEX 					   (authorizing_officer ASC),
    PRIMARY KEY				   (incentives_anddiscounts_id),
    FOREIGN KEY				   (bill_period)
		REFERENCES 			   monthly_duebill(monthly_duebillid),
    FOREIGN KEY				   (awarded_resident)
        REFERENCES 			   resident(resident_id),
    FOREIGN KEY				   (authorizing_officer)
        REFERENCES 			   hoa_officer(officer_id)
    
);

-- -----------------------------------------------------
-- Table nonmonetary_incentives
-- -----------------------------------------------------
DROP TABLE IF EXISTS nonmonetary_incentives;
CREATE TABLE IF NOT EXISTS nonmonetary_incentives (
    incentive_id 		INT NOT NULL,
    description 		VARCHAR(255) NOT NULL,
    validity_startdate 	DATE NOT NULL,
    validity_enddate 	DATE NOT NULL,
    status 				ENUM('Valid','Expired','Availed','Cancelled') NOT NULL, 
    reason 				VARCHAR(255) NOT NULL,
    authorizing_officer INT(5) NOT NULL,
    awarded_resident 	INT(5) NOT NULL,
    INDEX 				(incentive_id ASC),
    INDEX 				(validity_startdate ASC),
    INDEX 				(validity_enddate ASC),
    INDEX 				(status ASC),
    INDEX 				(authorizing_officer ASC),
    INDEX 				(awarded_resident ASC),
    PRIMARY KEY			(incentive_id),
    FOREIGN KEY			(authorizing_officer)
    	REFERENCES 		hoa_officer(officer_id),
    FOREIGN KEY			(awarded_resident) 
    	REFERENCES 		resident(resident_id)
);

-- -----------------------------------------------------
-- Table donation
-- -----------------------------------------------------
DROP TABLE IF EXISTS donation;
CREATE TABLE IF NOT EXISTS donation (
    donation_id 	  INT NOT NULL,
    donor_firstname   VARCHAR(45) NOT NULL,
    donor_middlename  VARCHAR(45) NOT NULL,
    donor_lastname 	  VARCHAR(45) NOT NULL,
    donor_type 		  ENUM('R','NR') NOT NULL,
    donor_address 	  INT NOT NULL,
    donation_date 	  DATE NOT NULL,
    donation_form 	  INT NOT NULL,
    status 			  ENUM('Existing','Deleted') NOT NULL,
    accepting_officer INT(5) NOT NULL,
    INDEX 			  (donation_id ASC),
	INDEX 			  (donor_firstname ASC),
    INDEX 			  (donor_lastname ASC),
    INDEX			  (donor_type ASC),
    INDEX 			  (donation_date ASC),
    INDEX 			  (status ASC),
    INDEX 			  (accepting_officer ASC),
    PRIMARY KEY 	  (donation_id),
    FOREIGN KEY 	  (donor_address)
		REFERENCES 	  address(address_id),
	FOREIGN KEY 	  (donation_form)
    	REFERENCES 	  hoa_files(file_id),
    FOREIGN KEY 	  (accepting_officer)
    	REFERENCES 	  hoa_officer(officer_id)
);

-- -----------------------------------------------------
-- Table donation_item
-- -----------------------------------------------------
DROP TABLE IF EXISTS donation_item;
CREATE TABLE IF NOT EXISTS donation_item (
    donation_itemid INT NOT NULL,
    amount 			DECIMAL(10,2) NOT NULL,
    description 	VARCHAR(255) NOT NULL,
    donation_id 	INT NOT NULL,
    INDEX			(donation_itemid ASC),
	INDEX 			(donation_id ASC),
    PRIMARY KEY 	(donation_itemid),
    FOREIGN KEY		(donation_id)
    	REFERENCES 	donation(donation_id)
);

-- -----------------------------------------------------
-- Table donation_picture
-- -----------------------------------------------------
DROP TABLE IF EXISTS donation_picture;
CREATE TABLE IF NOT EXISTS donation_picture (
    donation_pictureid INT NOT NULL,
    picture 		   BLOB NOT NULL,
    donation_id 	   INT NOT NULL,
    INDEX 			   (donation_pictureid ASC),
    INDEX 			   (donation_id ASC),
    PRIMARY KEY 	   (donation_pictureid),
    FOREIGN KEY 	   (donation_id)
    	REFERENCES 	   donation(donation_id)
);

