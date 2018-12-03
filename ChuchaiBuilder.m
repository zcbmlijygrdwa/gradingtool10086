function chuchai = ChuchaiBuilder(id,startDateStr,endDateStr)
chuchai.id = str2num(id);
chuchai.startDate = dateStringParser(startDateStr);
chuchai.endDate = dateStringParser(endDateStr);
chuchai.startTime = timeBuilder(9,0,0);
chuchai.endTime = timeBuilder(17,30,0);
end