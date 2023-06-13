
import UIKit

class ArtWorkListViewController: UIViewController {

    var artist : Artists?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        // Do any additional setup after loading the view.
    }
    
    func setUI() {
        guard let artist = artist else {return}
        title = artist.name
    }



}
