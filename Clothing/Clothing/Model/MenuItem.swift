//

//

import UIKit

class MenuItem: NSObject {

    var name: String
    var productCode: String
    var image: String
    var price: String
    var discount: String?
    
    init(name: String, productCode: String, image: String, price: String, discount: String?) {
        self.name = name
        self.productCode = productCode
        self.image = image
        self.price = price
        self.discount = discount
    }
}
