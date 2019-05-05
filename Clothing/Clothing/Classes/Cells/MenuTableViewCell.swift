
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemNameLabel: UILabel?
    @IBOutlet weak var itemImageView: UIImageView?
    @IBOutlet weak var selectedMenuImageView: UIImageView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
