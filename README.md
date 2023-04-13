# ETRI2023
## Project Instruction

위 프로젝트의 목적은 대화 과정에서 대화 참여자의 감정을 인식 또는 예측하는 것이다.

대화 참여자인 남성과 여성의 데이터를 발화자와 청자로 나누어 예측하였다.

## 깃허브 폴더 구조

## Data

- [Speaker Train Dataframe]()

  발화자 훈련 데이터의 Segment ID와 해당 감정, 오디오 데이터, 텍스트 데이터의 경로를 담고 있는 데이터프레임
- [Speaker Test Dataframe]()

  발화자 검증 데이터의 Segment ID와 해당 감정, 오디오 데이터, 텍스트 데이터의 경로를 담고 있는 데이터프레임
- [Listener Train Dataframe]()

  청자 훈련 데이터의 Segment ID와 해당 감정, 오디오 데이터, 텍스트 데이터의 경로를 담고 있는 데이터프레임
- [Listener Test Dataframe]()

  청자 검증 데이터의 Segment ID와 해당 감정, 오디오 데이터, 텍스트 데이터의 경로를 담고 있는 데이터프레임
- [X_sp_train_2d](https://drive.google.com/file/d/1BmVHlA7FUHJWMGslFHcO5GQZug_E8MI5/view?usp=sharing) / [y_sp_train_2d](https://drive.google.com/file/d/1l_TM-lfWh6gSknoDkuutwZYc0dB1cQ5O/view?usp=sharing)

  발화자 훈련 데이터의 MFCC
- [X_sp_test_2d](https://drive.google.com/file/d/1z-N1nfdrGUlWHe3GMR2-_iZT5RiXi-Xa/view?usp=sharing) / [y_sp_test_2d](https://drive.google.com/file/d/1FJqhtIgUXTPJeg336rll0J1vo7ijkqhQ/view?usp=sharing)

  발화자 검증 데이터의 MFCC
- [X_li_train_2d](https://drive.google.com/file/d/1gY2ToETIcHJukj1zybb2byGYysfm5o8o/view?usp=sharing) / [y_li_train_2d](https://drive.google.com/file/d/1_vwx-tiwkrzDEhsqYOuuxe_-aWi_TzZZ/view?usp=sharing)

  청자 훈련 데이터의 MFCC
- [X_li_test_2d](https://drive.google.com/file/d/1Zdyk1zN1Wix9IPY6k39lGqgBy_6Y7CuT/view?usp=sharing) / [y_li_test_2d](https://drive.google.com/file/d/1mGj7VNGlooSBzhYd7PJBX4ONitQ99pes/view?usp=sharing)

  청자 검증 데이터의 MFCC
- Speaker Train Txt Tsv

  발화자 훈련 데이터의 tsv
- Speaker Test Txt Tsv

  발화자 검증 데이터의 tsv
- Listener Train Txt Tsv

  청자 훈련 데이터의 tsv
- Listener Test Txt Tsv

  청자 검증 데이터의 tsv
 
- [ECG_data_variable]()

  전처리 완료된 ECG 데이터의 변수 load용 matlab file


## Code

- Data Preprocessing
- MFCC Extraction
- MFCC 2d Conv
- KoBERT
- ECG Signal learning
- Feature Fusion

## Model

오디오는 MFCC를 추출해 2d convolution, 텍스트는 [KOBERT](https://github.com/SKTBrain/KoBERT), ECG는 LSTM 신경망을 통해 예측하였다.

## Description

텍스트: 각 tsv 파일을 구글 드라이브의 ETRI 폴더에 위치시킨 후 KOBERT 코드를 실행한다.
오디오: 각 MFCC 파일을 구글 드라이브의 ETRI 폴더에 위치시킨 후 MFCC 2d Conv 코드를 실행한다.
ECG signal: 신경망 파일에 preprocessed data를 불러온 후 LSTM 신경망 코드를 실행한다. 

## Contributors

- [김현서](https://github.com/Hiseoi)
- [정보경](https://github.com/martian0915)
- [이보연](https://github.com/JumpingDragon)
