//
//  RegisterViewController.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    
    
    // MARK: - IBAction
    // 注册用户
    @IBAction func registerAction(sender: UIButton) {
        // 注册
        let userDetail = UserDetail()
        
        let username = usernameTextField.text
        let pwd = passwordTextField.text
        
        userDetail.registerByuser(username!, passWord: pwd!)
    }
    
    // 取消当前页面
    @IBAction func cancelAction(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
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
