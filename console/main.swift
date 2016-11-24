//
//  main.swift
//  console
//
//  Created by Dude Guy on 11/23/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

let ud = UserDefaults.standard

func test1() {

	enum Effects {
		case normal(String)
	}

	let z = Effects.normal("hi")

	func save() {
	}

	ud.set("sup", forKey: "supKey")
	ud.synchronize()

	var zipper = ud.dictionaryRepresentation(); print(zipper)
}


// Enums can be used to generate things via the Editor, which store stuff in an array/dict:


// Enums used in the Equippable Item Page:
enum Slot: String {
	case
	head = "head",
	chest = "chest"

	func formatForSaving() -> String { return self.rawValue }

}

// The actual item instance
struct EquipableItem {
	// let uniqueID = "45356"
	static let index = "Items->Equip->"
	let name: String
	let slot: Slot
	let prot = 45


/* Saving: */

	private func key(itemName: String) -> String { return EquipableItem.index + itemName }

	func saveToFile(fileName: String) {
		do {/*func saver(_ data: Any,_ key: String) {
		let savedKey = uniqueID + " " + key
		print("saved key is", savedKey)
		}
		saver(name,"name")
		saver(slot,"slot")*/
}

		let info:[String:String] =	["name": name,
		                          	 "slot": slot.rawValue,
		                          	 "prot": String(prot)]
		print ( info )
	}


/* Loading: */
	
		private init(loadFromDict: [String:String]) {

		}
	static func loadFromName(_ named: String) -> EquipableItem {
		if let dictionary = ud.value(forKey: key()) { }
		//name = loadFromFile
		slot = .chest // Slot(rawValue: loadFromFile)
	}

	
}

// Model to hold it:
enum EquipPageInfo {

	static var name = ""

	static func clickSave(toItem: EquipableItem){
		// for stuff in self, copy to item

	}

}





