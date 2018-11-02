function xiujiaSet = readXiujia()

xiujiaSet = {};
xiujiaSet_Count = 1;

fid1 = fopen('data/xiujia201810261711188971.csv','r', 'n','UTF-8'); %# open csv file for reading

while ~feof(fid1)
    line = fgets(fid1); %# read line by line
    lineSplit = strsplit(line,',','CollapseDelimiters',false);
    status = lineSplit{12}(1:end-2);
    if(strcmp(status,'complete')||strcmp(status,'pending'))
    xiujia = xiujiaBuilder(lineSplit{2}(2:end),lineSplit{8}(2:end),lineSplit{9}(2:end));
    end
    xiujiaSet{xiujiaSet_Count} = xiujia;
    xiujiaSet_Count = xiujiaSet_Count + 1;
end
fclose(fid1);
end