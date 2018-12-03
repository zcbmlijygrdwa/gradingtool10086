function output = getChuchai(id,dateObj,chuchaiSet)
%check if this person is chuchai on the date
currentDays = dateToDays(dateObj);
for i = 1:length(chuchaiSet)
    tempXiujia = chuchaiSet{i};
    startDays = dateToDays(tempXiujia.startDate);
    endDays = dateToDays(tempXiujia.endDate);
    
    
    if(tempXiujia.id ==id && startDays<=currentDays && currentDays<=endDays)
        output = tempXiujia;
        return;
        
    end
end

output = [];
return;

end