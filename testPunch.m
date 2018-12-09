function  testPunch(dakaS,dakaE,xiujiaS,xiujiaE,gongchuS,gongchuE,chuchaiS,chuchaiE)
%testPunch('08:55:56','16:52:32','09:22:45','11:24:20','13:45:20','15:01:01','15:55:05','16:05:03')
% dakaStart, dakaEnd, xiujiaStart,xiujiaEnd,gongchuStart, gongchuEnd,
% chuchaiStart, chuchaiEnd

dakaInterval.startTime = timeStringParser(dakaS);
dakaInterval.endTime = timeStringParser(dakaE);

GongchuInterval.startTime = timeStringParser(gongchuS);
GongchuInterval.endTime = timeStringParser(gongchuE);

xiujiaInterval.startTime = timeStringParser(xiujiaS);
xiujiaInterval.endTime = timeStringParser(xiujiaE);

chuchaiInterval.startTime = timeStringParser(chuchaiS);
chuchaiInterval.endTime = timeStringParser(chuchaiE);

attendence = attendenceJudge(dakaInterval,GongchuInterval,xiujiaInterval,chuchaiInterval);
for i = 1:length(attendence)
    disp(attendence{i})
end
end