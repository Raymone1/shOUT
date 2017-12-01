//
//  BlogViewController.swift
//  shOUT
//
//  Created by Matthew Coufal on 12/1/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

class BlogViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, BlogTableViewCellDelegate {
    
    var blogTableView: UITableView!
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
        
        blogTableView = UITableView(frame: view.frame)
        blogTableView.delegate = self
        blogTableView.dataSource = self
        blogTableView.register(BlogTableViewCell.self, forCellReuseIdentifier: "news")
        blogTableView.backgroundColor = .lightGray
        view.addSubview(blogTableView)
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = blogTableView.dequeueReusableCell(withIdentifier: "news", for: indexPath) as? BlogTableViewCell {
            cell.delegate = self
            let post = posts[indexPath.row]
            cell.setUpCellWithInfo(title: post.title.text!, location: nil, story: post.blogText.text!, time: post.time.text!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.width / 2.0
    }
    
    func blogTableViewCellDidTapMeToo(blogTableViewCell: BlogTableViewCell) {
        //
    }
    
    func blogTableViewCellDidTapWitnessed(blogTableViewCell: BlogTableViewCell) {
        //
    }
    
    func blogTableViewCellDidTapSupport(blogTableViewCell: BlogTableViewCell) {
        //
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

