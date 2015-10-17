//
//  UserDetail.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class UserDetail: NSObject {
    // 登录 传递两个参数：userName、PassWord 注册成功会发送一个loginSucceed的通知
    func loginByUser(userName : String, passWord : String)  {
        
        PFUser.logInWithUsernameInBackground(userName, password: passWord) { (MyUser, error) -> Void in
            if MyUser != nil && error == nil {
                
                
                let userManager = UserManager.sharedUserManager()
                userManager.saveUserIdAndUserName(userName, userId: (MyUser?.objectId)!)
                
                print("登录成功")
                
                
                let user = NSUserDefaults.standardUserDefaults()
                user .setObject("yes", forKey: "isLogin")
                user.setObject(userName, forKey: "userName")
                user.setObject(passWord, forKey: "passWord")
                user.setObject(MyUser?.objectId, forKey:"userId")
                user.synchronize()
                
                let notication = NSNotificationCenter.defaultCenter()
                notication.postNotificationName("loginSucceedNotification", object: nil)
            }
        }
        
    }
    
    
    // 注册 传递两个参数: userName、passWord 注册成功后会自动调用登录的方法
    func registerByuser(userName : String , passWord : String)  {
        let user = PFUser()
        
        user.username = userName
        user.password = passWord
        
        user.signUpInBackgroundWithBlock { (succeeded, error) -> Void in
            if succeeded {
                self.loginByUser(userName, passWord: passWord)
            }
        }
        
    }

}
