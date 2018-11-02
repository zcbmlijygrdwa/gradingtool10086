function seconds = timeToSeconds(timeObj)
%convert time to seconds of a day
seconds = timeObj.hour*3600+timeObj.minute*60+timeObj.second;
end