//
//  PostViewController.swift
//  shOUT
//
//  Created by Jordan Greissman on 1/9/17.
//  Copyright © 2017 shOUT. All rights reserved.
//
import UIKit
import CoreLocation
import Firebase

class PostViewController: UIViewController, UITextViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var bodyView: UITextView!
    @IBOutlet weak var titleView: UITextView!
    @IBOutlet var cancelPressed: UIBarButtonItem!
    @IBOutlet var postPressed: UIBarButtonItem!
    
    var currLocation: CLLocationCoordinate2D?
    var reset:Bool = false
    
    let ref = FIRDatabase.database().reference(withPath: "messages")
    let locationManager = CLLocationManager()
    
    private func  alert() {
        let alert = UIAlertController(title: "Cannot fetch your location", message: "Please enable location in the settings menu", preferredStyle: UIAlertControllerStyle.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil)
        let settings = UIAlertAction(title: "Settings", style: UIAlertActionStyle.default) { (action) -> Void in
            UIApplication.shared.openURL(NSURL(string: UIApplicationOpenSettingsURLString)! as URL)
            return
        }
        alert.addAction(settings)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavBar()
        
        let body = self.bodyView!
        let title = self.titleView!
        
        body.delegate = self
        body.becomeFirstResponder()
        body.text = "What's on your mind?"
        body.textColor = UIColor.lightGray
        
        title.delegate = self
        title.becomeFirstResponder()
        title.text = "Title"
        title.textColor = UIColor.lightGray
        
        // TODO only if they check that they want location recorded
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        // Do any additional setup after loading the view.
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "What's on your mind?"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        locationManager.stopUpdatingLocation()
        if(locations.count > 0){
            let location = locations[0] as! CLLocation
            currLocation = location.coordinate
        } else {
            alert()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelPressed(_ sender: AnyObject) {
        self.dismiss(animated: true , completion: nil)
    }
    
    @IBAction func postPressed(_ sender: Any) {
        let date = NSDate()
        
        // TODO: Dummy value if no location
        
        //        if(currLocation != nil){
        // Push data to Firebase Database
        let post = Constants.Post(
            fromTitle: self.titleView.text, fromBody: self.bodyView.text, fromDate: date)
        let userRef = self.ref.childByAutoId()
        userRef.setValue(post.toAnyObject())
        
        self.dismiss(animated: true , completion: nil)
        //        } else {
        //            alert()
        //        }
    }
    
    
    
    /*
     // MARK: - Navigation
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
