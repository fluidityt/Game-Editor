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
*/

import Foundation
import UIKit



class ItemInfo: UITableViewController {

	private struct ItemModelInts: ViewModel {

		let key: String

		var hp			= MMV(0, 50,  50)
		var cost		= MMV(1, 500, 25)

	/* Place older stuff~!!! */

		private init(forKey: String) { // Called from LoadUserDefaults()
			key = forKey
		}

		static func loadFromUserDefaults(forKey: String) -> ItemModelInts {
			return ItemModelInts(forKey: forKey)
			// ... Key update stuff goes here
		}

		private func saveToUserDefaults(forKey: String) {}

		mutating func updateFromViewModel() {		// Updates based on what is on the screen
			saveToUserDefaults(forKey: self.key)
		}

	}

	// Fields:
	private var item = ItemModelInts.loadFromUserDefaults(forKey: "potion")

	// Funcs:
	private func saveToItemModel() {} // calls ItemModelInts.updateFromViewModel()

	// HP:
  @IBOutlet weak var hpVal: UILabel!
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

	// View stuff
	override func viewDidLoad() {
		super.viewDidLoad()
		hpDidLoad()
		costDidLoad()
	}
}
