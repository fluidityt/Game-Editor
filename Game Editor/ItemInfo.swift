//
//  ItemInfo.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit


// Utility:
struct MinMaxDefault {
	var min: Float
	var max: Float
	var def: Float

	init (_ min2: Float = 0,_ max2: Float = 1,_ def2: Float = 1) {
		min = min2
		max  = max2
		def = def2

	}
}
typealias MMD = MinMaxDefault


protocol ViewModel {}
// ViewModel:
struct ItemInts: ViewModel {

	var hp: Float = 20
	var cost: Float = 25

}

class ItemInfo: UITableViewController {

	// Fields:
	var item = ItemInts()

	// Funcs:

	// HP:
	@IBOutlet weak var hpVal: UILabel!
	@IBOutlet weak var hpSlider: UISlider!
	@IBAction func hpSlide(_ sender: Any) {
		item.hp = hpSlider.value
		hpVal.text = String(Int(item.hp))
	}
	private func hpDidLoad() {
		hpVal.text = String(Int(item.hp))
		hpSlider.setValue(item.hp, animated: true)
	}

	// COST:
	@IBOutlet weak var costVal: UILabel!
	@IBOutlet weak var costSlider: UISlider!
	@IBAction func costSlide(_ sender: Any) {
		item.cost = costSlider.value
		costVal.text = String(Int(item.cost))
	}
	private func costDidLoad() {
		costVal.text = String(Int(item.cost))
		costSlider.setValue(item.cost, animated: true)
	}

	// View stuff
	override func viewDidLoad() {
		super.viewDidLoad()
		hpDidLoad()
		costDidLoad()
	}
}
