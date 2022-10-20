CREATE TABLE CITIZEN(
  NID varchar2(12),
  Name varchar2(100),
  DOB date,
  Occupation varchar2(20),
  BloodGroup varchar2(5),
  DistrictName varchar2(20),
  DistrictSize number,
  constraint PK_CITIZEN PRIMARY KEY(NID),
  constraint BloodGroup_CONSTRAINT CHECK( BloodGroup in('A-ve','A+ve','B+ve','B-ve','AB+ve','AB-ve','O+ve','O-ve'))
);

CREATE TABLE DIVISION(
  DivisionName varchar2(20),
  DivisionSize number,
  BriefDescription varchar2(200),
  constraint PK_DIVISION PRIMARY KEY(DivisionName,DivisionSize)
);

CREATE TABLE DISTRICT(
  DistrictName varchar2(20),
  DistrictSize number,
  BriefDescription varchar2(200),
  DivisionName varchar2(10),
  DivisionSize number,
  CONSTRAINT PK_DISTRICT PRIMARY KEY(DistrictName, DistrictSize),
  CONSTRAINT FK_DISTRICT_Division FOREIGN KEY(DivisionName,DivisionSize) REFERENCES DIVISION(DivisionName,DivisionSize) ON DELETE CASCADE
);

CREATE TABLE LICENSE(
  NID varchar2(12),
  LicenseType varchar2(20),
  IssueDate date,
  ExpirationDate date,
  constraint PK_LICENSE PRIMARY KEY(NID),
  constraint FK_LICENSE_CITIZEN FOREIGN KEY(NID) REFERENCES CITIZEN(NID)
);

CREATE TABLE ACCIDENT(
  dateOfAccident date,
  timeOfAccident timestamp,
  location varchar2(20),
  numberOfDeaths INTEGER,
  constraint PK_ACCIDENT PRIMARY KEY(dateOfAccident, timeOfAccident, location)
);

CREATE TABLE ACCIDENT_LICENSE(
  dateOfAccident date,
  timeOfAccident timestamp,
  location varchar2(20),
  NID varchar2(12),
  constraint PK_ACCIDENT_LICENSE PRIMARY KEY(dateOfAccident, timeOfAccident,location,NID),
  constraint FK_ACCIDENT_LICENSE_LICENSE FOREIGN KEY(NID) REFERENCES LICENSE(NID),
  constraint FK_ACCIDENT_LICENSE_ACCIDENT FOREIGN KEY(dateOfAccident, timeOfAccident,location) REFERENCES ACCIDENT(dateOfAccident, timeOfAccident,location)
);

CREATE TABLE HOSPITAL(
  Name varchar2(100),
  ContactInformation vmobiles,
  Location varchar2(20),
  constraint PK_HOSPITAL PRIMARY KEY(Name, Location)
);

CREATE TABLE PATIENT(
  NID varchar2(12),
  DateOfAdmission date,
  BriefDescription varchar2(200),
  ReleaseDate date,
  HospitalName varchar2(100),
  HospitalLocation varchar2(20),
  constraint PK_PATIENT PRIMARY KEY(DateOfAdmission, ReleaseDate),
  CONSTRAINT FK_PATIENT_NID FOREIGN KEY(NID) REFERENCES CITIZEN(NID)
);

