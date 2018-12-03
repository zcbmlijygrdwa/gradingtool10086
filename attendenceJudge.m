function attendence = attendenceJudge(dakaInterval,GongchuInterval,xiujiaInterval,chuchaiInterval)

% to show the rules
%timePunchRules;  no_punch_all_day  full_attendence late1 late2 no_punch_in
%no_punch_out early_leave

% waiverIntever % generated from GongchuInterval and xiujiaInterval
waiverInteval = [];

if(length(GongchuInterval)~=0)
    waiverInteval = [timeToSeconds(GongchuInterval.startTime),timeToSeconds(GongchuInterval.endTime)];
end

if(length(xiujiaInterval)~=0)
    if(length(waiverInteval)~=0)
        newInterval = [timeToSeconds(xiujiaInterval.startTime),timeToSeconds(xiujiaInterval.endTime)];
        waiverInteval = mergeIntervals(waiverInteval,newInterval);
    else
        waiverInteval = [timeToSeconds(xiujiaInterval.startTime),timeToSeconds(xiujiaInterval.endTime)];
    end
    
end

if(length(chuchaiInterval)~=0)
    if(length(waiverInteval)~=0)
        newInterval = [timeToSeconds(chuchaiInterval.startTime),timeToSeconds(chuchaiInterval.endTime)];
        waiverInteval = mergeIntervals(waiverInteval,newInterval);
    else
        waiverInteval = [timeToSeconds(chuchaiInterval.startTime),timeToSeconds(chuchaiInterval.endTime)];
    end
end

attendence = {};
attendence_counter = 1;


if(length(waiverInteval)~=0&&waiverInteval(1)<=timeToSeconds(timeBuilder(9,5,0))&&waiverInteval(2)>=timeToSeconds(timeBuilder(17,30,0)))
    disp('waiverAllDay');
    attendence{attendence_counter} = {'full_attendence'};
    attendence_counter = attendence_counter+1;
    return;
end



%morning_09_00_Seconds = timeToSeconds(timeBuilder(9,0,0));
morning_09_05_Seconds = timeToSeconds(timeBuilder(9,5,0));
morning_10_00_Seconds = timeToSeconds(timeBuilder(10,0,0));
afternoon_17_30_Seconds = timeToSeconds(timeBuilder(17,30,0));

if(length(dakaInterval.startTime)==0&&length(dakaInterval.endTime)==0)
    if(length(waiverInteval)~=0)
        if(timeToSeconds(waiverInteval(1))>morning_09_05_Seconds)
            if(timeToSeconds(waiverInteval(1))<morning_10_00_Seconds)
                attendence{attendence_counter} = {'late1'};
                attendence_counter = attendence_counter+1;
            else
                attendence{attendence_counter} = {'late2'};
                attendence_counter = attendence_counter+1;
            end
        else
            disp("morning good.")
        end
        
        if(timeToSeconds(waiverInteval(2))<afternoon_17_30_Seconds)
            attendence{attendence_counter} = {'early_leave'};
            attendence_counter = attendence_counter+1;
        else
            disp("afternoon good.")
        end
    else
        attendence{attendence_counter} = {'no_punch_all_day'};
        attendence_counter = attendence_counter+1;
        return;
    end
    
end


if(length(dakaInterval.startTime)~=0&&length(dakaInterval.endTime)==0)
    startSeconds = timeToSeconds(dakaInterval.startTime);
    if(length(waiverInteval)~=0)
        startSeconds = min(startSeconds,waiverInteval(1));
        if(startSeconds>morning_09_05_Seconds)
            if(startSeconds<morning_10_00_Seconds)
                attendence{attendence_counter} = {'late1'};
                attendence_counter = attendence_counter+1;
            else
                attendence{attendence_counter} = {'late2'};
                attendence_counter = attendence_counter+1;
            end
            
            if(waiverInteval(2)<afternoon_17_30_Seconds)
                attendence{attendence_counter} = {'full_attendence'};
                attendence_counter = attendence_counter+1;
            end
            
        else
            if(waiverInteval(2)>=afternoon_17_30_Seconds)
                attendence{attendence_counter} = {'full_attendence'};
                attendence_counter = attendence_counter+1;
            else
                attendence{attendence_counter} = {'early_leave'};
                attendence_counter = attendence_counter+1;
            end
        end
    else
        if(startSeconds>morning_09_05_Seconds)
            if(startSeconds<morning_10_00_Seconds)
                attendence{attendence_counter} = {'late1'};
                attendence_counter = attendence_counter+1;
            else
                attendence{attendence_counter} = {'late2'};
                attendence_counter = attendence_counter+1;
            end
        end
        attendence{attendence_counter} = {'no_punch_out'};
        attendence_counter = attendence_counter+1;
    end
    
elseif (length(dakaInterval.startTime)==0&&length(dakaInterval.endTime)~=0)
    endSeconds = timeToSeconds(dakaInterval.endTime);
    if(length(waiverInteval)~=0)
        endSeconds = max(endSeconds,waiverInteval(2));
        if(endSeconds<afternoon_17_30_Seconds)
            attendence{attendence_counter} = {'early_leave'};
            attendence_counter = attendence_counter+1;
            
            if(waiverInteval(1)>morning_09_05_Seconds)
                if(waiverInteval(1)<morning_10_00_Seconds)
                    attendence{attendence_counter} = {'late1'};
                    attendence_counter = attendence_counter+1;
                else
                    attendence{attendence_counter} = {'late2'};
                    attendence_counter = attendence_counter+1;
                end
            end
            
        else
            if(waiverInteval(1)>morning_09_05_Seconds)
                if(waiverInteval(1)<morning_10_00_Seconds)
                    attendence{attendence_counter} = {'late1'};
                    attendence_counter = attendence_counter+1;
                else
                    attendence{attendence_counter} = {'late2'};
                    attendence_counter = attendence_counter+1;
                end
            else
                attendence{attendence_counter} = {'full_attendence'};
                attendence_counter = attendence_counter+1;
            end
        end
    else
        if(endSeconds<afternoon_17_30_Seconds)
            attendence{attendence_counter} = {'early_leave'};
            attendence_counter = attendence_counter+1;
        end
        attendence{attendence_counter} = {'no_punch_in'};
        attendence_counter = attendence_counter+1;
    end
else
    startSeconds = timeToSeconds(dakaInterval.startTime);
    endSeconds = timeToSeconds(dakaInterval.endTime);
    if(startSeconds<=morning_09_05_Seconds&&endSeconds>afternoon_17_30_Seconds)
        attendence{attendence_counter} = {'full_attendence'};
        attendence_counter = attendence_counter+1;
    else
        if(startSeconds>morning_09_05_Seconds)
            if(startSeconds>morning_09_05_Seconds)
                attendence{attendence_counter} = {'late1'};
                attendence_counter = attendence_counter+1;
            else
                attendence{attendence_counter} = {'late2'};
                attendence_counter = attendence_counter+1;
            end
        end
        
        if(endSeconds<afternoon_17_30_Seconds)
            attendence{attendence_counter} = {'early_leave'};
            attendence_counter = attendence_counter+1;
        end
    end
end






end