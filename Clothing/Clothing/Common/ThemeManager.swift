
//

import UIKit

private let NavigationBarFontSize = 18.0
private let NavigationBarFontName = "KozGoPro-Light"

class ThemeManager: NSObject {
    
    static let sharedManager = ThemeManager()
    
    private override init() {}

    func applyNavigationBarTheme() {
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white, NSFontAttributeName: UIFont(name: NavigationBarFontName, size: CGFloat(NavigationBarFontSize))!]
    }
}
