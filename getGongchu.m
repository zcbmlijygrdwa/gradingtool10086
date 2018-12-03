function output = getGongchu(id,dateObj,gongchuSet)
%check if this person is chuchai on the date
currentDays = dateToDays(dateObj);
for i = 1:length(gongchuSet)
    temoGongchu = gongchuSet{i};
    startDays = dateToDays(temoGongchu.startDate);
    endDays = dateToDays(temoGongchu.endDate);
    if(temoGongchu.id ==id && startDays<=currentDays && currentDays<=endDays)
        output = temoGongchu;
        return;
        
    end
end

output = [];
return;

end