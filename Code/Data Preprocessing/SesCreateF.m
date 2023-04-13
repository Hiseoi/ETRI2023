%% 데이터를 ECG 처리에 유효한 셀형 배열로 변환 오류 있는듯하니 내일 확인할 것.
function rawDataF = SesCreateF(sesnum)
    rawSigFdir="C:\Martian\학습\공모전\KEMDy19\ECG\ECG_NAdelete\Sess"+sesnum+"F_seg.csv"
    ECG_Ffile = readtable(rawSigFdir);
    k=1;
    ECG_Fsignal = {}; 
    ECG_ID = {};
    ECG_batch = {};
    
    for i = 1: (height(ECG_Ffile)-1)
    
        A= char(ECG_Ffile{i,"ID"}) ;
        B= char(ECG_Ffile{i+1,"ID"});
    
            if strcmp(A,B)==1 %i와 i+1의 ID가 같을 경우 같은 segment
              ECG_batch = horzcat(ECG_batch, ECG_Ffile{i,"ECGdata"});
            
            else %i와 i+1의 ID가 다를 경우, 이후부터 다른 segment
              ECG_batch = horzcat(ECG_batch, ECG_Ffile{i,"ECGdata"}); %현재까지의 값 저장
              ECG_Fsignal{k,1} = cell2mat(ECG_batch); %해당 signal을 k번째 cell에 저장
              ECG_ID{k,1}= string(ECG_Ffile{i,"ID"});
              ECG_batch={}; % batch 초기화
              k=k+1;      
            end
    
    end
    ECG_batch = horzcat(ECG_batch, ECG_Ffile{height(ECG_Ffile),"ECGdata"});
    ECG_Fsignal{k,1} = cell2mat(ECG_batch);
    ECG_ID{k,1}= string(ECG_Ffile{i,"ID"});
    ECGSigId= horzcat(ECG_Fsignal, ECG_ID);
    
    Emotion_Ffile = readtable("C:\Martian\학습\공모전\KEMDy19\annotation\Session"+sesnum+"_F_res.csv", VariableNamingRule='preserve');
    Emotion_Ffile(1,:)=[];
    origin_B= string(Emotion_Ffile{:,"Segment ID"});
    IDinfo= string(ECG_ID);

    [SAME,ia,ib] = intersect(origin_B, IDinfo, 'rows');
    ia=sort(ia);
    ib=sort(ib);
    EmotionF=Emotion_Ffile{ia,"Total Evaluation"};
    SegID=Emotion_Ffile{ia,"Segment ID"};
    ECG_signal=ECGSigId(ib,1);


    for j = 1:height(EmotionF)
        if contains(EmotionF{j,1},';') == 1
            MultiE = split(EmotionF{j,1},";");
            EmotionF{j,1} = MultiE{1,1};
        end
    end




 rawSignalF=ECG_signal;
 rawValueF=EmotionF;
 rawIDF=SegID;

 rawDataF= table(rawIDF, rawSignalF, rawValueF);

end
