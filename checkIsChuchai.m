function output = checkIsChuchai(id,dateStr,ChuchaiSet)
%check if this person is chuchai on the date

for i = 1:length(ChuchaiSet)
    tempChuchai = ChuchaiSet{i};
    startDays = dateToDays(dateStringParser(tempChuchai.startDate));
    endDays = dateToDays(dateStringParser(tempChuchai.endDate));
    currentDays = dateToDays(dateStringParser(dateStr));
    
    if(tempChuchai.id==id && startDays<=currentDays && currentDays<=endDays)
        output = true;
        return;
        
    end
end

output = false;
return;

end