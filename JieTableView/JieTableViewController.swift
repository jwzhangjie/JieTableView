//
//  JieTableViewController.swift
//  JieTableView
//
//  Created by jiezhang on 14-10-5.
//  Copyright (c) 2014年 jiezhang. All rights reserved.
//

import UIKit

class JieTableViewController: UITableViewController {

    var listVideos : NSMutableArray!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var bundle = NSBundle.mainBundle()
        let plistPath : String! = bundle.pathForResource("videos", ofType: "plist")
        listVideos = NSMutableArray(contentsOfFile: plistPath)
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        //下面这段话是设置左边编辑，右边添加item
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        let addButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "insertNewObject:")
        self.navigationItem.rightBarButtonItem = addButton
        
    }

    func insertNewObject(sender: AnyObject) {
        var item : NSDictionary = NSDictionary(objects:["http://c.hiphotos.baidu.com/video/pic/item/f703738da977391224eade15fb198618377ae2f2.jpg","新增数据", NSDate.date().description] , forKeys: ["video_img","video_title","video_subTitle"])
        listVideos.insertObject(item, atIndex: 0)
        let indexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    //返回节的个数
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    //返回某个节中的行数
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return listVideos.count
    }
    //为表视图单元格提供数据，该方法是必须实现的方法
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier : String = "videoItem"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as JieTableViewCell
        var row = indexPath.row
        var rowDict : NSDictionary = listVideos.objectAtIndex(row) as NSDictionary
        let url : String = rowDict.objectForKey("video_img") as String
        let dataImg : NSData = NSData(contentsOfURL: NSURL(string : url))
        cell.JieVideoImg.image = UIImage(data: dataImg)
        cell.JieVideoTitle.text = rowDict.objectForKey("video_title") as? String
        cell.JieVideoSubTitle.text = rowDict.objectForKey("video_subTitle") as? String
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

    }
    
    // 支持单元格编辑功能
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            listVideos.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView!, moveRowAtIndexPath fromIndexPath: NSIndexPath!, toIndexPath: NSIndexPath!) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView!, canMoveRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    //给新进入的界面进行传值
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow() {
                let object : NSDictionary = listVideos[indexPath.row] as NSDictionary
                (segue.destinationViewController as JieDetailViewController).detailItem = object
            }
        }
    }

    
    

}
