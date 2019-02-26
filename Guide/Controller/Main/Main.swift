//
//  MainViewController.swift
//  guideApp
//
//  Created by Evgeniy Opryshko on 11/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    // MARK: Interface outlets
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var mainImage: UIImageView!
    @IBOutlet weak var menu: UIView!
    @IBOutlet weak var menuHeight: NSLayoutConstraint!
    @IBOutlet weak var bigTextConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var smallText: UILabel!
    @IBOutlet weak var bigText: UILabel!
    
    
    // MARK: Instance variables/constants
    var effect: UIVisualEffect!
    
    
    //MARK: UIViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu.layer.cornerRadius = 25
        menuHeight.constant = CGFloat(Constants.MainMenu.menuClose)
        
        
        
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
    
    //            let darkBlur = UIBlurEffect(style: UIBlurEffect.Style.dark)
    //            let blurView = UIVisualEffectView(effect: darkBlur)
    //            blurView.frame = self.mainImage.bounds
    //            self.mainImage.addSubview(blurView)
    
    func menuOpen() {
        
        UIView.animate(withDuration: 0.6, animations: {
            self.menuHeight.constant = CGFloat(Constants.MainMenu.menuOpen)
            self.transferTextLogoUp()
            self.hiddenText(text: self.smallText)
            self.view.layoutIfNeeded()
        }) { (true) in
            print("MenuOpen")
            self.enebleText(text: self.smallText)
        }
    }
    
    func menuClose() {
        
        UIView.animate(withDuration: 0.6, animations: {
            self.menuHeight.constant = CGFloat(Constants.MainMenu.menuClose)
            self.tranferTextLogoDown()
            self.hiddenText(text: self.smallText)
            self.view.layoutIfNeeded()
        }) { (true) in
            print("MenuClose")
            self.enebleText(text: self.smallText)
        }
    }
    
    func hiddenText(text: UILabel) {
        text.isHidden = true
    }
    
    func enebleText(text: UILabel) {
        
        UIView.animate(withDuration: 2, animations: {
            text.isHidden = false
            self.view.layoutIfNeeded()
        }) { (true) in
            

        }
    }
    
    
    func transferTextLogoUp() {
        bigTextConstraint.constant = 50
    }
    
    func tranferTextLogoDown() {
        bigTextConstraint.constant = 120
    }
    
    
}
