//

//

import Foundation
import UIKit


class LoginViewController: UIViewController {
    
    var inputName :UITextField!;
    var inputPassword:UITextField!;
    
    convenience init(withCourseId cId: Any) {
        self.init()
        //let courseIdStr = String(describing: cId)
      //  courseId = courseIdStr
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        self.view.backgroundColor = UIColor.white;
        
        let logo:UIImageView = UIImageView.init(frame: CGRect(x: (UIScreen.main.bounds.width-80)/2, y: 80, width: 80, height: 80));
        logo.image = UIImage.init(named: "logo_menu.png");
        self.view.addSubview(logo);
        
        
        
        
        let name = UILabel.init(frame: CGRect(x: 20, y: 200, width: 100, height: 30));
        name.text = "userName:";
        name.textColor = UIColor.black;
        name.font = UIFont.systemFont(ofSize: 16);
        self.view.addSubview(name);
        
        let passWord = UILabel.init(frame: CGRect(x: 20, y: 250, width: 100, height: 30));
        passWord.text = "passWord:";
        passWord.textColor = UIColor.black;
        passWord.font = UIFont.systemFont(ofSize: 16);
        self.view.addSubview(passWord);
        
        inputName = UITextField.init(frame: CGRect(x: 120, y: 200, width: UIScreen.main.bounds.width-140, height: 30));
        //inputName.backgroundColor = UIColor.init(red: 242.0/255, green: 242.0/255, blue: 242.0/255, alpha: 1);
        inputName.placeholder = "Please enter userName";
        self.view.addSubview(inputName);
        
        inputPassword = UITextField.init(frame: CGRect(x: 120, y: 250, width: UIScreen.main.bounds.width-140, height: 30));
        //inputPassword.backgroundColor = UIColor.init(red: 242.0/255, green: 242.0/255, blue: 242.0/255, alpha: 1);
        inputPassword.placeholder = "Please enter passWord";
        self.view.addSubview(inputPassword);
        
        
        let line1:UIView = UIView.init(frame: CGRect(x: 20, y: 230, width: UIScreen.main.bounds.width-40, height: 1));
        line1.backgroundColor = UIColor.black;
        self.view.addSubview(line1);
        
        let line2:UIView = UIView.init(frame: CGRect(x: 20, y: 280, width: UIScreen.main.bounds.width-40, height: 1));
        line2.backgroundColor = UIColor.black;
        self.view.addSubview(line2);
        
        let denglu:UIButton = UIButton.init(frame: CGRect(x: 20, y: 340, width: UIScreen.main.bounds.width-40, height: 50));
        denglu.addTarget(self, action: #selector(clickDengLu), for: UIControlEvents.touchUpInside);
        denglu.setTitle("login", for: UIControlState.normal);
        denglu.titleLabel?.font = UIFont.systemFont(ofSize: 18);
        denglu.setTitleColor(UIColor.white, for: UIControlState.normal);
        denglu.backgroundColor = UIColor.init(red: 116.0/255, green: 169.0/255, blue: 232/255.0, alpha: 1);
        denglu.clipsToBounds = true;
        denglu.layer.cornerRadius = 10;
        self.view.addSubview(denglu);
        
        let tap :UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(endAll));
        self.view.addGestureRecognizer(tap);
        
        
    }
    
    func clickDengLu(){
        
        if (inputName.text!.characters.count == 0) {
           MBProgressHUD .showError("please input userName", to: nil);
            return;
        
        }
        if (inputPassword.text!.characters.count == 0) {
            MBProgressHUD .showError("please input passWord", to: nil);
            return;
        }
       
        let appdelegate :AppDelegate = UIApplication.shared.delegate as! AppDelegate;
        appdelegate.changeVC();
        
        
        self.endAll();
    }
    
    func endAll() -> Void {
        
        self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
