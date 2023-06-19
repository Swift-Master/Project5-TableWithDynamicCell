
import UIKit

// MARK: - 예술가 목록을 보여주는 최초 화면
class ArtistListViewController: UIViewController {
    
    var artGallery : Gallery?
    
    @IBOutlet weak var artistTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        setTable()
    }
    
    func setTable() {
        artistTableView.dataSource = self
        artistTableView.delegate = self
        
        // MARK: - xib파일로 생성한 테이블 셀 등록
        let artWorkTableViewCell = UINib(nibName: "ArtistTableViewCell", bundle: nil)
        artistTableView.register(artWorkTableViewCell, forCellReuseIdentifier: "Artist")
        
        // MARK: - 손쉬운 사용을 통해 시스템 폰트 변경 시 테이블 변화가 발생하도록 합니다.
        NotificationCenter.default.addObserver(forName: UIContentSizeCategory.didChangeNotification, object: .none, queue: OperationQueue.main) { [weak self] _ in
            guard let self = self else {return}
            self.artistTableView.reloadData()
        }
    }
    
    // MARK: - 모델 데이터를 로드합니다
    func getData() {
        artGallery = Gallery.getData()
    }
    
}

extension ArtistListViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let gallery = artGallery else {
            fatalError("테이블 row 개수 계산 중 에러 발생")
        }
        
        return gallery.artists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let gallery = artGallery, let currentArtist = gallery.artists[indexPath.row], let artistImage = currentArtist.image, let cell = tableView.dequeueReusableCell(withIdentifier: "Artist", for: indexPath) as? ArtistTableViewCell else {
            fatalError("\(indexPath.row)행 설정 중 에러 발생")
        }
        
        cell.artistImageView.image = UIImage(named: artistImage)
        cell.artistNameLabel.text = currentArtist.name
        cell.artistDescriptionLabel.text = currentArtist.bio
        
        return cell
    }
}

extension ArtistListViewController : UITableViewDelegate {
    
    // MARK: - 셀 선택 시 현재 row의 데이터와 함께 다음 화면으로 전환합니다.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gallery = artGallery, let currentArtist = gallery.artists[indexPath.row] else {
            fatalError("셀 선택 중 에러 발생")
        }
        guard let nextVC = storyboard?.instantiateViewController(identifier: "ArtWorkListViewController") as? ArtWorkListViewController else {
            fatalError("다음 화면 로드 실패!")
        }
        nextVC.artist = currentArtist
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

