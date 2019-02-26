//
//  GMSMapView.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 24/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

//import Foundation
import GoogleMaps

extension GMSMapView {
	func mapStyle(withFilename name: String, andType type: String) {
		do {
			if let styleURL = Bundle.main.url(forResource: name, withExtension: type) {
				self.mapStyle = try GMSMapStyle(contentsOfFileURL: styleURL)
			} else {
				NSLog("Unable to find style.json")
			}
		} catch {
			NSLog("One or more of the map styles failed to load. \(error)")
		}
	}
}
