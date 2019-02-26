//
//  Position.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 21/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation
import GoogleMaps

class Position {
	
	
	 func loadView() {
		// Create a GMSCameraPosition that tells the map to display the
		let camera = GMSCameraPosition.camera(withLatitude: 47.824952, longitude: 35.090359, zoom: 12.0)
		let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
		//view = mapView
		
		// Creates a marker in the center of the map.
		let marker = GMSMarker()
		marker.position = CLLocationCoordinate2D(latitude: -33.86, longitude: 151.20)
		marker.title = "Sydney"
		marker.snippet = "Australia"
		marker.map = mapView
	}
}
