//
//  NewsFeed2TableViewController.swift
//  shOUT
//
//  Created by Raymone Radi  on 12/1/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

class Post {
    
    var postText: String
    var dateText: String
    
    init(postTextString: String, dateTextString: String) {
        self.postText = postTextString
        self.dateText = dateTextString
    }
}

    class NewsFeed2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NewsFeedTableViewCell2Delegate {
        
        var tableView: UITableView!
        var posts = [Post]()

        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            title = "News Feed"
            
            view.backgroundColor = .gray
            
            tableView = UITableView(frame: view.frame)
            tableView.backgroundColor = .black
            tableView.tableFooterView = UIView()
            tableView.rowHeight = 100
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(NewsFeedTableViewCell2.self, forCellReuseIdentifier: "Reuse")
            view.addSubview(tableView)
            
            getData()
        }
        
        func getData() {
           posts.append(Post(postTextString: "Im sick of it all", dateTextString: "11/05/1998"))
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return posts.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "Reuse") as? NewsFeedTableViewCell2{
                let post = posts[indexPath.row]
                cell.setup(dateTextString: post.dateText, postTextString: post.postText)
                cell.delegate = self
                return cell
            }
            
            return NewsFeedTableViewCell2(style: .default, reuseIdentifier: "Reuse")
            
        }
        
        func newsFeedTableViewCell2(newsFeedTableViewCell2: NewsFeedTableViewCell2) {
            //
        }

    }
