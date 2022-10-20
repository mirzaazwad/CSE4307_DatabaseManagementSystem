
--Task-1-- 
SELECT * FROM DIVISION,(SELECT DivisionName,count(DivisionName)DistrictCount FROM DISTRICT GROUP BY DIVISION)DistrictDivision WHERE DIVISION.DivisionName=DistrictDivision.DivisionName;

--Task-2--
SELECT DISTRICT.DistrictName,count(DISTRICT.DistrictName)Population FROM DISTRICT,CITIZEN WHERE DISTRICT.DistrictName=CITIZEN.DistrictName AND DISTRICT.DistrictSize=CITIZEN.DistrictSize GROUP BY DISTRICT.DistrictName;

--Task-3--
SELECT count(*)NumberOfAccidents FROM ACCIDENT_LICENSE,CITIZEN WHERE ACCIDENT_LICENSE.NID='210' AND CITIZEN.NID='210' GROUP BY CITIZEN.NID;

--Task-4--
SELECT * FROM (SELECT HospitalName,count(*)NumberOfPatients FROM HOSPITAL,PATIENT WHERE HOSPITAL.Name=PATIENT.HospitalName GROUP BY HospitalName ORDER BY DESC) WHERE ROWNUM<=5;

