//
//  GainWeiBoHelper.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class GainWeiBoHelper: NSObject {
    private var dataArray : NSMutableArray? = nil
    
    private var myDataArray : NSMutableArray? = nil
    
    
    // 单例方法
    private static var weiboHelper : GainWeiBoHelper? = nil
    static func sharedgainWeiboInstrument() -> GainWeiBoHelper {
        if weiboHelper == nil {
            weiboHelper = GainWeiBoHelper()
        }
        return weiboHelper!
    }
    
    
    //获取所有的微博
    func gainWeiboInstrumentAll() {
        //初始化一个PFQuery类，从WeiboMessage表里面读取数据，根据createAt排序
        let quert = PFQuery(className:"WeiboMessage").orderByDescending("createdAt")
        //获取数据的方法
        quert .findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            //初始化dataArray数组，保存获取到的数据
            self.dataArray = NSMutableArray()
            //在dataArray里面添加数据
            self.dataArray?.addObject(objects!)
            //初始化一个通知中心，发送一个finishLoadData的消息，并携带获取到的数据
            let notication  = NSNotificationCenter.defaultCenter()
            notication.postNotificationName("finishLoadData", object: self.dataArray)
        }
    }
    
    
    
    func gainMyWeiboInstrument( UID : String) {
        let quert = PFQuery(className: "weiboMessage")
        
        
        quert .whereKey("userId", equalTo: UID)
        
        quert.findObjectsInBackgroundWithBlock { (objects, error) -> Void in
            let notication = NSNotificationCenter.defaultCenter()
            self.myDataArray = NSMutableArray(array: objects!)
            
            notication.postNotificationName("finishLoadMyData", object: nil)
            
        }
    }
    
    func backMyDataArray() -> NSMutableArray {
        return self.myDataArray!
    }
    
    func dataArrayCount() -> Int {
        if self.dataArray != nil {
            return dataArray!.count
        } else {
            return 0
        }
    }
    
    func myDataArrayCount() -> Int {
        if self.myDataArray?.count != 0 {
            return myDataArray!.count
        } else {
            return 0
        }
    }

}
