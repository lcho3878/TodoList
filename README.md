# TodoList
UiKit 를 이용한 Todolist 어플리케이션
<br><br><br><br>

## 🧑🏻‍💻 프로젝트 소개
프로젝트 타이틀<p>
소개를 해주세요 <br>

<br><br>

## 🛠️ 사용한 기술 스택 (Tech Stack)
<img src="https://img.shields.io/badge/Swift-F05138?style=for-the-badge&logo=Swift&logoColor=white"><img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white"><img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white">

<br><br>

## 🗓️ 개발 기간
* 2023-07-31(월) ~ 2023-08-10(목), 9일간

<br><br>

## 📌 주요 기능
#### 새 Todo 추가 기능
- 완료해야하는 Todo의 내용 입력
- 목표 날짜 설정
#### TodoList 기능
- 선택한 Todo의 수정 및 완료여부 체크
- 완료한 Todo를 완료목록으로 전송
#### 삭제 기능
- 완료한 Todo를 선택하여 삭제
- Todolist의 항목도 선택하여 삭제


<br><br>

## 🧐 앱 실행 및 사용 방법
(앱 첫화면의 사용 설명서를 눌러서도 확인가능 합니다.)
- 할일 목록에서 현재 해야할 일들을 조회할 수 있습니다.
- 할일 목록의 추가 버튼을 눌러 새 할일을 추가할 수 있습니다.
- 새로운 할일 추가 시 목표 날짜를 선택할 수 있습니다.
- 할일 목록에서 항목을 선택하여 수정 혹은 삭제가 가능합니다.
- 할일 목록에서 스위치를 클릭하면 완료할 수 있습니다.
- 완료된 할일의 스위치를 한번 더 클릭하여 완료 목록으로 보낼 수 있습니다.
- 목표 날짜 이전에 완료한다면 점수를 획득할 수 있습니다.
- 완료 목록에서 항목을 선택하여 삭제가 가능합니다. 
(주의 : 획득한 점수가 사라지게 됩니다.)

!!완료한 일이 하나라도 있다면 완료 목록에 숨겨진 이스터 에그가 있으니 찾아보세요!!



<br><br>


## 💡 추가할 기능
1. 완료 점수에 따른 등급 기능<br>
- 점수가 올라감에 따라 등급을 부여하여 동기부여가 되도록 함
<br><br>

## 🚨 현재 오류
- 완료 목록의 내역 삭제 시, 해당 Todo로 얻은 점수가 없어지는 현상. -> score를 계산하는 방식을 변경하여 해결 예정

<br><br>

## 💥 트러블 슈팅
- 기존 Todo Class의 프로퍼티로 UiSwitch를 사용하였으나, TableView의 Sectiond을 reload하는 과정에서 무한 로딩이 발생하여,
UiSwitch프로퍼티를 Bool 타입인 isComplete으로 변경한 뒤, UiSwitch의 on/off 여부를 isComplete를 이용하는 방향으로 변경하여 해결
