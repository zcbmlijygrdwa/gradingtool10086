function time = timeStringParser(timeStr)
if(length(timeStr)~=0)
lineSplit = strsplit(timeStr,':','CollapseDelimiters',false);
time.hour = str2num(lineSplit{1});
time.minute = str2num(lineSplit{2});
time.second = str2num(lineSplit{3});
else
    time = [];
end
end