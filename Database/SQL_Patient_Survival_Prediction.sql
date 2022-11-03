--CREATING TABLES

--Creating the table containing all of the patient data (master dataset)
CREATE TABLE patient (
	encounter_id NUMERIC NOT NULL,
	patient_id NUMERIC NOT NULL,
	hospital_id NUMERIC NOT NULL,
	hospital_death BOOLEAN,
	age INT,
	bmi NUMERIC,
	elective_surgery BOOLEAN,
	ethnicity INT,
	gender INT,
	icu_admit_source INT,
	icu_id INT,
	icu_stay_type INT,
	icu_type INT,
	pre_icu_los_days NUMERIC,
	readmission_status BOOLEAN,
	apache_post_operative BOOLEAN,
	arf_apache BOOLEAN,
	gcs_eye_apache INT,
	gcs_motor_apache INT,
	gcs_unable_apache INT,
	gcs_verbal_apache INT,
	heart_rate_apache INT,
	intubated_apache INT,
	map_apache INT,
	resprate_apache NUMERIC,
	temp_apache NUMERIC,
	ventilated_apache BOOLEAN,
	d1_diasbp_max INT,
	d1_diasbp_min INT,
	d1_diasbp_noninvasive_max INT,
	d1_diasbp_noninvasive_min INT,
	d1_heartrate_max INT,
	d1_heartrate_min INT,
	d1_mbp_max INT,
	d1_mbp_min INT,
	d1_mbp_noninvasive_max INT,
	d1_mbp_noninvasive_min INT,
	d1_resprate_max INT,
	d1_resprate_min INT,
	d1_spo2_max INT,
	d1_spo2_min INT,
	d1_sysbp_max INT,
	d1_sysbp_min INT,
	d1_sysbp_noninvasive_max INT,
	d1_sysbp_noninvasive_min INT,
	d1_temp_max NUMERIC,
	d1_temp_min NUMERIC,
	h1_diasbp_max INT,
	h1_diasbp_min INT,
	h1_heartrate_max INT,
	h1_heartrate_min INT,
	h1_mbp_max INT,
	h1_mbp_min INT,
	h1_resprate_max INT,
	h1_resprate_min INT,
	h1_spo2_max INT,
	h1_spo2_min INT,
	h1_sysbp_max INT,
	h1_sysbp_min INT,
	aids BOOLEAN,
	cirrhosis BOOLEAN,
	diabetes_mellitus BOOLEAN,
	hepatic_failure BOOLEAN,
	immunosuppression BOOLEAN,
	leukemia BOOLEAN,
	lymphoma BOOLEAN,
	solid_tumor_with_metastasis BOOLEAN,
	apache_3j_bodysystem INT,
	apache_2_bodysystem INT,
	PRIMARY KEY (patient_ID)
);

COPY patient FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/database_patient.csv' DELIMITER ',' CSV HEADER;

-- Creating table for all demographic data
CREATE TABLE demographic (
	encounter_id NUMERIC NOT NULL,
	patient_id NUMERIC NOT NULL,
	hospital_id NUMERIC NOT NULL,
	hospital_death BOOLEAN,
	age INT,
	bmi NUMERIC,
	elective_surgery BOOLEAN,
	ethnicity INT,
	gender INT,
	icu_admit_source INT,
	icu_id INT,
	icu_stay_type INT,
	icu_type INT,
	pre_icu_los_days NUMERIC,
	readmission_status BOOLEAN,
	PRIMARY KEY (patient_ID)
);

COPY demographic FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/demographic_patient.csv' DELIMITER ',' CSV HEADER;

-- Creating table for APACHE covariates
CREATE TABLE covariates (
	patient_id NUMERIC NOT NULL,
	apache_post_operative BOOLEAN,
	arf_apache BOOLEAN,
	gcs_eye_apache INT,
	gcs_motor_apache INT,
	gcs_unable_apache INT,
	gcs_verbal_apache INT,
	heart_rate_apache INT,
	intubated_apache INT,
	map_apache INT,
	resprate_apache INT,
	temp_apache NUMERIC,
	ventilated_apache BOOLEAN,
	hospital_death BOOLEAN,
	PRIMARY KEY (patient_ID)
);

COPY covariates FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/APACHE_covariates_patient.csv' DELIMITER ',' CSV HEADER;

--Creating a table for the APACHE comorbities
CREATE TABLE comorbidities (
	patient_id NUMERIC NOT NULL,
	aids BOOLEAN,
	cirrhosis BOOLEAN,
	diabetes_mellitus BOOLEAN,
	hepatic_failure BOOLEAN,
	immunosuppression BOOLEAN,
	leukemia BOOLEAN,
	lymphoma BOOLEAN,
	solid_tumor_with_metastasis BOOLEAN,
	apache_3j_bodysystem INT,
	apache_2_bodysystem INT,
	hospital_death BOOLEAN,
	PRIMARY KEY (patient_ID)
);

COPY comorbidities FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/APACHE_comorbidities_patient.csv' DELIMITER ',' CSV HEADER;

--Creating the table containing all of the lab data 
CREATE TABLE vitals_all (
	patient_id NUMERIC NOT NULL,
	d1_diasbp_max INT,
	d1_diasbp_min INT,
	d1_diasbp_noninvasive_max INT,
	d1_diasbp_noninvasive_min INT,
	d1_heartrate_max INT,
	d1_heartrate_min INT,
	d1_mbp_max INT,
	d1_mbp_min INT,
	d1_mbp_noninvasive_max INT,
	d1_mbp_noninvasive_min INT,
	d1_resprate_max INT,
	d1_resprate_min INT,
	d1_spo2_max INT,
	d1_spo2_min INT,
	d1_sysbp_max INT,
	d1_sysbp_min INT,
	d1_sysbp_noninvasive_max INT,
	d1_sysbp_noninvasive_min NUMERIC,
	d1_temp_max NUMERIC,
	d1_temp_min NUMERIC,
	h1_diasbp_max INT,
	h1_diasbp_min INT,
	h1_heartrate_max INT,
	h1_heartrate_min INT,
	h1_mbp_max INT,
	h1_mbp_min INT,
	h1_resprate_max INT,
	h1_resprate_min INT,
	h1_spo2_max INT,
	h1_spo2_min INT,
	h1_sysbp_max INT,
	h1_sysbp_min INT,
	hospital_death BOOLEAN,
	PRIMARY KEY (patient_ID)
);

COPY vitals_all FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/vitals_all_patient.csv' DELIMITER ',' CSV HEADER;

--Creating the table containing all of the lab data from the first hour of the patient's stay
CREATE TABLE vitals_hour (
	patient_id NUMERIC NOT NULL,
	h1_diasbp_max INT,
	h1_diasbp_min INT,
	h1_heartrate_max INT,
	h1_heartrate_min INT,
	h1_mbp_max INT,
	h1_mbp_min INT,
	h1_resprate_max INT,
	h1_resprate_min INT,
	h1_spo2_max INT,
	h1_spo2_min INT,
	h1_sysbp_max INT,
	h1_sysbp_min INT,
	hospital_death BOOLEAN,
	PRIMARY KEY (patient_ID)
);

COPY vitals_hour FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/vitals_hour_patient.csv' DELIMITER ',' CSV HEADER;

--Creating the table containing all of the lab data from the first day of the patient's stay
CREATE TABLE vitals_day (
	patient_id NUMERIC NOT NULL,
	d1_diasbp_max INT,
	d1_diasbp_min INT,
	d1_diasbp_noninvasive_max INT,
	d1_diasbp_noninvasive_min INT,
	d1_heartrate_max INT,
	d1_heartrate_min INT,
	d1_mbp_max INT,
	d1_mbp_min INT,
	d1_mbp_noninvasive_max INT,
	d1_mbp_noninvasive_min INT,
	d1_resprate_max INT,
	d1_resprate_min INT,
	d1_spo2_max INT,
	d1_spo2_min INT,
	d1_sysbp_max INT,
	d1_sysbp_min INT,
	d1_sysbp_noninvasive_max INT,
	d1_sysbp_noninvasive_min NUMERIC,
	d1_temp_max NUMERIC,
	d1_temp_min NUMERIC,
	hospital_death BOOLEAN,
	PRIMARY KEY (patient_ID)
);

COPY vitals_day FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/vitals_day_patient.csv' DELIMITER ',' CSV HEADER;

--Creating the table containing patient, hospital and encounter ids
CREATE TABLE hospital_lookup (
	encounter_id NUMERIC NOT NULL,
	patient_id NUMERIC NOT NULL,
	hospital_id NUMERIC NOT NULL,
	PRIMARY KEY (patient_ID)
);

COPY hospital_lookup FROM '/Users/brianbutler/Patient_Survival_Prediction/Database/hospital_lookup.csv' DELIMITER ',' CSV HEADER;
SELECT * FROM hospital_lookup

