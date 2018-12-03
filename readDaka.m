function timePunchSet = readDaka(gongchuSet,xiujiaSet,ChuchaiSet)

timePunchSet = {};
timePunchSet_Count = 1;

fid1 = fopen('data/11/11daka.csv','r', 'n','UTF-8'); %# open csv file for reading
while ~feof(fid1)
    line = fgets(fid1); %# read line by line
    lineSplit = strsplit(line,',','CollapseDelimiters',false);
    timePunch = timePunchBuilder(lineSplit{1}(2:end),lineSplit{4}(2:end),lineSplit{7}(2:end),lineSplit{8}(2:end-2),gongchuSet,xiujiaSet,ChuchaiSet);
    timePunchSet{timePunchSet_Count} = timePunch;
    timePunchSet_Count = timePunchSet_Count + 1
end
fclose(fid1);
end