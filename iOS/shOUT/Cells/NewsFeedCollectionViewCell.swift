//
//  NewsFeedTableViewCell.swift
//  shOUT
//
//  Created by Matthew Coufal on 12/1/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

protocol NewsFeedTableViewCellDelegate {
    func newsFeedTableViewCellDidTapMeToo(newsFeedTableViewCell: NewsFeedTableViewCell)
    func newsFeedTableViewCellDidTapWitnessed(newsFeedTableViewCell: NewsFeedTableViewCell)
    func newsFeedTableViewCellDidTapSupport(newsFeedTableViewCell: NewsFeedTableViewCell)
}

class NewsFeedTableViewCell: UITableViewCell {
    
    var titleLabel: UILabel!
    var locationLabel: UILabel!
    var storyTextView: UITextView!
    var postDateLabel: UILabel!
    var iconImageView: UIImageView!
    var meTooButton: UIButton!
    var witnessedButton: UIButton!
    var supportButton: UIButton!
    var delegate: NewsFeedTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        titleLabel.center = center
        titleLabel.textAlignment = .center
        //      addSubview(titleLabel)
        locationLabel = UILabel()
        storyTextView = UITextView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        storyTextView.center = center
        addSubview(storyTextView)
        postDateLabel = UILabel()
        iconImageView = UIImageView()
        meTooButton = UIButton()
        witnessedButton = UIButton()
        supportButton = UIButton()
        
        backgroundColor = .white
    }
    
    @objc func buttonPressed(button: UIButton) {
        switch button {
            case meTooButton:
                delegate?.newsFeedTableViewCellDidTapMeToo(newsFeedTableViewCell: self)
                break
            case witnessedButton:
                delegate?.newsFeedTableViewCellDidTapWitnessed(newsFeedTableViewCell: self)
                break
            case supportButton:
                delegate?.newsFeedTableViewCellDidTapSupport(newsFeedTableViewCell: self)
                break
            default:
                delegate?.newsFeedTableViewCellDidTapMeToo(newsFeedTableViewCell: self)
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
