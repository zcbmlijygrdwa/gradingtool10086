function output = getGongchu(id,dateStr,gongchuSet)
%check if this person is chuchai on the date

for i = 1:length(gongchuSet)
    temoGongchu = gongchuSet{i};
    startDays = dateToDays(dateStringParser(temoGongchu.startDate));
    endDays = dateToDays(dateStringParser(temoGongchu.endDate));
    currentDays = dateToDays(dateStringParser(dateStr));
    
    if(temoGongchu.id ==id && startDays<=currentDays && currentDays<=endDays)
        output = temoGongchu;
        return;
        
    end
end

output = [];
return;

end