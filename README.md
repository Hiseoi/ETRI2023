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
- [Speaker Train Wav MFCC]()

  발화자 훈련 데이터의 MFCC
- [Speaker Test Wav MFCC]()

  발화자 검증 데이터의 MFCC
- [Listener Train Wav MFCC]()

  청자 훈련 데이터의 MFCC
- [Listener Test Wav MFCC]()

  청자 검증 데이터의 MFCC
- [Speaker Txt Tsv]()
- [Speaker Txt Tsv]()

## Code

- Data Preprocessing
- MFCC Extraction
- MFCC 2d Conv
- KoBERT
- Feature Fusion

## Model

오디오는 MFCC를 추출해 2d convolution, 텍스트는 [KOBERT](https://github.com/SKTBrain/KoBERT)를 통해 예측하였다.

## Description

오디오: 각 MFCC 파일을 구글 드라이브의 ETRI 폴더에 위치시킨 후 MFCC 2d Conv 코드를 실행한다.


## Contributors

- [김현서](https://github.com/Hiseoi)
- [정보경](https://github.com/martian0915)
- [이보연](https://github.com/JumpingDragon)
