function result = isInInterval(i1,i2)
%reuturn if i1 is in interval i2
result = false;
if(timeToSeconds(i1.startTime)>=timeToSeconds(i2.startTime) && timeToSeconds(i1.endTime)<=timeToSeconds(i2.endTime))
    result = true;
else
    result = false;
end
end