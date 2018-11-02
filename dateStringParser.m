function date = dateStringParser(dateStr)
lineSplit = strsplit(dateStr,'-','CollapseDelimiters',false);
date.year = str2num(lineSplit{1});
date.month = str2num(lineSplit{2});
date.day = str2num(lineSplit{3});
end