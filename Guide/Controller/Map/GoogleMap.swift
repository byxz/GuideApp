//
//  GoogleMap.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 24/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation
import GoogleMaps

class GoogleMap {
		
	private let lat = 47.824952
	private let long = 35.090359
	private let zoom: Float = 12.0
	
	func createMapView(from view: GMSMapView) {
		let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: zoom)
		view.camera = camera
		view.isMyLocationEnabled = true
		view.mapStyle(withFilename: "custom", andType: "json")
	}
	
}
