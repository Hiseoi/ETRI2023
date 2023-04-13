%% Load Male Data
[rawDataM01]=SesCreateM("01");
[rawDataM02]=SesCreateM("02");
[rawDataM03]=SesCreateM("03");
[rawDataM04]=SesCreateM("04");
[rawDataM05]=SesCreateM("05");
[rawDataM06]=SesCreateM("06");
[rawDataM07]=SesCreateM("07");
[rawDataM08]=SesCreateM("08");
[rawDataM09]=SesCreateM("09");
[rawDataM10]=SesCreateM("10");
[rawDataM11]=SesCreateM("11");
[rawDataM12]=SesCreateM("12");
[rawDataM13]=SesCreateM("13");
[rawDataM14]=SesCreateM("14");
[rawDataM15]=SesCreateM("15");
[rawDataM16]=SesCreateM("16");
[rawDataM17]=SesCreateM("17");
[rawDataM18]=SesCreateM("18");
[rawDataM19]=SesCreateM("19");
[rawDataM20]=SesCreateM("20");
%% Load Female Data
[rawDataF01]=SesCreateF("01");
[rawDataF02]=SesCreateF("02");
[rawDataF03]=SesCreateF("03");
[rawDataF04]=SesCreateF("04");
[rawDataF05]=SesCreateF("05");
[rawDataF06]=SesCreateF("06");
[rawDataF07]=SesCreateF("07");
[rawDataF08]=SesCreateF("08");
[rawDataF09]=SesCreateF("09");
[rawDataF10]=SesCreateF("10");
[rawDataF11]=SesCreateF("11");
[rawDataF12]=SesCreateF("12");
[rawDataF13]=SesCreateF("13");
[rawDataF14]=SesCreateF("14");
[rawDataF15]=SesCreateF("15");
[rawDataF16]=SesCreateF("16");
[rawDataF17]=SesCreateF("17");
[rawDataF18]=SesCreateF("18");
[rawDataF19]=SesCreateF("19");
[rawDataF20]=SesCreateF("20");
%% 7500개 내 포함되는 Signals, ID, Labels

[SignalsF01,idF01,LabelsF01]=ECG_7500(rawDataF01);
[SignalsF02,idF02,LabelsF02]=ECG_7500(rawDataF02);
[SignalsF03,idF03,LabelsF03]=ECG_7500(rawDataF03);
[SignalsF04,idF04,LabelsF04]=ECG_7500(rawDataF04);
[SignalsF05,idF05,LabelsF05]=ECG_7500(rawDataF05);
[SignalsF06,idF06,LabelsF06]=ECG_7500(rawDataF06);
[SignalsF07,idF07,LabelsF07]=ECG_7500(rawDataF07);
[SignalsF08,idF08,LabelsF08]=ECG_7500(rawDataF08);
[SignalsF09,idF09,LabelsF09]=ECG_7500(rawDataF09);
[SignalsF10,idF10,LabelsF10]=ECG_7500(rawDataF10);
[SignalsF11,idF11,LabelsF11]=ECG_7500(rawDataF11);
[SignalsF12,idF12,LabelsF12]=ECG_7500(rawDataF12);
[SignalsF13,idF13,LabelsF13]=ECG_7500(rawDataF13);
[SignalsF14,idF14,LabelsF14]=ECG_7500(rawDataF14);
[SignalsF15,idF15,LabelsF15]=ECG_7500(rawDataF15);
[SignalsF16,idF16,LabelsF16]=ECG_7500(rawDataF16);
[SignalsF17,idF17,LabelsF17]=ECG_7500(rawDataF17);
[SignalsF18,idF18,LabelsF18]=ECG_7500(rawDataF18);
[SignalsF19,idF19,LabelsF19]=ECG_7500(rawDataF19);
[SignalsF20,idF20,LabelsF20]=ECG_7500(rawDataF20);

SignalsF=vertcat(SignalsF01,SignalsF02,SignalsF03,SignalsF04,SignalsF05,SignalsF06,SignalsF07,SignalsF08,SignalsF09,SignalsF10,SignalsF11,SignalsF12,SignalsF13,SignalsF14,SignalsF15,SignalsF16,SignalsF17,SignalsF18,SignalsF19,SignalsF20);
LabelsF=vertcat(LabelsF01,LabelsF02,LabelsF03,LabelsF04,LabelsF05,LabelsF06,LabelsF07,LabelsF08,LabelsF09,LabelsF10,LabelsF11,LabelsF12,LabelsF13,LabelsF14,LabelsF15,LabelsF16,LabelsF17,LabelsF18,LabelsF19,LabelsF20);

%% 
[SignalsM01,idM01,LabelsM01]=ECG_7500(rawDataM01);
[SignalsM02,idM02,LabelsM02]=ECG_7500(rawDataM02);
[SignalsM03,idM03,LabelsM03]=ECG_7500(rawDataM03);
[SignalsM04,idM04,LabelsM04]=ECG_7500(rawDataM04);
[SignalsM05,idM05,LabelsM05]=ECG_7500(rawDataM05);
[SignalsM06,idM06,LabelsM06]=ECG_7500(rawDataM06);
[SignalsM07,idM07,LabelsM07]=ECG_7500(rawDataM07);
[SignalsM08,idM08,LabelsM08]=ECG_7500(rawDataM08);
[SignalsM09,idM09,LabelsM09]=ECG_7500(rawDataM09);
[SignalsM10,idM10,LabelsM10]=ECG_7500(rawDataM10);
[SignalsM11,idM11,LabelsM11]=ECG_7500(rawDataM11);
[SignalsM12,idM12,LabelsM12]=ECG_7500(rawDataM12);
[SignalsM13,idM13,LabelsM13]=ECG_7500(rawDataM13);
[SignalsM14,idM14,LabelsM14]=ECG_7500(rawDataM14);
[SignalsM15,idM15,LabelsM15]=ECG_7500(rawDataM15);
[SignalsM16,idM16,LabelsM16]=ECG_7500(rawDataM16);
[SignalsM17,idM17,LabelsM17]=ECG_7500(rawDataM17);
[SignalsM18,idM18,LabelsM18]=ECG_7500(rawDataM18);
[SignalsM19,idM19,LabelsM19]=ECG_7500(rawDataM19);
[SignalsM20,idM20,LabelsM20]=ECG_7500(rawDataM20);

SignalsM=vertcat(SignalsM01,SignalsM02,SignalsM03,SignalsM04,SignalsM05,SignalsM06,SignalsM07,SignalsM08,SignalsM09,SignalsM10,SignalsM11,SignalsM12,SignalsM13,SignalsM14,SignalsM15,SignalsM16,SignalsM17,SignalsM18,SignalsM19,SignalsM20);
LabelsM=vertcat(LabelsM01,LabelsM02,LabelsM03,LabelsM04,LabelsM05,LabelsM06,LabelsM07,LabelsM08,LabelsM09,LabelsM10,LabelsM11,LabelsM12,LabelsM13,LabelsM14,LabelsM15,LabelsM16,LabelsM17,LabelsM18,LabelsM19,LabelsM20);
%% 
Signals=vertcat(SignalsF, SignalsM);
Labels=vertcat(LabelsF, LabelsM);
