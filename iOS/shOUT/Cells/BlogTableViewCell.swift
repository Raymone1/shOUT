//
//  NewsFeedTableViewCell.swift
//  shOUT
//
//  Created by Matthew Coufal on 12/1/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

protocol BlogTableViewCellDelegate {
    func blogTableViewCellDidTapMeToo(blogTableViewCell: BlogTableViewCell)
    func blogTableViewCellDidTapWitnessed(blogTableViewCell: BlogTableViewCell)
    func blogTableViewCellDidTapSupport(blogTableViewCell: BlogTableViewCell)
}

class BlogTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var locationLabel: UILabel!
    var storyTextView: UITextView!
    var postDateLabel: UILabel!
    var iconImageView: UIImageView!
    var meTooButton: UIButton!
    var witnessedButton: UIButton!
    var supportButton: UIButton!
    var delegate: BlogTableViewCellDelegate?
    var box: UIView!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel = UILabel()
        titleLabel.center = center
        titleLabel.textAlignment = .center
        //      addSubview(titleLabel)
        locationLabel = UILabel()
        box =  CGRect(x: 0, y: 0, width: 350, height: 214)
        box.backgroundColor = .white
        box.center = CGPoint(x: 375 / 2.0, y: center.y)
        addSubview(box)
        storyTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 325, height: box.height / 2.0))
        storyTextView.center = CGPoint(x: 375 / 2.0, y: center.y)
        addSubview(storyTextView)
        postDateLabel = UILabel()
        iconImageView = UIImageView()
        meTooButton = UIButton()
        witnessedButton = UIButton()
        supportButton = UIButton()
        backgroundColor = .clear
    }
    
    @objc func buttonPressed(button: UIButton) {
        switch button {
            case meTooButton:
                delegate?.blogTableViewCellDidTapMeToo(blogTableViewCell: self)
                break
            case witnessedButton:
                delegate?.blogTableViewCellDidTapWitnessed(blogTableViewCell: self)
                break
            case supportButton:
                delegate?.blogTableViewCellDidTapSupport(blogTableViewCell: self)
                break
            default:
                delegate?.blogTableViewCellDidTapMeToo(blogTableViewCell: self)
        }
    }
    
    func setUpCellWithInfo(title: String, location: String?, story: String, time: String) {
        titleLabel.text = title
        if let location = location {
            locationLabel.text = location
        } else {
            locationLabel.text = "Location unknown"
        }
        postDateLabel.text = time
        storyTextView.text = story
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
