function peopleSet = readNames()

fid1 = fopen('data/hetongzhi_all_people.csv','r', 'n','UTF-8'); %# open csv file for reading
peopleSet = {};
peopleCount = 1;

while ~feof(fid1)
    line = fgets(fid1); %# read line by line
    lineSplit = strsplit(line,',','CollapseDelimiters',false);
    
    tempPeople = peopleBuilder(lineSplit{6},lineSplit{2},lineSplit{11});
    a = 1;
    peopleSet{peopleCount} = tempPeople;
    peopleCount = peopleCount + 1;
end
fclose(fid1);





fid1 = fopen('disanfang_all_people.csv','r', 'n','UTF-8'); %# open csv file for reading

while ~feof(fid1)
    line = fgets(fid1); %# read line by line
    lineSplit = strsplit(line,',','CollapseDelimiters',false);
    
    tempPeople = peopleBuilder(lineSplit{6},lineSplit{2},lineSplit{10});
    a = 1;
    peopleSet{peopleCount} = tempPeople;
    peopleCount = peopleCount + 1;
end
fclose(fid1);
end