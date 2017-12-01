//
//  FindOutViewController.swift
//  shOUT
//
//  Created by Jordan Greissman on 1/3/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit

class FindOutViewController: UITableViewController {
    
    let yaks = ["Getting Started with building a Yik Yak Clone in Swift","Xcode 6 Tutorial using Autolayouts",
                "In this tutorial you will also learn how to talk to Parse Backend", "Learning Swift by building real world applications", "Subscribe to get more info"]


    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavBar()
        
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        let newsButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(press))
        navigationItem.leftBarButtonItem = newsButton
        
   //     let newsButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(press))
   //     navigationItem.leftBarButtonItems?.append(newsButton)
        
   //     let newsButton2 = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(press2))
   //     navigationItem.leftBarButtonItems?.append(newsButton2)
        
        navigationItem.setLeftBarButtonItems(navigationItem.leftBarButtonItems, animated: true)

        // Do any additional setup after loading the view.
    }
    
    @objc func press() {
        navigationController?.pushViewController(BlogViewController(), animated: true)
    }

    @objc func press2() {
        navigationController?.pushViewController(NewsFeed2ViewController(), animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.yaks.count
    }
    
    override  open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        var cell : BlogPost!
        cell = tableView.dequeueReusableCell(withIdentifier: "BlogCell", for: indexPath) as! BlogPost

        cell.blogText.text = yaks[indexPath.row]
        cell.time.text = "\((indexPath.row + 1) * 1)m ago"
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
