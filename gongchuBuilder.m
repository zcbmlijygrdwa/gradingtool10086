function gongchu = gongchuBuilder(id,startDateTimeStr,endDateTimeStr)

gongchu.id = str2num(id);

lineSplit = strsplit(startDateTimeStr,' ');
gongchu.startDate = dateStringParser(lineSplit{1});
lineSplit = strsplit(lineSplit{2},':');
gongchu.startTime = timeBuilder(str2num(lineSplit{1}),str2num(lineSplit{2}),0);

lineSplit = strsplit(endDateTimeStr,' ');
gongchu.endDate = dateStringParser(lineSplit{1});
lineSplit = strsplit(lineSplit{2},':');
gongchu.endTime = timeBuilder(str2num(lineSplit{1}),str2num(lineSplit{2}),0);


%if gongchu >= 6 hours, assuming it is one day
secondsDuration = timeToSeconds(gongchu.endTime) - timeToSeconds(gongchu.startTime);
hoursDuration = secondsDuration/3600;

if(hoursDuration>=6)
    gongchu.isAllDay = true;
else
    gongchu.isAllDay = false;
end





end