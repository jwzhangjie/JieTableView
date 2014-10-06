//
//  JieTableViewCell.swift
//  JieTableView
//
//  Created by jiezhang on 14-10-5.
//  Copyright (c) 2014年 jiezhang. All rights reserved.
//

import UIKit

class JieTableViewCell: UITableViewCell {

    @IBOutlet weak var JieVideoImg: UIImageView!
    @IBOutlet weak var JieVideoTitle: UILabel!
    @IBOutlet weak var JieVideoSubTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
   
    }

}
