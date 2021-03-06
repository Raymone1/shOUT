//
//  FindOutViewController.swift
//  shOUT
//
//  Created by Jordan Greissman on 1/3/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit
import Firebase

class SpeakOutViewController: UITableViewController {
    
    var posts : [Constants.Post] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavBar()
        
        self.tableView.estimatedRowHeight = 60
        self.tableView.rowHeight = UITableViewAutomaticDimension

        
        let ref = FIRDatabase.database().reference(withPath: "messages")
        
        ref.observe(.value, with: { snapshot in
            // 2
            var newPosts: [Constants.Post] = []
            
            // 3
            for item in snapshot.children {
                // 4
                let post = Constants.Post(snapshot: item as! FIRDataSnapshot)
                newPosts.insert(post, at: 0)
            }
            
            // 5
            self.posts = newPosts
            self.tableView.reloadData()
        })
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override open func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }
    
    override  open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : BlogPost!
        var dateStr : String
        
        cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! BlogPost
        
        let interval = posts[indexPath.row].datePosted
        let date = NSDate(timeIntervalSinceReferenceDate: interval!)
        let dateFormatter = DateFormatter()
        
        if NSCalendar.current.isDateInToday(date as Date) {
            dateFormatter.dateFormat = "h:mm a"
            dateStr = "Today at " + dateFormatter.string(from: date as Date)
        }
        
        else if NSCalendar.current.isDateInYesterday(date as Date) {
            dateFormatter.dateFormat = "h:mm a"
            dateStr = "Yesterday at " + dateFormatter.string(from: date as Date)
        }
        
        else {
            dateFormatter.dateFormat = "MMM d, yyyy"
            dateStr = dateFormatter.string(from: date as Date)
        }

        print (dateStr)
        cell.time.text = dateStr
        cell.title.text = posts[indexPath.row].title
        cell.blogText.text = posts[indexPath.row].body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCellEditingStyle {
        return .delete
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender:
        Any?){
        if (segue.identifier == "showView") {
            let upcoming: SinglePostViewController = segue.destination
                as! SinglePostViewController
            let indexPath = self.tableView.indexPathForSelectedRow!
            
            let titleString = posts[indexPath.row].title
            let bodyString = posts[indexPath.row].body

            upcoming.titleStringViaSegue = titleString
            upcoming.bodyStringViaSegue = bodyString
            self.tableView.deselectRow(at: indexPath, animated: true)
        }

     }
    
    
    
}
