function attendence = attendenceJudge(startTime,endTime)

% to show the rules
%timePunchRules;


if(length(startTime)==0&&length(endTime)==0)
    attendence = {'no_punch_all_day'};
    return;
end

%morning_09_00_Seconds = timeToSeconds(timeBuilder(9,0,0));
morning_09_05_Seconds = timeToSeconds(timeBuilder(9,5,0));
morning_10_00_Seconds = timeToSeconds(timeBuilder(10,0,0));
afternoon_17_30_Seconds = timeToSeconds(timeBuilder(17,30,0));

if(length(startTime)~=0&&length(endTime)~=0)
    startSeconds = timeToSeconds(startTime);
    endSeconds = timeToSeconds(endTime);
    if(startSeconds<=morning_09_05_Seconds&&endSeconds>afternoon_17_30_Seconds)
        attendence = {'full_attendence'};
        return;
    end
end

attendence = {};
attendence_counter = 1;


% chechk punch_in status
if(length(startTime)~=0)
    startSeconds = timeToSeconds(startTime);
    if(startSeconds>morning_09_05_Seconds)
        if(startSeconds<=morning_10_00_Seconds)
            attendence{attendence_counter} = 'late1';
        else
            attendence{attendence_counter} = 'late2';
        end
        attendence_counter = attendence_counter + 1;
    end
else
    attendence{attendence_counter} = 'no_punch_in';
    attendence_counter = attendence_counter + 1;
end


% chechk punch_out status
if(length(endTime)~=0)
    endSeconds = timeToSeconds(endTime);
    if(endSeconds<=afternoon_17_30_Seconds)
        attendence{attendence_counter} = 'early_leave';
        attendence_counter = attendence_counter + 1;
    end
else
    attendence{attendence_counter} = 'no_punch_out';
    attendence_counter = attendence_counter + 1;
end



end