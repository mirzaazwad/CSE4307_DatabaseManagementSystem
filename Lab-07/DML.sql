SELECT * FROM DIVISION,(SELECT DivisionName,count(DivisionName)DistrictCount FROM DISTRICT GROUP BY DIVISION)DistrictDivision WHERE DIVISION.DivisionName=DistrictDivision.DivisionName;

