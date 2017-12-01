//
//  NewsFeedTableViewCell.swift
//  shOUT
//
//  Created by Raymone Radi  on 12/1/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

class NewsFeedTableViewCell2: UITableViewCell {

    var dateText: UILabel!
    // var delegate:
    
    override func awakeFromNib() {
    super.awakeFromNib()
    selectionStyle = .default
    
    dateText = UILabel()
    
    dateText.textColor = UIColor.white.withAlphaComponent(0.8)
    
    addSubview(dateText)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(dateTextString: String){
        dateText.text = dateTextString
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        dateText.frame = self.frame
    }
    
    
}
