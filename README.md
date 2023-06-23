## 프로젝트 5 : TableWithDynamicCell

이 앱의 레퍼런스는 [soapyigu의 Swift-30-Projects](https://github.com/soapyigu/Swift-30-Projects)입니다.

기본 기능을 모두 구현했다면, 디자인 및 추가 기능 구현은 자유롭게 해주세요.

##  구현 요구 항목(필요에 따라 추가 또는 제거해주세요)

### 화면 기능
#### 화가 리스트 화면
- [X] 첫 화면으로 설정, 네비게이션 타이틀 표시
- [X] 화가 사진, 이름, 설명이 포함된 테이블 뷰 구현
- [X] 셀 선택 시 화면 전환 및 선택 셀 정보를 전달

#### 화가 작품 리스트 화면
- [X] 화가 이름을 네비게이션 타이틀로 설정
- [X] 작품 그림, 이름, 설명이 포함된 테이블 뷰 구현
- [X] 설명은 최초 로드시 보이지 않고, 이후 선택할 때마다 펼쳐짐/접힘 

### 기술 도전 과제
- [X] Asset을 사용하지 않고 JSON 파일 로드
- [X] 이미지 크기, 설명 길이에 따라 셀의 크기 동적 조절
- [X] notification 사용

## 구현 과정

### [20230619]
- ArtistListTableView, ArtistListTableViewCell UI 개발

### [20230620]
- JSON Codable 구조체에 담아 불러오기
  - [Bundle.main.path](https://ios-development.tistory.com/507) 사용

### [20230621]
- JSON Data ArtistListTableView 적용
  - Issue ⭐️
    ArtistList Cell을 선택하면 다음 화면으로 넘어가야 했는데, bio를 출력하는 TextView의 특성상 텍스트를 편집하고 선택하는 기능이 있어서 이외의 다른 상호작용을 하려면 TextView의 기능을 하지 않도록 하는 코드를 추가해야 한다.
    ```swift
    cell.artistBioTextView.isUserInteractionEnabled = false
    ```
    레퍼런스 화면에 맞게 텍스트들이 뷰 중간으로 와야해서 현재는 TextView -> Label로 변경한 상태.
- WorkListTableView, WorkListTableViewCell UI 개발

### [20230622]
- TableViewCell 동적 높이 조절
  1. UITableView의 rowHeight 속성을 automaticDimension으로 설정
  2. estimatedRowHeight 속성을 예상 높이 값 임의 설정
  3. didSelectRowAt에서 isHidden 처리를 변경하고 row 새로고침을 한다.
  - Issue ⭐️
    row를 새로고침 할 때 `tableView.reloadRow()`를 사용했지만 Cell을 한 번 누를 때는 반응하지 않고 두 번 눌러야 반응하는 현상이 생겼다. 레퍼런스를 참고해서 `beginUpdates()`, `endUpdates()`, `tableView.scrollToRow()`로 변경하여 해결 완료.

### [20230623]
- Notification 적용
  - 레퍼런스에서는 기기 설정에서 텍스트 크기를 변경했을 때를 감지해서 bio, workInfo Label Text 크기를 변경하도록 개발되어 있다.
  - 다른 방식으로 변경해볼까 했는데 신박한 방법이 따로 떠오르지 않아서 레퍼런스대로 진행
    ```swift
    // Notification
    NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: .none, queue: OperationQueue.main) { [weak self] _ in
		  self?.workListTableView.reloadData()
    }

    // Label Font 설정
    cell.workInfoLabel.font = UIFont.preferredFont(forTextStyle: .body)
    ```
    해당 Label이 설정에 따라 폰트 크기 및 스타일이 자동 적용 되도록 코드 추가

## 구현 화면
<img src="./TableWithDynamicCell_step1.gif" width="300" />
