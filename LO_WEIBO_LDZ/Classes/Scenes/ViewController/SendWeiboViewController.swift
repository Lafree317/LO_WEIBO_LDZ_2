//
//  SendWeiboViewController.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit



typealias Closure = () -> Void

class SendWeiboViewController: UIViewController {
    
    
    @IBOutlet weak var msgTextView: UITextView!
    
    // 回调的闭包
    var result: Closure!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // 对UIScrolView以及所有的子类的contentView向下偏移64，关闭它
        self.automaticallyAdjustsScrollViewInsets = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - IBAction
    @IBAction func sendAction(sender: UIButton) {
        
        // 发送微博
        let sendWeibo = SendWeiboHelper()
        sendWeibo.sendWeibo(self.msgTextView.text)
        
        if result != nil {
            result()
        }
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
