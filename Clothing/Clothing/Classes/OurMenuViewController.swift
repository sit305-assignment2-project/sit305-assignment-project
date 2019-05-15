

import UIKit

class OurMenuViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView?
    
    var menuItems: [MenuItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menuItems = MenuItemsManager.sharedManager.loadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// MARK: - UITableViewDataSource
extension OurMenuViewController: UITableViewDataSource {
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: MenuItemTableViewCell = tableView.dequeueReusableCell(withIdentifier: "menuItemCell") as! MenuItemTableViewCell
        let item = menuItems[indexPath.row]
        
        //display data from MenuItems.plist
        cell.menuItemNameLabel?.text = item.name
        cell.productCodeItemLabel?.text = item.productCode
        cell.priceItemLabel?.text = item.price
        cell.menuItemImageView?.image = UIImage(named: item.image)
        
        if let discount = item.discount {
            cell.discountLabel?.text = discount
            cell.discountView?.isHidden = false
        } else {
            cell.discountView?.isHidden = true
        }
        cell.backgroundColor = UIColor.clear
        
        return cell
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    
    
    
}
// MARK: - UITableViewDelegate
extension OurMenuViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController()
        let item = menuItems[indexPath.row]
        detailVC.model = item
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
