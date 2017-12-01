//
//  NewsFeedViewController.swift
//  shOUT
//
//  Created by Matthew Coufal on 12/1/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

class NewsFeedViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, NewsFeedCollectionViewCellDelegate {

    var newsFeedCollectionView: UICollectionView!
    var posts = [BlogPost]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeNavBar()
        
        var number: Int = 1
        while number < 11 {
            let post: BlogPost = BlogPost()
            post.create()
            post.title.text = "Concerned Student \(number)"
            post.blogText.text = "asdkjfalsdkjfhasldjkfhaskdfh asdfhaksfdjhalkdsjfhlakjsdfh asdfhlkjhasdfasdf hadfjhlasjdfhalsdjkfhasjkdfh asdfhlasdjfhalsdkfjhasldfjkahsdfhasdf asjdfhlaksdjfh asjdhfh sdasdfhjlkjhasd asdfjlhkjlhjasdfhlajksdhfhlkjasdhflkjhljkh asdkjfalsdkjfhasldjkfhaskdfh asdfhaksfdjhalkdsjfhlakjsdfh asdfhlkjhasdfasdf hadfjhlasjdfhalsdjkfhasjkdfh asdfhlasdjfhalsdkfjhasldfjkahsdfhasdf asjdfhlaksdjfh asjdhfh sdasdfhjlkjhasd asdfjlhkjlhjasdfhlajksdhfhlkjasdhflkjhljkh"
            post.time.text = "December 1, 2017"
            posts.append(post)
            number += 1
        }
        
        newsFeedCollectionView = UICollectionView(frame: view.frame, collectionViewLayout: UICollectionViewFlowLayout())
        newsFeedCollectionView.delegate = self
        newsFeedCollectionView.dataSource = self
        newsFeedCollectionView.register(NewsFeedCollectionViewCell.self, forCellWithReuseIdentifier: "news")
        newsFeedCollectionView.backgroundColor = .lightGray
        view.addSubview(newsFeedCollectionView)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let separator: CGFloat = 5
        let itemWidth = (view.frame.width - separator) / 1.5
        return CGSize(width: itemWidth, height: itemWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = newsFeedCollectionView.dequeueReusableCell(withReuseIdentifier: "news", for: indexPath) as? NewsFeedCollectionViewCell {
            let post = posts[indexPath.row]
            cell.setUpCellWithInfo(title: post.title.text!, location: nil, story: post.blogText.text!, time: post.time.text!)
            cell.delegate = self
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func newsFeedCollectionViewCellDidTapMeToo(newsFeedCollectionViewCell: NewsFeedCollectionViewCell) {
        // to do
    }
    
    func newsFeedCollectionViewCellDidTapWitnessed(newsFeedCollectionViewCell: NewsFeedCollectionViewCell) {
        // to do
    }
    
    func newsFeedCollectionViewCellDidTapSupport(newsFeedCollectionViewCell: NewsFeedCollectionViewCell) {
        // to do
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
