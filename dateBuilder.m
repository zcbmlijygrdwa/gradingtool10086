function date = dateBuilder(year,month,day)

if(month>12||day>31)
    disp('wrong date built!');
    return;
end

date.year = year;
date.month = month;
date.day = day;
end