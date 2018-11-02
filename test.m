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