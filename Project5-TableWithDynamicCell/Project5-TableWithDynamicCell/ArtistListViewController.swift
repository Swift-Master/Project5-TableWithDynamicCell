
import UIKit

class ArtistListViewController: UIViewController {
    
    var artGallery : Gallery?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        getData()
//        guard let artGallery = artGallery else {return}
//        print(artGallery.artists![0])
    }
    
    func setUI() {
        view.backgroundColor = .white
        setNaviBar()
    }
    
    func setNaviBar() {
        let naviBarAppearance = UINavigationBarAppearance()
        naviBarAppearance.backgroundColor = .systemGreen
        navigationItem.scrollEdgeAppearance = naviBarAppearance
        navigationItem.compactAppearance = naviBarAppearance
        navigationItem.standardAppearance = naviBarAppearance
        navigationController?.setNeedsStatusBarAppearanceUpdate()
        title = "Art Gallery"
    }
    
    func getData() {
        artGallery = Gallery.getData()
    }
    
}

