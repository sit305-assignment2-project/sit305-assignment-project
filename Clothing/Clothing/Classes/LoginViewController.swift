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
        denglu.addTarget(self, action: #selector(clickDengLu), for: UIControl.Event.touchUpInside);
        denglu.setTitle("login", for: UIControl.State.normal);
        denglu.titleLabel?.font = UIFont.systemFont(ofSize: 18);
        denglu.setTitleColor(UIColor.white, for: UIControl.State.normal);
        denglu.backgroundColor = UIColor.init(red: 116.0/255, green: 169.0/255, blue: 232/255.0, alpha: 1);
        denglu.clipsToBounds = true;
        denglu.layer.cornerRadius = 10;
        self.view.addSubview(denglu);
        
        let tap :UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: #selector(endAll));
        self.view.addGestureRecognizer(tap);
        
        
    }
    
    @objc func clickDengLu(){
        
        guard let name = self.inputName.text,!name.isEmpty else {
            MBProgressHUD .showError("please input userName", to: nil)
            return
        }
        guard let pwd = self.inputPassword.text,!pwd.isEmpty else {
            MBProgressHUD .showError("please input passWord", to: nil)
            return
        }
        if isTelephoneNumber(name) == false {
            MBProgressHUD .showError("The account number is a ten significant digit", to: nil)
            return
        }
        if isPwd(pwd) == false {
            MBProgressHUD .showError("Passwords are made up of 6 - to 18-bit Numbers or letters", to: nil)
            return
        }
        self.configCheckPwd(name: name, pwd: pwd)
    }
    
    @objc func endAll() -> Void {
        
        self.view.endEditing(true);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning();
    }
    
    fileprivate func configCheckPwd(name:String,pwd:String) {
        let dataAry = loadData()
        var hasName = false
        var pwdIsTrue = false
        for model in dataAry {
            if name == model.name {
                hasName = true
                if pwd == model.pwd {
                    //密码正确
                    pwdIsTrue = true
                }
            }
        }
        guard hasName else {
            MBProgressHUD .showError("Account does not exist", to: nil);
            return
        }
        guard pwdIsTrue else {
            MBProgressHUD .showError("Incorrect password", to: nil);
            return
        }
        
        let appdelegate :AppDelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.changeVC()
        self.endAll()
        
        
    }
    
    func loadData() -> [UserAccountModel] {
        let path = Bundle.main.path(forResource: "UserAccount", ofType: "plist")
        let accountAry = NSArray(contentsOfFile: path!)
        if let dataArray = accountAry,dataArray.count > 0 {
            return constructMenuItemsFromArray(array: dataArray)
        } else {
            return [UserAccountModel]()
        }
    }
    
    // MARK: - Private Methods
    private func constructMenuItemsFromArray(array: NSArray) -> [UserAccountModel] {
        var resultItems = [UserAccountModel]()
        
        for object in array {
            let obj = object as! NSDictionary
            let name = obj["name"] as! String
            let pwd = obj["pwd"] as! String
            let loadedMenuItem = UserAccountModel(name: name, pwd: pwd)
            resultItems.append(loadedMenuItem)
        }
        return resultItems
    }
    
    /// 判断账号的正则表达式
    ///
    /// - Returns: 是账号返回 true or false
    func isTelephoneNumber(_ phone:String) -> Bool {
        
        let mobile = "^[0-9]{10}"
        let regextesMobile = NSPredicate(format:"SELF MATCHES %@", mobile)
        
        if regextesMobile.evaluate(with: phone) == true {
            return true
        } else {
            return false
        }
    }
    
    /// 判断密码
    ///
    /// - Parameter pwd: 密码
    /// - Returns: 是否合法
    func isPwd(_ pwd:String) -> Bool {
//        let mobile = "^(?![0-9]+$)(?![a-zA-Z]+$)[a-zA-Z0-9]{6,18}"
        let mobile = "^[a-zA-Z0-9]{6,18}"
        
        let regextesMobile = NSPredicate(format:"SELF MATCHES %@", mobile)
        if regextesMobile.evaluate(with: pwd) == true {
            return true
        } else {
            return false
        }
    }
    
}
