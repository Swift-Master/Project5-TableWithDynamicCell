
import UIKit

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
        
        let artWorkTableViewCell = UINib(nibName: "ArtistTableViewCell", bundle: nil)
        artistTableView.register(artWorkTableViewCell, forCellReuseIdentifier: "Artist")
    }
    func getData() {
        artGallery = Gallery.getData()
    }
    
}

extension ArtistListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let gallery = artGallery else {
            print("테이블 데이터 모델 로드 실패!")
            return 0
        }
        
        return gallery.artists.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let gallery = artGallery, let currentArtist = gallery.artists[indexPath.row] else {
            print("테이블 데이터 모델 로드 실패!")
            return UITableViewCell()
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: "Artist", for: indexPath) as! ArtistTableViewCell
        
        cell.artistImageView.image = UIImage(named:currentArtist.image ?? "")
        cell.artistNameLabel.text = currentArtist.name
        cell.artistDescriptionLabel.text = currentArtist.bio
        return cell
    }
}

extension ArtistListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let gallery = artGallery, let currentArtist = gallery.artists[indexPath.row] else {
            print("테이블 데이터 모델 로드 실패!")
            return
        }
        guard let nextVC = storyboard?.instantiateViewController(identifier: "ArtWorkListViewController") as? ArtWorkListViewController else {
            print("뷰 컨트롤러 인스턴스화 실패")
            return
        }
        nextVC.artist = currentArtist
        navigationController?.pushViewController(nextVC, animated: true)
    }
}

