//
//  Map.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 21/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {
	
	
	// MARK: Interface outlets
	@IBOutlet weak var mapView: GMSMapView!
	@IBOutlet weak var showMyLocation: UIButton!
	
	// MARK: Private instance
	private let map = GoogleMap()
	
	
	
	//MARK: UIViewController lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		map.createMapView(from: mapView)
		
		
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
	@IBAction func changeMapStyle(_ button: UIButton) {
		if let title = button.currentTitle {
			self.mapView.mapStyle(withFilename: title, andType: "json")
		}
	}
	
	
	@IBAction func showMyLocation(_ sender: Any) {
		let location: CLLocation? = mapView.myLocation
		if location != nil {
			mapView.animate(toLocation: (location?.coordinate)!)
		}
	}
	
}



extension ViewController {
	fileprivate class Decorator {
		
		private init() {}
		
		static func decorate(_ vc: ViewController) {
			vc.showMyLocation.transform = CGAffineTransform(scaleX: -1, y: 1)
			vc.showMyLocation.layer.cornerRadius = vc.showMyLocation.frame.height / 2
		}
	}
}
