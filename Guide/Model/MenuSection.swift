//
//  MenuSection.swift
//  Guide
//
//  Created by Evgeniy Opryshko on 25/02/2019.
//  Copyright © 2019 Evgeniy Opryshko. All rights reserved.
//

import Foundation

struct MenuSection {
	
	let titel: String
	let icon: String
	let storyboard: String
	
}


class MenuObjects {
	
	let array = [MenuSection(titel: "Карта", icon: "mapIcon", storyboard: "Map"),
							 MenuSection(titel: "Настройки", icon: "mapIcon", storyboard: "Map"),
							 MenuSection(titel: "Правила посещения", icon: "mapIcon", storyboard: "Map"),
							 ]
}
