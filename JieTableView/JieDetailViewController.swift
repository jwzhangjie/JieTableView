//
//  JieDetailViewController.swift
//  JieTableView
//
//  Created by jiezhang on 14-10-5.
//  Copyright (c) 2014年 jiezhang. All rights reserved.
//

import UIKit
import MediaPlayer

class JieDetailViewController: UIViewController {
    

    @IBOutlet var big_video_img: UIImageView!
    //接受传进来的值
    var detailItem: NSDictionary?
    var player:MPMoviePlayerViewController!
    
    
    func configureView() {
        if let detail : NSDictionary = self.detailItem {
            self.title = detail.objectForKey("video_title") as? String
            let url : String = detail.objectForKey("video_img") as String
            let dataImg : NSData = NSData(contentsOfURL: NSURL(string : url))
            self.big_video_img.image = UIImage(data: dataImg)
            let video_url = NSURL(string: detail.objectForKey("video_url") as String)
            player = MPMoviePlayerViewController(contentURL: video_url)
            presentViewController(player, animated: true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
       
    }

}
