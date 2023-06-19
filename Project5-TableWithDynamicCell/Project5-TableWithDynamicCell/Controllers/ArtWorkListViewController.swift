
import UIKit

// MARK: - 선택된 예술가의 작품을 보여주는 화면
class ArtWorkListViewController: UIViewController {

    var artist : Artists?
    
    @IBOutlet weak var artWorkListTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        guard let artist = artist else {
                fatalError("이전화면 데이터 로드 중 에러 발생")
        }
        
        title = artist.name
        setTable()
    }
    
    func setTable() {
        artWorkListTableView.dataSource = self
        artWorkListTableView.delegate = self
        
        // MARK: - xib파일로 생성한 테이블 셀 등록
        let artWorkTableCell = UINib(nibName: "ArtWorkTableViewCell", bundle: nil)
        artWorkListTableView.register(artWorkTableCell, forCellReuseIdentifier: "ArtWork")
        
        // MARK: - 손쉬운 사용을 통해 시스템 폰트 변경 시 테이블 변화가 발생하도록 합니다.
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: .none, queue: OperationQueue.main) { [weak self] _ in
            guard let self = self else {return}
            self.artWorkListTableView.reloadData()
        }
    }



}

extension ArtWorkListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let artist = artist, let artWorks = artist.works else {
            fatalError("테이블 row 개수 계산 중 에러 발생")
        }
        
        return artWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let artist = artist, let currentArtWork = artist.works?[indexPath.row]  else {
            fatalError("\(indexPath.row)행 설정 중 에러 발생")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtWork", for: indexPath) as! ArtWorkTableViewCell
        
        cell.workImageView.image = UIImage(named: currentArtWork.image ?? "")
        cell.workNameLabel.text = currentArtWork.title
        cell.workInfoLabel.text = currentArtWork.isSelected ? currentArtWork.info : "Select For More Info >"
        
        return cell
    }
    
    
}

extension ArtWorkListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let artist = artist, let currentArtWork = artist.works?[indexPath.row], let cell = tableView.cellForRow(at: indexPath) as? ArtWorkTableViewCell else {
            fatalError("셀 선택 중 에러 발생")
        }
        
        // MARK: - 셀 선택시마다 설명을 보이기/숨기기 처리합니다.
        currentArtWork.isSelected.toggle()
        
        // MARK: - 설명의 길이에 따른 레이아웃 변화를 테이블에 반영합니다.
        UIView.animate(withDuration: 1.0) {
            tableView.beginUpdates()
            cell.workInfoLabel.text = currentArtWork.isSelected ? currentArtWork.info : "Select For More Info >"
            cell.workInfoLabel.textAlignment = currentArtWork.isSelected ? .natural : .center
            tableView.endUpdates()
        }
        
        // MARK: - 선택한 셀이 테이블 상단에 보여지도록 만듭니다.
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
    }
}
