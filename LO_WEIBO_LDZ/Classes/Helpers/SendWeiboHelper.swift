//
//  SendWeiboHelper.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class SendWeiboHelper: NSObject {
    //发送微博的方法，传入需要发送的信息
    func sendWeibo(weiboText : String) {
        //初始化一个PFObject类，并创建微博表
        let object = PFObject(className:"WeiboMessage")
        // 在表中创建weiboMessage字段，插入数据
        object.setObject(weiboText, forKey: "weiboMessage")
        // 从本地获取到保存的用户信息，并插入到微博表中
        let user = NSUserDefaults.standardUserDefaults()
        let userName = user.objectForKey("userName")
        let userId = user.objectForKey("userId")
        object.setObject(userId!, forKey: "userId")
        object.setObject(userName!, forKey: "userName")
        //设置replyCount字段，表示回复数量
        object.setObject(0, forKey: "replyCount")
        //保存数据
        object.saveInBackgroundWithBlock { (succeed, error) -> Void in
            // 如果保存成功，则
            if succeed {
                let notication = NSNotificationCenter()
                notication.postNotificationName("sendSucceed", object: nil)
            }
        }
        
    }

}
