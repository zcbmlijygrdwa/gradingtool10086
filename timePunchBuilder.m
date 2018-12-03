function timePunch = timePunchBuilder(id,date,startTimeStr,endTimeStr,gongchuSet,xiujiaSet,ChuchaiSet)

% tempTimePunch: 
% id
% date
% dakaInterval
% GongchuInterval
% xiujiaInterval

% attendence

timePunch.id = str2num(id);
timePunch.date = dateStringParser(date);
timePunch.dateStr = date;

if(length(startTimeStr)~=0)
    dakaInterval.startTime = timeStringParser(startTimeStr);
else
    dakaInterval.startTime = [];
end

if(length(endTimeStr)~=0)
    dakaInterval.endTime = timeStringParser(endTimeStr);
else
    dakaInterval.endTime = [];
end

GongchuInterval = getGongchu(timePunch.id,timePunch.date,gongchuSet);
xiujiaInterval = getXiujia(timePunch.id,timePunch.date,xiujiaSet); 
chuchaiInterval = getChuchai(timePunch.id,timePunch.date,ChuchaiSet); 
timePunch.attendence = attendenceJudge(dakaInterval,GongchuInterval,xiujiaInterval,chuchaiInterval);
end