//
//  WeiBoTableViewController.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class WeiBoTableViewController: UITableViewController {

    
    private var dataArray : NSMutableArray = NSMutableArray()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // 自动高度
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableViewAutomaticDimension
        // 注册
        tableView.registerNib(UINib(nibName: "WeiBoCell", bundle: nil), forCellReuseIdentifier: "weiBoCell")
        
        
        loadData()
        
        let notication = NSNotificationCenter.defaultCenter()
        notication.addObserver(self, selector: Selector("finishLoadData:"), name:"finishLoadData", object: nil)
        
    }
    
    
    // MARK: - 私有方法
    func loadData() {
        let gainWeibo = GainWeiBoHelper.sharedgainWeiboInstrument()
        gainWeibo.gainWeiboInstrumentAll()
    }
    
    // 获取数据后刷新处理下
    func finishLoadData(notication : NSNotification) {
        
        self.dataArray.setArray(notication.object! as! [AnyObject])
        self.dataArray.setArray((self.dataArray.firstObject)! as! [AnyObject])

        self.tableView?.reloadData()
    }
    
    
    
    
    
    
    
    // MARK: - UITableViewDataSource & UITableViewDelegate
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("weiBoCell", forIndexPath: indexPath) as! WeiBoCell

        let nameStr = self.dataArray[indexPath.row]["userName"] as! String
        let msgStr  = self.dataArray[indexPath.row]["weiboMessage"] as! String
        
        cell.userNameLabel.text = nameStr
        cell.messageLabel.text = msgStr
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.setSelected(false, animated: true)
        
        
    }
    
    
    
    
    
    

    
    // MARK: - PrepareForSegue
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toSendWeiboVC" {
            let sendWeiboVC = segue.destinationViewController as? SendWeiboViewController
            sendWeiboVC?.result = { () -> Void in
                // 刷新数据
                self.loadData()
            }
        }
    }
    
    
}
