//
//  ItemInfo.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
/** TODO: Figure out how to make sliders increments of five etc
	TODO: Import key from the first tableView (should be something like didselect cell to a global or something)
	USAGE: var item = ItemModelInts.loadFromuserDefaults(forKey: desiredKey)
	ViewModel:
 TODO: Figure out configuration stuff
 
 TODO: Put in levels for items and config data for each one 
 TODO: Make a config screen / view for the sliders etc..
 TODO: Battle tester :)
 
 TODO: Figure out how to change uislider increments
*/

import Foundation
import UIKit



// MARK: - ViewModel / ViewConfig stuff:

  
  // This data will be used on .save() to create / modify an Equipable so it can .saveToUD()
  // NOTE: Also serves as configuration data (for now).

  // This is used as "default" stuff:
  // TODO: Change this with a config screen / file
fileprivate enum itemConfig {
    static var
				hp   = MMV( 0, 50, 50 ),
				cost = MMV( 1, 500, 25 )
    
    
}

// MARK: - GUI Stuff:

class ItemInfo: UITableViewController {

  // HP:
	@IBOutlet weak var hpVal:    UILabel!
	@IBOutlet weak var hpSlider: UISlider!
	@IBAction func hpSlide( _ sender: Any ) {
    matchLabelToSlider(label: hpVal, slider: hpSlider)
	}

	// COST:
	@IBOutlet weak var costVal:    UILabel!
	@IBOutlet weak var costSlider: UISlider!
	@IBAction func costSlide( _ sender: Any ) {
		matchLabelToSlider(label: costVal, slider: costSlider)
	}


	func saveToEquipableModel() { }
}

// MARK: - View stuff:

extension ItemInfo {

	override func viewDidLoad() {
		super.viewDidLoad()

	}
}

// MARK: - Placeholder stuff:

/* NOT FUNCTIONING:

 // HEY!! We should already have a list of items created that then populates here...
 static func loadFromUserDefaults(forKey: String) -> ItemModelInts {
   return ItemModelInts(forKey: forKey)
   // ... Key update stuff goes here
 }

 private func saveToUserDefaults(forKey: String) {}
 
 // Updates based on what is on the screen
 mutating func updateFromViewModel() {
   saveToUserDefaults(forKey: self.key)
 }
 
*/

