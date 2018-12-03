function xiujia = xiujiaBuilder(id,startDateTimeStr,endDateTimeStr)

xiujia.id = str2num(id);

lineSplit = strsplit(startDateTimeStr,' ');
xiujia.startDate = dateStringParser(lineSplit{1});
xiujia.startTime = timeBuilder(str2num(lineSplit{2}),0,0);

lineSplit = strsplit(endDateTimeStr,' ');
xiujia.endDate = dateStringParser(lineSplit{1});
xiujia.endTime = timeBuilder(str2num(lineSplit{2}),0,0);


%if xiujia >= 6 hours, assuming it is one day
secondsDuration = timeToSeconds(xiujia.endTime) - timeToSeconds(xiujia.startTime);
hoursDuration = secondsDuration/3600;

if(hoursDuration>=6)
    xiujia.isAllDay = true;
else
    xiujia.isAllDay = false;
end

end