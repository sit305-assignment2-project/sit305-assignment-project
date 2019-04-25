

import UIKit

class Feedback: NSObject {
    
    var name: String
    var text: String
    var numberOfStars: Int
    
    override init() {
        name = ""
        text = ""
        numberOfStars = 1
    }
    
    init(name: String, text: String, numberOfStars: Int) {
        self.name = name
        self.text = text
        self.numberOfStars = numberOfStars
    }
}
