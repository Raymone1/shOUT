//
//  PhoneNumberCell.swift
//  shOUT
//
//  Created by Jordan Greissman on 1/8/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

class BlogPost: UITableViewCell {

    @IBOutlet var title: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var blogText: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func create() {
        self.title = UILabel()
        self.time = UILabel()
        self.blogText = UILabel()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
