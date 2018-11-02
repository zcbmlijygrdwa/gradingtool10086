function output = getXiujia(id,dateStr,gongchuSet)
%check if this person is chuchai on the date

for i = 1:length(gongchuSet)
    tempXiujia = gongchuSet{i};
    startDays = dateToDays(dateStringParser(tempXiujia.startDate));
    endDays = dateToDays(dateStringParser(tempXiujia.endDate));
    currentDays = dateToDays(dateStringParser(dateStr));
    
    if(tempXiujia.id ==id && startDays<=currentDays && currentDays<=endDays)
        output = tempXiujia;
        return;
        
    end
end

output = [];
return;

end