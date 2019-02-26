//
//  MapView.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 21/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation
import GoogleMaps

class MapView1 {

	static func loadView(view: UIView) -> UIView {
		// Create a GMSCameraPosition that tells the map to display the
		let camera = GMSCameraPosition.camera(withLatitude: 47.824952, longitude: 35.090359, zoom: 12.0)
		let mapView1 = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
		return mapView1
	}
	
}
