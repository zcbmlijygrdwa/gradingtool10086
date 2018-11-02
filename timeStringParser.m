function time = timeStringParser(timeStr)
lineSplit = strsplit(timeStr,':','CollapseDelimiters',false);
time.hour = str2num(lineSplit{1});
time.minute = str2num(lineSplit{2});
time.second = str2num(lineSplit{3});
end