
import UIKit

class ArtWorkListViewController: UIViewController {

    var artist : Artists?
    
    @IBOutlet weak var artWorkListTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
    }
    
    func setUI() {
        guard let artist = artist else {return}
        title = artist.name
        setTable()
    }
    
    func setTable() {
        let artWorkTableCell = UINib(nibName: "ArtWorkTableViewCell", bundle: nil)
        artWorkListTableView.dataSource = self
        artWorkListTableView.delegate = self
        artWorkListTableView.register(artWorkTableCell, forCellReuseIdentifier: "ArtWork")
    }



}

extension ArtWorkListViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let artist = artist, let artWorks = artist.works else {
            print("이전 화면에서 데이터 전달 실패!")
            return 0
        }
        
        return artWorks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let artist = artist, let currentArtWork = artist.works?[indexPath.row]  else {return ArtWorkTableViewCell()}
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtWork", for: indexPath) as! ArtWorkTableViewCell
        
        cell.workImageView.image = UIImage(named: currentArtWork.image ?? "")
        cell.workNameLabel.text = currentArtWork.title
        cell.workInfoLabel.text = currentArtWork.info
        
        return cell
    }
    
    
}

extension ArtWorkListViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("선택 시 설명 ON/OFF 기능 구현예정")
    }
}
