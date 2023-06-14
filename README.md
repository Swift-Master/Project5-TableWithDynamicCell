## 프로젝트 5 : TableWithDynamicCell

이 앱의 레퍼런스는 [soapyigu의 Swift-30-Projects](https://github.com/soapyigu/Swift-30-Projects)입니다.

기본 기능을 모두 구현했다면, 디자인 및 추가 기능 구현은 자유롭게 해주세요.

##  구현 요구 항목(필요에 따라 추가 또는 제거해주세요)

### 화면 기능
#### 화가 리스트 화면
- [x] 첫 화면으로 설정, 네비게이션 타이틀 표시
- [x] 화가 사진, 이름, 설명이 포함된 테이블 뷰 구현
- [x] 셀 선택 시 화면 전환 및 선택 셀 정보를 전달

#### 화가 작품 리스트 화면
- [x] 화가 이름을 네비게이션 타이틀로 설정
- [x] 작품 그림, 이름, 설명이 포함된 테이블 뷰 구현
- [ ] 설명은 최초 로드시 보이지 않고, 이후 선택할 때마다 펼쳐짐/접힘 

### 기술 도전 과제
- [x] Asset을 사용하지 않고 JSON 파일 로드
- [ ] 이미지 크기, 설명 길이에 따라 셀의 크기 동적 조절
- [ ] notification 사용

## 가이드

영상 가이드는 [코드스쿼드 pr연습](https://www.youtube.com/watch?v=lFinZfu3QO0)을 참조해주세요.

1. 본인 이름으로 브랜치(ex: PAKA)를 생성한 후, 자신의 레포로 fork해주세요.

2. fork 한 레포에서 기능 또는 화면 단위로 새 브랜치(ex: pr1)를 생성 후 작업 및 커밋합니다. 

3. 커밋했던 브랜치(pr1)에서 자신의 이름 브랜치(PAKA)로 PR을 올려주세요.

4. 코드 리뷰를 받고 모든 수정사항을 반영한 후 `squash and merge` 옵션으로 자신의 브랜치에 merge해주세요.

5. merge했던 브랜치(pr1)에서 fork한 레포의 main 브랜치로 checkout후 해당 브랜치(pr1)를 삭제합니다.

6. 다음 명령어들을 순차적으로 실행합니다.

```

    git remote add upstream https://github.com/Swift-Master/Project1-GoodAsOldPhones

    git fetch upstream `본인의 브랜치명(ex:PAKA)`

    git rebase upstream `upstream/본인의브랜치명(ex:PAKA)`

```

7. 2번으로 돌아가 새로운 작업을 반복합니다.

## 실제 화면

![시뮬레이터화면](./project5.gif)
