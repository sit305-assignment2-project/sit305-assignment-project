
//

import UIKit

class MenuItemsManager: NSObject {
    
    static let sharedManager = MenuItemsManager()
    
    private override init() {}
    
    // MARK: - Public Methods
    func loadData() -> [MenuItem] {
        let path = Bundle.main.path(forResource: "MenuItems", ofType: "plist")
        if let dataArray = NSArray(contentsOfFile: path!) {
            return constructMenuItemsFromArray(array: dataArray)
        } else {
            return [MenuItem]()
        }
    }
    
    // MARK: - Private Methods
    private func constructMenuItemsFromArray(array: NSArray) -> [MenuItem] {
        var resultItems = [MenuItem]()
        
        for object in array {
            let obj = object as! NSDictionary
            let name = obj["name"] as! String
            let productCode = obj["productCode"] as! String
            let image = obj["image"] as! String
            let price = obj["price"] as! String
            let discount = obj["discount"] as? String
            let images = obj["images"] as! Array<String>
            
            let loadedMenuItem = MenuItem(name: name, productCode: productCode, image: image, price: price, discount: discount,images:images)
            resultItems.append(loadedMenuItem)
        }
        return resultItems
    }
}
