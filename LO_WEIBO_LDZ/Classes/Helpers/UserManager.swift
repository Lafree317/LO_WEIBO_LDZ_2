//
//  UserManager.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class UserManager: NSObject {
    
    private var userName : String = ""
    private var userId : String = ""
    
    // 保存用户名和用户ID
    func saveUserIdAndUserName(userName : String, userId : String) {
        
        self.userName = userName
        self.userId = userId
    }
    
    // 清除用户名和用户ID
    func clearUserIdAndUserName() {
        
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.removeObjectForKey("isLogin")
        
        self.userName = ""
        self.userId = ""
    }
    
    
    // 调用这个方法会返回用户ID和用户名的一个元组
    func getUserIdAndUserName() -> (String, String) {
        
        return (userName, userId)
    }
    
    
    private static var userInformation : UserManager? = nil
    
    static func sharedUserManager() -> UserManager {
        if userInformation == nil {
            userInformation = UserManager()
        }
        
        return userInformation!
    }
}
