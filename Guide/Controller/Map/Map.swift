//
//  Map.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 21/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import UIKit
import GoogleMaps

class Map: UIViewController {
	
	
	// MARK: Interface outlets
	@IBOutlet weak var mapView: GMSMapView!
	@IBOutlet weak var showMyLocation: UIButton!
	
	// MARK: Private instance
	private let map = GoogleMap()
	
	let lat = 47.824952
	 let long = 35.090359
	
	
	
	//MARK: UIViewController lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		map.createMapView(from: mapView)
		
		let position = CLLocationCoordinate2D(latitude: lat, longitude: long)
		let london = GMSMarker(position: position)
		london.title = "London"
		london.icon = UIImage(named: "my_location")
		london.map = mapView
		
		
		
		
		Decorator.decorate(self)
		
	}
	
	
	//MARK: Configurations
	func addMarker() {
		let marker = GMSMarker()
		marker.position = CLLocationCoordinate2DMake(-23.562573, -46.654952)
		marker.title = "Av. Paulista"
		marker.snippet = "São Paulo"
		marker.map = mapView
	}
	
	//MARK: Action funcs

	@IBAction func showMyLocation(_ sender: Any) {
		let location: CLLocation? = mapView.myLocation
		if location != nil {
			mapView.animate(toLocation: (location?.coordinate)!)
		}
	}
	
}



extension Map {
	fileprivate class Decorator {
		
		private init() {}
		
		static func decorate(_ vc: Map) {
			vc.showMyLocation.transform = CGAffineTransform(scaleX: -1, y: 1)
			vc.showMyLocation.layer.cornerRadius = vc.showMyLocation.frame.height / 2
			vc.navigationController?.isNavigationBarHidden = false
		}
	}
}
