function date = dateStringBuilder(year,month,day,delimiter)

    if(month>12||day>31)
        disp('wrong date built!');
       return; 
    end

    date = [num2str(year) delimiter];
    if(month<10)
        date = [date '0' num2str(month) delimiter];
    else
        date = [date num2str(month) delimiter];
    end
    
    if(day<10)
        date = [date '0' num2str(day)];
    else
        date = [date num2str(day)];
    end
end