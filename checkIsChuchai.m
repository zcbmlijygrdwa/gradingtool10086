function output = checkIsChuchai(id,dateObj,ChuchaiSet)
%check if this person is chuchai on the date
currentDays = dateToDays(dateObj);
for i = 1:length(ChuchaiSet)
    tempChuchai = ChuchaiSet{i};
    startDays = dateToDays(tempChuchai.startDate);
    endDays = dateToDays(tempChuchai.endDate);
    
    
    if(tempChuchai.id==id && startDays<=currentDays && currentDays<=endDays)
        output = true;
        return;
        
    end
end

output = false;
return;

end