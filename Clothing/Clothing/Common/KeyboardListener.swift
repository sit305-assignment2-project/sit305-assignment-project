
//

import UIKit

class KeyboardListener: NSObject {
    
    var scrollView: UIScrollView
    var constraint: NSLayoutConstraint
    
    private var constraintConstant: CGFloat
    
    init(scrollView: UIScrollView, constraint: NSLayoutConstraint) {
        self.scrollView = scrollView
        self.constraint = constraint
        constraintConstant = self.constraint.constant
        
        super.init()
        
        //keyboard notifications to change tableview frame
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
//        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Keyboard notifications
    @objc func keyboardWillShow(notification: NSNotification) {
        if let info = notification.userInfo, let kbFrame: NSValue = info[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue, let animationDuration: TimeInterval = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            
            let keyboardFrame = kbFrame.cgRectValue
            constraint.constant = keyboardFrame.size.height
            
            UIView.animate(withDuration: animationDuration, animations: { () -> Void in
                if let superview = self.scrollView.superview {
                    superview.layoutIfNeeded()
                }
            })
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if let info = notification.userInfo,
            
            let animationDuration: TimeInterval = info[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval {
            constraint.constant = constraintConstant
            
            UIView.animate(withDuration: animationDuration, animations: { () -> Void in
                if let superview = self.scrollView.superview {
                    superview.layoutIfNeeded()
                }
            })
        }
    }
}





