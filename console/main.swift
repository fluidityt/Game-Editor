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
	static func load(_ ue: String) -> Slot { return Slot(rawValue: ue)! }
}

// The actual item instance
struct EquipableItem {
	private typealias EI = EquipableItem


	let name: String
	let slot: Slot
	let prot: Int


/* Saving / Loading: */

	private static let index = "Items->Equip->"
	private static func key(_ itemName: String) -> String { return EI.index + itemName }

/* Saving: */

	func saveToFile() {

		let info:[String:String] =	["name": name,
		                          	 "slot": slot.rawValue,
		                          	 "prot": String(prot)]

		ud.set(info, forKey: EI.key(name))
		ud.synchronize()
	}


/* Loading: */

	private init(loadFromDict d: [String:String]) {
		func val(_ ue: String) -> String { return d[ue]! }
		func intVal(_ ue: String) -> Int { return Int(d[ue]!)! }

		name = val("name")
		slot = Slot.load(val("slot"))
		prot = intVal("prot")

	}

	/// If let loadedItem = EequipItem.loadFromName ....
	static func loadFromName(_ named: String) -> EquipableItem? {

		if let zip = ud.value(forKey: EI.key(named)) {
			return nil
		}

		else { return nil }
	}

	
}//EoC

// Model to hold it:
enum EquipPageInfo {

	static var name = ""

	static func clickSave(toItem: EquipableItem){
		// for stuff in self, copy to item

	}

}





