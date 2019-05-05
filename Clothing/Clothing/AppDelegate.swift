//

//

import UIKit


let secondsInMinute = 60.0

enum RateApp: Int {
    case Declined = 0
    case Confirmed
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var loginVC :LoginViewController!;
    var mainVC:MSSlidingPanelController!;
    
    
    
    func applicationDidFinishLaunching(_ application: UIApplication) {
        
        window = UIWindow.init(frame: UIScreen.main.bounds);
        window?.backgroundColor = UIColor.white;
        
        window?.makeKeyAndVisible();
        loginVC = LoginViewController();
        window?.rootViewController = loginVC;
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: "MSSlidingPanelController")
        mainVC = controller as! MSSlidingPanelController;
        //mainVC  = UIStoryboard(name: "Main", bundle: nil)
        //    .instantiateInitialViewController() as! MSSlidingPanelController;
        
    }
    
    func changeVC() -> Void {
       
        window?.rootViewController = mainVC;
    }
    
    private func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        initAppiRater()
        NSLog("%@", "++++++++++++++++++++");

        //init rate timer
        initRateAppTimer()

        ThemeManager.sharedManager.applyNavigationBarTheme()
        UIApplication.shared.setStatusBarStyle(UIStatusBarStyle.lightContent, animated: false)
        
        return true
    }
    
    class func sharedDelegate() -> AppDelegate {
        return UIApplication.shared.delegate as! AppDelegate
    }
    
    func showAppRate() {
        let didShowAppRate = UserDefaults.standard.value(forKey: "showedAppRate") as? Bool
        if didShowAppRate != true {
            rateApp()
            UserDefaults.standard.set(true, forKey: "showedAppRate")
            UserDefaults.standard.synchronize()
        }
    }
    
    // MARK: - Actions
    func openOurMenu() {
        openControllerWithIndentifier(identifier: "ourMenuNavController")
       
    }
    
    func openReservation() {
        openControllerWithIndentifier(identifier: "reservationNavController")
    }
    
    func openFindUs() {
        openControllerWithIndentifier(identifier: "findUsNavController")
    }
    
    func openFeedback() {
        openControllerWithIndentifier(identifier: "feedbackNavController")
    }
    
    // MARK: - Private Methods
    private func openControllerWithIndentifier(identifier: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: identifier)
        let rootController = window?.rootViewController as! MSSlidingPanelController
        
        rootController.centerViewController = controller
        rootController.closePanel()
    }
    
    private func initAppiRater() {
        Appirater.appLaunched(true)
        Appirater.setAppId(ConfigurationManager.sharedManager.appId)
        Appirater.setOpenInAppStore(true)
    }
    
    private func initRateAppTimer() {
        
        let didShowAppRate = UserDefaults.standard.value(forKey: "showedAppRate") as? Bool
        if didShowAppRate != true {
            let showRateDelay = TimeInterval(Double(ConfigurationManager.sharedManager.rateAppDelay)! * secondsInMinute)
            Timer.scheduledTimer(timeInterval: showRateDelay, target: self, selector: #selector(AppDelegate.showAppRate), userInfo: nil, repeats: false)
        }
       
    }
    
    private func rateApp() {
        let alertController = UIAlertController(title: "Rate the App", message: "Do you like this app?", preferredStyle: UIAlertControllerStyle.alert)
        
        //Create action for "No"
        let noAction: UIAlertAction = UIAlertAction(title: "No", style: UIAlertActionStyle.cancel) { action -> Void in }
        alertController.addAction(noAction)
        
        //Create action for "Yes"
        let yesAction: UIAlertAction = UIAlertAction(title: "Yes", style: .default) { action -> Void in
            Appirater.rateApp()
        }
        alertController.addAction(yesAction)
        
        window?.rootViewController!.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UIAlertViewDelegate
extension AppDelegate: UIAlertViewDelegate {
    func alertView(_ alertView: UIAlertView, clickedButtonAt buttonIndex: Int) {
        if alertView.title == "Rate the App" {
            switch buttonIndex {
            case RateApp.Declined.rawValue:
                break
            case RateApp.Confirmed.rawValue:
                Appirater.rateApp()
                break
            default:
                break
            }
        }
    }
}

