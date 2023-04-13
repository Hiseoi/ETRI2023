%% 7500에 가장 가까운 양만큼  segment 배정/signal 7500 개씩 cut/해당하는 segment ID를 저장
function [Signal, IDinfo, Labels] = ECG_7500(rawData)
a=0;
m=1;
sig=[];
segID={};
ECG_7500={};
rawcell=table2cell(rawData);

for k = 1 : height(rawcell)
    a = length(sig);  
    if a < 7500
        sigmat = rmmissing(rawcell(k,2));
        sig=cell2mat([sig, sigmat]);
        segID = vertcat(segID , rawcell(k,1));
    else
        sigmat = rmmissing(rawcell(k,2));
        sig=cell2mat([sig, sigmat]);
        segID = vertcat(segID , rawcell(k,1));
        anynan(sig)
        ECG_7500{m,1} = sig(1:7500);
        IDinfo{m,1}= segID;
        m=m+1;
        a=0;
        sig= {};
        segID={};

    end
end

Signal= ECG_7500;
ID=IDinfo;

c=0;
d=0;

%최다 감정 추출
for j = 1: height(Signal)
    %1행~ ID개수 
    if j ==1
    c = 1;
    d= height(ID{j,:});
    %새 group의 ID 시작~끝
    else
    c= c+height(ID{j-1,:});
    d= c+height(ID{j,:})-1;
    end

    %group 내 감정 categorize  후 최다 추출
    Erange= categorical(rawcell(c:d,3));
    B = countcats(Erange);
    [locx,locy] = find(B==max(B));
    Erangec=categories(Erange);    
    Emotion{j,1}=Erangec{min(locx)};
end

emotiontype={'happy','surprise','angry','neutral','disgust','fear','sad'};
Labels = categorical(Emotion, emotiontype);

end