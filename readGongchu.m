function gongchuSet = readGongchu()

gongchuSet = {};
gongchuSet_Count = 1;

fid1 = fopen('data/12/gongchu.csv','r', 'n','UTF-8'); %# open csv file for reading

while ~feof(fid1)
    line = fgets(fid1); %# read line by line
    lineSplit = strsplit(line,',','CollapseDelimiters',false);
    status = lineSplit{9}(1:end-2);
    if(strcmp(status,'complete')||strcmp(status,'pending'))
    gongchu = gongchuBuilder(lineSplit{2}(2:end),lineSplit{6}(2:end),lineSplit{7}(2:end));
    gongchuSet{gongchuSet_Count} = gongchu;
    gongchuSet_Count = gongchuSet_Count + 1;
    end
    
end
fclose(fid1);
end