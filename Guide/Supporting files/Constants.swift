//
//  MainViewController.swift
//  guideApp
//
//  Created by Evgeniy Opryshko on 11/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation

final class Constants {
    
    struct Network {
        
        static let serverURL = "https://bnet.i-partner.ru/testAPI/"
        static let token = "g3pj0uN-qJ-F7drfmt"
        static let bodyNewSession = "a=new_session"
        static let bodyForGetEntries = "a=get_entries&session="
        static let bodyForAddEntry = "a=add_entry&session="
        static let endForAddEntry = "&body="
    }
    
    struct Keys {
        static let apiKey = "AIzaSyDa5JOSoQvNrrNi5hx1w7vswKHFgUssFIE"
    }
    
    struct Text {
        static let tryAgain = "Try again"
        static let textIsEmpty = "Please type some text..."
        static let someError = "Some error"
        static let ok = "OK"
    }
    
    struct Numbers {
        static let defaultMainScreenCellHeight = 88
    }
    
    struct Names {
        static let showDetailsSegue = "ShowDetailsSegue"
        static let cell = "Cell"
    }
    
    struct MainMenu {
        static let menuOpen = 500
        static let menuClose = 130
    }
}
