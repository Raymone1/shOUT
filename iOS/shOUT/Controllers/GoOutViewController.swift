//
//  GoOutViewController.swift
//  shOUT
//
//  Created by Jordan Greissman on 1/3/17.
//  Copyright © 2017 shOUT. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class GoOutViewController: UIViewController {

    @IBOutlet var mapView: MKMapView!

    @IBOutlet var segmentedControl: UISegmentedControl!
    
//    var geotifications = [Geotification]()
    var pin_array: [MKAnnotation] = []
    
    let locationManager = CLLocationManager()
    let regionRadius: CLLocationDistance = 1000
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeNavBar()
        
        // TODO Current location not working?
        
        locationManager.delegate = self
        locationManager.requestAlwaysAuthorization()
        centerMapOnLocation(location: locationManager.location!)

//        loadAllGeotifications()
        
        getMapPins()
        mapView.addAnnotations(pin_array)
        
        // Do any additional setup after loading the view.
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    @IBAction func segmentedControlAction(_ sender: UISegmentedControl) {
        // TODO
        print ("here")
        switch (sender.selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapType.standard
        case 1:
            mapView.mapType = MKMapType.hybrid
        case 2:
            mapView.mapType = MKMapType.satellite
        default:
            mapView.mapType = MKMapType.standard
        }
    }
    
    func getMapPins() {
        pin_array = []
        // TODO
//        var current: [Double] = []
//        
//        let query = BackendlessDataQuery()
//        let results = self.backendless.persistenceService.of(Locations.ofClass()).find(query)
//        let currentPage = results.getCurrentPage()
//        
//        for location in currentPage as! [Locations] {
//            current.append(location.latitude)
//            current.append(location.longitude)
//            
//            // TODO, see if opacity can change with time
//            //            let interval = location.created!.timeIntervalSinceNow
//            //            current.append(interval)
//            
//            pin_array.append(current)
//            
//            current = []
//        }
    }
}

extension GoOutViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        mapView.showsUserLocation = (status == .authorizedAlways)
    }
}

extension GoOutViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? Constants.Pin {
            // Better to make this class property
            let annotationIdentifier = "AnnotationIdentifier"
            
            var annotationView: MKAnnotationView?
            if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
                annotationView = dequeuedAnnotationView
                annotationView?.annotation = annotation
            }
            else {
                annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            }
            
            if let annotationView = annotationView {
                // Configure your annotation view here
                annotationView.canShowCallout = true
                annotationView.image = UIImage(named: "yourImage")
            }
            
            return annotationView
            
//            let identifier = "pin"
//            var view: MKPinAnnotationView
//            if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
//                as? MKPinAnnotationView { // 2
//                dequeuedView.annotation = annotation
//                view = dequeuedView
//            } else {
//                view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
//                view.canShowCallout = false
//                view.animatesDrop = true
//            }
//            return view
        }
        return nil
    }
}
