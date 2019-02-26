//
//  MainViewController.swift
//  guideApp
//
//  Created by Evgeniy Opryshko on 11/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation
import UIKit

class Main: UIViewController {
	
	// MARK: Interface outlets
	@IBOutlet weak var menuButton: UIButton!
	@IBOutlet weak var mainImage: UIImageView!
	@IBOutlet weak var menu: UIView!
	@IBOutlet weak var menuHeight: NSLayoutConstraint!
	@IBOutlet weak var bigTextConstraint: NSLayoutConstraint!
	
	@IBOutlet weak var smallText: UILabel!
	@IBOutlet weak var bigText: UILabel!
	
	@IBOutlet weak var tableView: UITableView!
	
	
	
	// MARK: Instance variables/constants
	let menuObjects = MenuObjects()
	
	
	//MARK: UIViewController lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		
		Decorator.decorate(self)
		
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.isNavigationBarHidden = true
		
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
	
	
	@IBAction func map(_ sender: Any) {
		var myViewController: UIViewController!
		let storyboard = UIStoryboard(name: "Map", bundle: nil)
		myViewController = storyboard.instantiateViewController(withIdentifier: "Map")
		present(myViewController, animated: true, completion: nil)
	}
	//MARK: Action funcs
	@IBAction func menuButton(_ sender: Any) {
		
		if self.menuHeight.constant == CGFloat(Constants.MainMenu.menuClose) {
			menuOpen()
		} else {
			menuClose()
		}
		
	}

	func menuOpen() {
		UIView.animate(withDuration: 0.6, animations: {
			self.menuHeight.constant = CGFloat(Constants.MainMenu.menuOpen)
			self.bigTextConstraint.constant = 50
			self.smallText.alpha = 0
			self.view.layoutIfNeeded()
		}) { (true) in
			print("MenuOpen")
			self.smallText.alpha = 1
		}
	}
	
	func menuClose() {
		UIView.animate(withDuration: 0.6, animations: {
			self.menuHeight.constant = CGFloat(Constants.MainMenu.menuClose)
			self.bigTextConstraint.constant = 120
			self.smallText.alpha = 0
			self.view.layoutIfNeeded()
		}) { (true) in
			print("MenuClose")
			self.smallText.alpha = 1
		}
	}

}


extension Main {
	fileprivate class Decorator {
		private init () {}
		
		static func decorate(_ vc: Main) {
			vc.menu.layer.cornerRadius = 25
			vc.menuHeight.constant = CGFloat(Constants.MainMenu.menuClose)
			vc.navigationController?.isNavigationBarHidden = true
		}
	}
}


extension Main: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return menuObjects.array.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MenuCellCustom
		
		cell.titelLabel.text = menuObjects.array[indexPath.row].titel
		cell.titelImage.image = UIImage(named: "\(menuObjects.array[indexPath.row].icon)")
		cell.titelView.layer.cornerRadius = 5
		
		cell.selectionStyle = .none
	
		return cell
		
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		
			transitionPushToViewController(name: "\(menuObjects.array[indexPath.row].storyboard)")
		
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	
}
