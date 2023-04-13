
%% Value별 Data 분류

ECGsignalF={SignalsF, LabelsF} 
emotion0x = SignalsF(LabelsF=='happy');
emotion0y = LabelsF(LabelsF=='happy');

emotion1x = SignalsF(LabelsF=='surprise');
emotion1y = LabelsF(LabelsF=='surprise');

emotion2x = SignalsF(LabelsF=='angry');
emotion2y = LabelsF(LabelsF=='angry');

emotion3x = SignalsF(LabelsF=='neutral');
emotion3y = LabelsF(LabelsF=='neutral');

emotion4x = SignalsF(LabelsF=='disgust');
emotion4y = LabelsF(LabelsF=='disgust');

emotion5x = SignalsF(LabelsF=='fear');
emotion5y = LabelsF(LabelsF=='fear');

emotion6x = SignalsF(LabelsF=='sad');
emotion6y = LabelsF(LabelsF=='sad');


%% Train test 분할과정 

LabelcountF=countcats(LabelsF);
LabelcountF(1);

[trainInd0,~,testInd0] = dividerand(LabelcountF(1),0.8,0.0,0.2);
[trainInd1,~,testInd1] = dividerand(LabelcountF(2),0.8,0.0,0.2);
[trainInd2,~,testInd2] = dividerand(LabelcountF(3),0.8,0.0,0.2);
[trainInd3,~,testInd3] = dividerand(LabelcountF(4),0.8,0.0,0.2);
[trainInd4,~,testInd4] = dividerand(LabelcountF(5),0.8,0.0,0.2);
[trainInd5,~,testInd5] = dividerand(LabelcountF(6),0.8,0.0,0.2);
[trainInd6,~,testInd6] = dividerand(LabelcountF(7),0.8,0.0,0.2);


XTrain0 = emotion0x(trainInd0);
YTrain0 = emotion0y(trainInd0);

XTrain1 = emotion1x(trainInd1);
YTrain1 = emotion1y(trainInd1);

XTrain2 = emotion2x(trainInd2);
YTrain2 = emotion2y(trainInd2);

XTrain3 = emotion3x(trainInd3);
YTrain3 = emotion3y(trainInd3);

XTrain4 = emotion4x(trainInd4);
YTrain4 = emotion4y(trainInd4);

XTrain5 = emotion5x(trainInd5);
YTrain5 = emotion5y(trainInd5);

XTrain6 = emotion6x(trainInd6);
YTrain6 = emotion6y(trainInd6);

XTest0 = emotion0x(testInd0);
YTest0 = emotion0y(testInd0);

XTest1 = emotion1x(testInd1);
YTest1 = emotion1y(testInd1);

XTest2 = emotion2x(testInd2);
YTest2 = emotion2y(testInd2);

XTest3 = emotion3x(testInd3);
YTest3 = emotion3y(testInd3);

XTest4 = emotion4x(testInd4);
YTest4 = emotion4y(testInd4);

XTest5 = emotion5x(testInd5);
YTest5 = emotion5y(testInd5);

XTest6 = emotion6x(testInd6);
YTest6 = emotion6y(testInd6);
%% Value별 Data값 확인 
dataheight=[height(emotion0x),height(emotion1x),height(emotion2x),height(emotion3x),height(emotion4x),height(emotion5x),height(emotion6x)]
datasum=sum(dataheight);
dataratio=dataheight/datasum
times = 1./dataratio
times/2

%% repmat으로 불균형 해소 

XTrain = [repmat(XTrain0,5,1); repmat(XTrain1,7,1); repmat(XTrain2,3,1); XTrain3; repmat(XTrain4,16,1) ; repmat(XTrain5,9,1); repmat(XTrain6,5,1)];
YTrain = [repmat(YTrain0,5,1); repmat(YTrain1,7,1); repmat(YTrain2,3,1); YTrain3; repmat(YTrain4,16,1) ; repmat(YTrain5,9,1); repmat(YTrain6,5,1)];
XTest = [repmat(XTest0,5,1); repmat(XTest1,7,1); repmat(XTest2,3,1); XTest3; repmat(XTest4,16,1) ; repmat(XTest5,9,1); repmat(XTest6,5,1)];
YTest = [repmat(YTest0,5,1); repmat(YTest1,7,1); repmat(YTest2,3,1); YTest3; repmat(YTest4,16,1) ; repmat(YTest5,9,1); repmat(YTest6,5,1)];
%% instFreq-Feature extraction
fs=250;
instfreqTrain = cellfun(@(x)instfreq(x,fs)',XTrain,'UniformOutput',false);
instfreqTest = cellfun(@(x)instfreq(x,fs)',XTest,'UniformOutput',false);
pentropyTrain = cellfun(@(x)pentropy(x,fs)',XTrain,'UniformOutput',false);
pentropyTest = cellfun(@(x)pentropy(x,fs)',XTest,'UniformOutput',false);
%% pentropy-feature extraction
XTrain2nd = cellfun(@(x,y)[x;y],instfreqTrain,pentropyTrain,'UniformOutput',false);
XTest2nd = cellfun(@(x,y)[x;y],instfreqTest,pentropyTest,'UniformOutput',false);

%% 
XTraink=[];
XTestk=[];
for i = 1:height(XTrain2nd)
    
    doub=[XTrain2nd{i,1}];
    doub=rmmissing(doub,2);
    XTraink{i,1}=doub;
end

for k = 1:height(XTest2nd)
    doubtest=[XTest2nd{k,1}];
    doubtest=rmmissing(doubtest,2);
    XTestk{k,1}=doubtest;
end

%% Normalization
XV = [XTraink{:}];
mu = mean(XV, 2);
sg = std(XV,[] ,2);

XTrainSD = XTraink;
XTrainSD = cellfun(@(x)(x-mu)./sg,XTrainSD,'UniformOutput',false);

XTestSD = XTestk;
XTestSD = cellfun(@(x)(x-mu)./sg,XTestSD,'UniformOutput',false);
%% Data 확인 
instFreqNSD = XTrainSD{1}(1,:);
pentropyNSD = XTrainSD{1}(2,:);

mean(instFreqNSD)
mean(pentropyNSD)

%% Network
layers = [ ...
    sequenceInputLayer(2)
    bilstmLayer(100,'OutputMode','last')
    fullyConnectedLayer(7)
    softmaxLayer
    classificationLayer
    ]
options = trainingOptions('adam', ...
    'MaxEpochs',15, ...
    'MiniBatchSize', 150, ...
    'InitialLearnRate', 0.01, ...
    'SequenceLength', 1000, ...
    'GradientThreshold', 1, ...
    'ExecutionEnvironment',"auto",...
    'plots','training-progress', ...
    'Verbose',false);
%% Net 실행
net2 = trainNetwork(XTrainSD,YTrain,layers,options);
%% Classify Train

[trainPred2,score] = classify(net2,XTrainSD);
LSTMAccuracy = sum(trainPred2 == YTrain)/numel(YTrain)*100

figure
confusionchart(YTrain,trainPred2,'ColumnSummary','column-normalized',...
              'RowSummary','row-normalized','Title','Confusion Chart for LSTM');

%% Classify Train
testPred2 = classify(net2,XTestSD);
%% Accuracy

LSTMAccuracy = sum(testPred2 == YTest)/numel(YTest)*100



