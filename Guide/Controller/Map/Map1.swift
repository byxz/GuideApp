//
//  Map.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 21/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

class Map1: UIViewController, CLLocationManagerDelegate, GMSMapViewDelegate {
	
	let previewDemoData = [(title: "The Nifty Lounge", img: #imageLiteral(resourceName: "my_location"), price: 8), (title: "The Lunar Petal", img: #imageLiteral(resourceName: "my_location"), price: 12)]
	
	
	
	// MARK: Interface outlets
	
	
	// MARK: Instance variables/constants
	
	let currentLocationMarker = GMSMarker()
	var locationManager = CLLocationManager()
	var chosenPlace: Places?
	
	let customMarkerWidth: Int = 50
	let customMarkerHeight: Int = 70
	
	
	let btnMyLocation: UIButton = {
		let btn = UIButton()
		btn.backgroundColor = UIColor.white
		btn.setImage(#imageLiteral(resourceName: "my_location"), for: .normal)
		btn.layer.cornerRadius = 25
		btn.clipsToBounds = true
		btn.tintColor = UIColor.gray
		btn.imageView?.tintColor = UIColor.gray
		btn.addTarget(self, action: #selector(btnMyLocationAction), for: .touchUpInside)
		btn.translatesAutoresizingMaskIntoConstraints = false
		return btn
	}()
	
	let myMapView: GMSMapView = {
		let v = GMSMapView()
		v.translatesAutoresizingMaskIntoConstraints = false
		return v
	}()
	
	
	//MARK: UIViewController lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		myMapView.delegate = self
		locationManager.delegate = self
		locationManager.requestWhenInUseAuthorization()
		//locationManager.startUpdatingLocation()
		//		locationManager.startMonitoringSignificantLocationChanges()
		
		setupViews()
		initGoogleMaps()
		myMapView.mapStyle(withFilename: "custom", andType: "json")
		
		
		//
		
		createMarkers(lat: 47.824952, long: 35.090359, image: #imageLiteral(resourceName: "my_location"), tag: 1)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		
	}
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
	}
	
	override func viewDidDisappear(_ animated: Bool) {
		super.viewDidDisappear(animated)
		
	}
	
	
	//	// MARK: GOOGLE AUTO COMPLETE DELEGATE
	//	// TODO: ???
	//	func viewController(_ viewController: GMSAutocompleteViewController, didAutocompleteWith place: GMSPlace) {
	//		let lat = place.coordinate.latitude
	//		let long = place.coordinate.longitude
	//
	//		showPartyMarkers(lat: lat, long: long)
	//
	//		let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
	//		myMapView.camera = camera
	//		//txtFieldSearch.text=place.formattedAddress
	//		chosenPlace = Places(name: place.formattedAddress!, lat: lat, long: long)
	//		let marker=GMSMarker()
	//		marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
	//		marker.title = "\(place.name ?? "xz")"
	//		marker.snippet = "\(place.formattedAddress!)"
	//		marker.map = myMapView
	//
	//		self.dismiss(animated: true, completion: nil) // dismiss after place selected
	//	}
	//
	//	func viewController(_ viewController: GMSAutocompleteViewController, didFailAutocompleteWithError error: Error) {
	//		print("ERROR AUTO COMPLETE \(error)")
	//	}
	//
	//	func wasCancelled(_ viewController: GMSAutocompleteViewController) {
	//		self.dismiss(animated: true, completion: nil)
	//	}
	
	
	
	// MARK: CLLocation Manager Delegate
	
	func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
		print("Error while getting location \(error)")
	}
	
	func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
		locationManager.delegate = nil
		locationManager.stopUpdatingLocation()
		let location = locations.last
		let lat = (location?.coordinate.latitude)!
		let long = (location?.coordinate.longitude)!
		let camera = GMSCameraPosition.camera(withLatitude: lat, longitude: long, zoom: 17.0)
		
		self.myMapView.animate(to: camera)
		
		
	}
	
	// MARK: GOOGLE MAP DELEGATE
	func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool {
		guard let customMarkerView = marker.iconView as? CustomMarkerView else { return false }
		let img = customMarkerView.img!
		let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: img, borderColor: UIColor.white, tag: customMarkerView.tag)
		
		marker.iconView = customMarker
		
		return false
	}
	
	//	func mapView(_ mapView: GMSMapView, markerInfoContents marker: GMSMarker) -> UIView? {
	//		guard let customMarkerView = marker.iconView as? CustomMarkerView else { return nil }
	//		let data = previewDemoData[customMarkerView.tag]
	//		restaurantPreviewView.setData(title: data.title, img: data.img, price: data.price)
	//		return restaurantPreviewView
	//	}
	
	func mapView(_ mapView: GMSMapView, didTapInfoWindowOf marker: GMSMarker) {
		guard let customMarkerView = marker.iconView as? CustomMarkerView else { return }
		let tag = customMarkerView.tag
		markerTapped(tag: tag)
	}
	
	func mapView(_ mapView: GMSMapView, didCloseInfoWindowOf marker: GMSMarker) {
		guard let customMarkerView = marker.iconView as? CustomMarkerView else { return }
		let img = customMarkerView.img!
		let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: img, borderColor: UIColor.darkGray, tag: customMarkerView.tag)
		marker.iconView = customMarker
	}
	
	func showPartyMarkers(lat: Double, long: Double) {
		myMapView.clear()
		for i in 0..<2 {
			let randNum=Double(arc4random_uniform(30))/10000
			let marker=GMSMarker()
			let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: previewDemoData[i].img, borderColor: UIColor.darkGray, tag: i)
			marker.iconView=customMarker
			let randInt = arc4random_uniform(4)
			if randInt == 0 {
				marker.position = CLLocationCoordinate2D(latitude: lat+randNum, longitude: long-randNum)
			} else if randInt == 1 {
				marker.position = CLLocationCoordinate2D(latitude: lat-randNum, longitude: long+randNum)
			} else if randInt == 2 {
				marker.position = CLLocationCoordinate2D(latitude: lat-randNum, longitude: long-randNum)
			} else {
				marker.position = CLLocationCoordinate2D(latitude: lat+randNum, longitude: long+randNum)
			}
			marker.map = self.myMapView
		}
	}
	
	func createMarkers(lat: Double, long: Double, image: UIImage, tag: Int) {
		myMapView.clear()
		let marker = GMSMarker()
		let customMarker = CustomMarkerView(frame: CGRect(x: 0, y: 0, width: customMarkerWidth, height: customMarkerHeight), image: image, borderColor: UIColor.darkGray, tag: tag)
		marker.iconView = customMarker
		marker.position = CLLocationCoordinate2D(latitude: lat, longitude: long)
		marker.map = self.myMapView
	}
	
	//	var restaurantPreviewView: RestaurantPreviewView = {
	//		let v=RestaurantPreviewView()
	//		return v
	//	}()
	
	
	//Create map
	func initGoogleMaps() {
		let camera = GMSCameraPosition.camera(withLatitude: 47.824952, longitude: 35.090359, zoom: 12.0)
		self.myMapView.camera = camera
		self.myMapView.delegate = self
		self.myMapView.isMyLocationEnabled = true
		self.myMapView.mapType = GMSMapViewType.terrain
		
	}
	
	func setupViews() {
		view.addSubview(myMapView)
		myMapView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		myMapView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
		myMapView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
		myMapView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 60).isActive = true
		
		//		restaurantPreviewView=RestaurantPreviewView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 190))
		
		self.view.addSubview(btnMyLocation)
		btnMyLocation.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
		btnMyLocation.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
		btnMyLocation.widthAnchor.constraint(equalToConstant: 50).isActive = true
		btnMyLocation.heightAnchor.constraint(equalTo: btnMyLocation.widthAnchor).isActive = true
	}
	
	
	
	
	
	
	//MARK: Action funcs
	//Show my location
	@objc func btnMyLocationAction() {
		myMapView.mapStyle(withFilename: "custom", andType: "json")
		let location: CLLocation? = myMapView.myLocation
		if location != nil {
			myMapView.animate(toLocation: (location?.coordinate)!)
			
		}
	}
	
	
	//MARK: Navigation
	@objc func markerTapped(tag: Int) {
		let detailController = DetailPlace()
		detailController.passedData = previewDemoData[tag]
		self.navigationController?.pushViewController(detailController, animated: true)
	}
	
	
}


