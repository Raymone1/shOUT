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
    var delegate: //fill me in
    
    
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
    
    func setup(profileImage: UIImage, songTitle: String, songArtist: String, liked: Bool){
        
        profileImageView.image = profileImage
        songTitleLabel.text = songTitle
        songArtistLabel.text = songArtist
        isLiked = liked
        
        
        if liked {
            likeButton.setImage(UIImage(named: "red_heart"), for: .normal)
        }
        else {
            likeButton.setImage(UIImage(named: "white_heart"), for: .normal)
        }
        
    }
    
    func likeButtonWasPressed(){
        isLiked = !isLiked
        
        if isLiked{
            likeButton.setImage(UIImage(named: "red_heart"), for: .normal)
        }
        else {
            likeButton.setImage(UIImage(named: "white_heart"), for: .normal)
        }
        
        delegate?.postTableViewCell(postTableViewCell: self, likeButtonWasSetToState: isLiked)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        profileImageView.frame = CGRect(x: 0, y: 0, width: frame.height / 2.0, height: frame.height / 2.0)
        profileImageView.center = CGPoint(x: frame.height / 2.0, y: frame.height / 2.0)
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2.0
        
        songTitleLabel.frame = CGRect(x: profileImageView.frame.origin.x + profileImageView.frame.width + 10, y: frame.height * 0.25, width: frame.width * 0.5, height: frame.height * 0.25)
        
        songArtistLabel.frame = CGRect(x: songTitleLabel.frame.origin.x, y: songTitleLabel.frame.origin.y + songTitleLabel.frame.height, width: songTitleLabel.frame.width, height: songTitleLabel.frame.height)
        
        likeButton.frame = CGRect(x: 0, y: 0, width: frame.height * 0.25, height: frame.height * 0.25)
        
        likeButton.center = CGPoint(x: frame.width - frame.height / 2.0, y: frame.height / 2.0)
        
    }
    
    
}
