function timePunchRules

g1 = {'startTime <= 09:05' 'startTime > 09:05 but startTime<=10:00' 'startTime > 10:00' 'no startTime'};
g2 = {'endTime <=17:30' 'endTime >17:30' 'no endTime'};

counter = 1;
for i = 1:length(g1)
    for j = 1:length(g2)
        disp(['[' num2str(counter) ']' g1{i} ',' g2{j}]);
        counter = counter+1;
    end
end

end


% [1]startTime <= 09:05,endTime <=17:30  [??]
% [2]startTime <= 09:05,endTime >17:30   [??]
% [3]startTime <= 09:05,no endTime    [???]
% [4]startTime > 09:05 but startTime<=10:00,endTime <=17:30   [??1,??]
% [5]startTime > 09:05 but startTime<=10:00,endTime >17:30    [??1]
% [6]startTime > 09:05 but startTime<=10:00,no endTime    [??1,???]
% [7]startTime > 10:00,endTime <=17:30    [??2,??]
% [8]startTime > 10:00,endTime >17:30    [??2]
% [9]startTime > 10:00,no endTime    [??2,???]
% [10]no startTime,endTime <=17:30    [???,??]
% [11]no startTime,endTime >17:30    [???]
% [12]no startTime,no endTime    [???,???]