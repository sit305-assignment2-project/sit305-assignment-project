//
//  UserAccountModel.swift
//  Clothing
//
//

import UIKit

class UserAccountModel: NSObject {

    var name: String
    var pwd: String
    
    init(name: String, pwd: String) {
        self.name = name
        self.pwd = pwd
    }
}
