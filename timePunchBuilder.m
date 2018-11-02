function timePunch = timePunchBuilder(id,date,startTimeStr,endTimeStr)

timePunch.id = str2num(id);
timePunch.date = date;

if(length(startTimeStr)~=0)
    timePunch.startTime = timeStringParser(startTimeStr);
else
    timePunch.startTime = [];
end

if(length(endTimeStr)~=0)
    timePunch.endTime = timeStringParser(endTimeStr);
else
    timePunch.endTime = [];
end

timePunch.attendence = attendenceJudge(timePunch.startTime,timePunch.endTime);
end