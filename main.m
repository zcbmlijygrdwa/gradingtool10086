close all;
clear all;

addpath('data')

peopleSet = readNames();



xiujiaSet = readXiujia();

gongchuSet = readGongchu();

ChuchaiSet = readChuchai();

timePunchSet = readDaka(gongchuSet,xiujiaSet,ChuchaiSet);

excludeDates = [3,4,10,11,17,18,24,25];

str_shengbu = 'shengbu';
peopleSet_shengbu = {};
peopleSet_shengbu_counter = 1;
for i = 1:length(peopleSet)
    if(strcmp(peopleSet{i}.location,str_shengbu))
        peopleSet_shengbu{peopleSet_shengbu_counter} = peopleSet{i};
        peopleSet_shengbu_counter = peopleSet_shengbu_counter+1;
    end
end


% generate peopleReportSet
peopleReportSet = {};
peopleReport_counter = 1;

length_peopleSet_shengbu = length(peopleSet_shengbu);
for peopleIdx = 1:length(peopleSet_shengbu)
    tempPeople = peopleSet_shengbu{peopleIdx};
    status.full_attendence = 0;
    status.late1 = 0;
    status.late2 = 0;
    status.early_leave = 0;
    status.no_punch_in = 0;
    status.no_punch_out = 0;
    status.no_punch_all_day = 0;
    
    if tempPeople.id == 6220147
        a = 1;
    end
    
    disp(['checking ' tempPeople.name '...']);
    for day = 1:30
        
        %get rid of holidays/weekends
        if(ismember(day,excludeDates))
            
            continue;
            
        end
        
        tempDateStr = dateStringBuilder(2018,11,day,'-');
        tempDate = dateStringParser(tempDateStr);
        isRecordFound = false;
        for timePunchIdx = 1:length(timePunchSet)
            tempTimePunch = timePunchSet{timePunchIdx};
            if(strcmp(tempTimePunch.dateStr,tempDateStr)  &&  tempTimePunch.id==tempPeople.id)
                isRecordFound = true;
                
                for statusIdx = 1:length(tempTimePunch.attendence)
                    
                    if(strcmp(tempTimePunch.attendence{statusIdx},'full_attendence'))
                        status.full_attendence = status.full_attendence + 1;
                    elseif(strcmp(tempTimePunch.attendence{statusIdx},'late1'))
                        
                        status.late1 = status.late1 + 1;
                        
                    elseif(strcmp(tempTimePunch.attendence{statusIdx},'late2'))
                        status.late2 = status.late2 + 1;
                    elseif(strcmp(tempTimePunch.attendence{statusIdx},'early_leave'))
                       status.early_leave = status.early_leave + 1;
                        
                    elseif(strcmp(tempTimePunch.attendence{statusIdx},'no_punch_in'))
                       status.no_punch_in = status.no_punch_in + 1;
                    elseif(strcmp(tempTimePunch.attendence{statusIdx},'no_punch_out'))
                        status.no_punch_out = status.no_punch_out + 1;
                    elseif(strcmp(tempTimePunch.attendence{statusIdx},'no_punch_all_day'))
                        status.no_punch_all_day = status.no_punch_all_day + 1;
                    end
                end
                break;
            end
        end
        
        if(~isRecordFound)
            disp(['[' num2str(peopleIdx*100.0/length_peopleSet_shengbu) '%] ' tempPeople.name ' - no record on ' tempDateStr ', checking chuchai ...'])
            checkIsChuchaiRes = checkIsChuchai(tempPeople.id,tempDate,ChuchaiSet);
            if(checkIsChuchaiRes)
                status.full_attendence = status.full_attendence + 1;
                disp('chuchai found!');
            else
                disp('no chuchai......');
            end
            
            
            if(~checkIsChuchaiRes)
                disp('checking if gongchu all day...');
                tempgongchu = getGongchu(tempPeople.id,tempDate,gongchuSet);
                if(length(tempgongchu)~=0&& tempgongchu.isAllDay)
                    checkIsGongchuAllDayRes = true;
                else
                    checkIsGongchuAllDayRes = false;
                end
                %checkIsGongchuAllDayRes = checkIsGongchuAllDay(tempPeople.id,tempDate,gongchuSet);
                if(checkIsGongchuAllDayRes)
                    status.full_attendence = status.full_attendence + 1;
                    disp('all day gongchu found!');
                else
                    disp('no all day gongchu......');
                end
            end
            
            if(~checkIsGongchuAllDayRes)
                disp('checking if xiujia all day...');
                
                tempXiujia = getXiujia(tempPeople.id,tempDate,xiujiaSet);
                if(length(tempXiujia)~=0&& tempXiujia.isAllDay)
                    checkIsXiujiaAllDayRes = true;
                else
                    checkIsXiujiaAllDayRes = false;
                end
                
                if(checkIsXiujiaAllDayRes)
                    status.full_attendence = status.full_attendence + 1;
                    disp('all day xiujia found!');
                else
                    disp('no all day xiujia......');
                end
            end
            
            if((~checkIsChuchaiRes)&&(~checkIsGongchuAllDayRes) && (~checkIsXiujiaAllDayRes))
                
                noonSeconds = timeToSeconds(timeBuilder(12,0,0));
                isMorningGood = false;
                isAfternoonGoold = false;
                
                if(length(tempgongchu)~=0)
                    %check partial gongchu
                    if(timeToSeconds(tempgongchu.startTime)<noonSeconds)
                        isMorningGood = true;
                    else
                        isAfternoonGoold = true;
                    end
                end
                
                if(length(tempXiujia)~=0)
                    %check partial xiujia
                    if(timeToSeconds(tempXiujia.startTime)<noonSeconds)
                        isMorningGood = true;
                    else
                        isAfternoonGoold = true;
                    end
                end
                
                if(isMorningGood&&isAfternoonGoold)
                    disp("WTF????????????????????");
                else
                    if(isMorningGood)
                        status.no_punch_out = status.no_punch_out + 1;
                        
                    elseif(isAfternoonGoold)
                        status.no_punch_in = status.no_punch_in + 1;
                    else       
                        status.no_punch_all_day = status.no_punch_all_day + 1;
                    end
                end
            end
        end
    end
    
    peopleReportSet{peopleReport_counter} = peopleReportBuilder(tempPeople, status);
    peopleReport_counter = peopleReport_counter + 1;
end


%write into txt
fileID = fopen(['kaoqing11_new.csv'],'wt','n','UTF-8');
for reportIdx = 1:length(peopleReportSet)
    peopleReport = peopleReportSet{reportIdx};
    reportStr = [peopleReport.people.name ',' num2str(peopleReport.people.id)];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.full_attendence) ];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.late1) ];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.late2) ];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.early_leave) ];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.no_punch_in) ];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.no_punch_out) ];
    reportStr = [reportStr ',' num2str(peopleReport.statusSet.no_punch_all_day) '\n']
    
    fprintf(fileID,reportStr);
end

fclose(fileID);

