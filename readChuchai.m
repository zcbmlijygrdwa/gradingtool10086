function ChuchaiSet = readChuchai()

ChuchaiSet = {};
ChuchaiSet_Count = 1;

fid1 = fopen('data/12/chuchai.csv','r', 'n','UTF-8'); %# open csv file for reading

while ~feof(fid1)
    line = fgets(fid1); %# read line by line
    lineSplit = strsplit(line,',','CollapseDelimiters',false);
    status = lineSplit{10}(1:end-2);
    if(strcmp(status,'complete')||strcmp(status,'pending'))
    Chuchai = ChuchaiBuilder(lineSplit{2}(2:end),lineSplit{6},lineSplit{7});
    ChuchaiSet{ChuchaiSet_Count} = Chuchai;
    ChuchaiSet_Count = ChuchaiSet_Count + 1;
    end
    
end
fclose(fid1);
end