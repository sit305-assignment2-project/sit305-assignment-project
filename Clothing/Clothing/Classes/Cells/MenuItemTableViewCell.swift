
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var menuItemNameLabel: UILabel?
    @IBOutlet weak var priceItemLabel: UILabel?
    @IBOutlet weak var productCodeItemLabel: UILabel?
    @IBOutlet weak var discountLabel: UILabel?
    @IBOutlet weak var menuItemImageView: UIImageView?
    @IBOutlet weak var discountView: UIView?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
