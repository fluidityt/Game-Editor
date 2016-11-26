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
 
*/

import Foundation
import UIKit

// MARK: - ViewModel / ViewConfig stuff:

class ItemInfo: UITableViewController {

  // This data will be used on .save() to create / modify an Equipable so it can .saveToUD()
  // NOTE: Also serves as configuration data (for now).
  private enum item {
		static var
    hp			= MMV(0, 50,  50),
	  cost		= MMV(1, 500, 25)
    
    static func saveToEquipableModel() {}
	}
}

// MARK: - GUI Stuff:

extension ItemInfo {
  
  // HP:
  
  @IBOutlet weak var hpVal: UILabel! { get { item.hp.val } }
	@IBOutlet weak var hpSlider: UISlider!
	@IBAction func hpSlide(_ sender: Any) { // Adjust view model and model
		item.hp.val = hpSlider.value // TODO: Refactor this because we may not want to keep our changes (implement save button)
		hpVal.text = String(Int(item.hp.val))
	}
	private func hpDidLoad() { // Adjust view model only
		hpVal.text = String(Int(item.hp.val))

	}

	// COST:
	@IBOutlet weak var costVal: UILabel!
	@IBOutlet weak var costSlider: UISlider!
	@IBAction func costSlide(_ sender: Any) {
		item.cost.val = costSlider.value
		costVal.text = String(Int(item.cost.val))
	}
	private func costDidLoad() {
		costVal.text = String(Int(item.cost.val))
		costSlider.setValue(item.cost.val, animated: true)
	}
}

// MARK: - View stuff:

extension ItemInfo {

	override func viewDidLoad() {
		super.viewDidLoad()
		hpDidLoad()
		costDidLoad()
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

