
import UIKit

class ArtistListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
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


}

