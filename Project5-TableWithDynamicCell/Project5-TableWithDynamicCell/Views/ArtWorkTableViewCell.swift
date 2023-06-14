
import UIKit

class ArtWorkTableViewCell: UITableViewCell {

    @IBOutlet weak var workInfoLabel: UILabel!
    @IBOutlet weak var workNameLabel: UILabel!
    @IBOutlet weak var workImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
