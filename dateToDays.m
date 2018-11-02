function seconds = dateToDays(dateObj)
%convert time to seconds of a day
seconds = dateObj.year*365+dateObj.month*31+dateObj.day;
end