CREATE TABLE Hospital_MedicalRecord(
recNo 		INT UNSIGNED AUTO_INCREMENT,
patient 		CHAR(9),
doctor 		CHAR(9),
enteredOn 	datetime NOT NULL DEFAULT GETDATE(),
diagnosis 	MEDIUMTEXT NOT NULL, --mediumtext = 16MB
treatment 	VARCHAR(1000), --less than 1000 characters
PRIMARY KEY(recNo, patient),
CONSTRAINT FK_patient FOREIGN KEY (patient) REFERENCES Hospital_Patient(NINumber) ON DELETE CASCADE ON UPDATE RESTRICT,
CONSTRAINT FK_doctor FOREIGN KEY (doctor) REFERENCES Hospital_Doctor(NINumber) ON UPDATE RESTRICT,
CONSTRAINT CHK_noRecords CHECK(COUNT(patient) <65535) --b) something to do with 16 bit?
);

-- need anything for h)? 

--assumption for recNo, no information on what type this might be
