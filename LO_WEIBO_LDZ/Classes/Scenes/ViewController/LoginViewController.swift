//
//  LoginViewController.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let notication = NSNotificationCenter.defaultCenter()
        notication.addObserver(self, selector:Selector("loginSucceed"), name: "loginSucceedNotification", object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    // MARK: - IBAction
    // 登录按钮
    @IBAction func loginAction(sender: UIButton) {
        
        
        let userDetail = UserDetail()
        
        let username = self.userNameTextField.text
        let pwd = self.passwordTextField.text
        
        userDetail.loginByUser(username!, passWord: pwd!)
    }
    
    func loginSucceed() {
        
        let app : AppDelegate
        app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let mainTBC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("mainTBC") as! UITabBarController
        app.window?.rootViewController = mainTBC
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
