 
  //
//  MineTableViewController.swift
//  LO_WEIBO_LDZ
//
//  Created by LIZE on 15/8/26.
//  Copyright © 2015年 蓝鸥科技. All rights reserved.
//

import UIKit

class MineTableViewController: UITableViewController {
    
    let nameLabel: UILabel! = nil
    
    let content1 = ["昵称", "电话号码", "点赞", "回复列表"]
    let content2 = ["小梦梦", "18932452455", "10条", ""]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.tableView.backgroundColor = UIColor.whiteColor()
        
        // 加载头部区域
        loadHeaderView()
        
    
        
    }
    
    
    
    // MARK: - 私有方法
    // 加载tableView的头部

    
    func loadHeaderView() {
        
        let headerView = UIView()
        headerView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 130)
        
        let headImageView = UIImageView()
        headImageView.frame = CGRectMake(0, 0, 100, 100)
        headImageView.center = headerView.center
        headImageView.image = UIImage(named: "placeholder")
        headerView.addSubview(headImageView)
        
        self.tableView.tableHeaderView = headerView
    }
    
    
    // 注销
    func logout() {
        UserManager.sharedUserManager().clearUserIdAndUserName()
        
        let app = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let loginNC = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("loginNC") as! UINavigationController
        
        app.window?.rootViewController = loginNC
    }
    
    

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return content1.count
        } else {
            return 1
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        if indexPath.section == 0 {
            cell.textLabel?.text = content1[indexPath.row]
            cell.detailTextLabel?.text = content2[indexPath.row]
        } else if indexPath.section == 1 {
            cell.textLabel?.text = "注销"
            cell.textLabel?.textAlignment = NSTextAlignment.Center
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.cellForRowAtIndexPath(indexPath)?.setSelected(false, animated: true)
        
        // 点击注销
        if indexPath.section == 1 {
            logout()
            
            
        }
        
        
    }

    


    
}
