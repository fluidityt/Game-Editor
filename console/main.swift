//
//  main.swift
//  console
//
//  Created by Dude Guy on 11/23/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation


// Enums used in the Equippable Item Page:
enum Slot: String {
	case
	head =  "head",
	chest = "chest"

	static func load(_ ue: String) -> Slot { return Slot(rawValue: ue)! }
}

// The actual item instance
struct EquipableItem: HasKey {	private typealias EI = EquipableItem

	let name: String,
	slot: Slot,
	prot: Int

	init() { name = "Sword"; slot = .chest; prot = 45 }

/* Protocol: */

	static func key(_ itemName: String) -> String {return(Keys.Item.equip.rawValue + itemName)}

	func saveToFile() {
		let info: [String:String]
			=	["name": name,
			 	 "slot": slot.rawValue,
			 	 "prot": String(prot)]

		ud.set(info, forKey: EI.key(name))
		ud.synchronize()
	}

	init?(loadFromName named: String) {
		if let dict = ud.value(forKey: EI.key(named)) as! [String:String]? {
			func val(_ ue: String) -> String { return dict[ue]! }
			func intVal(_ ue: String) -> Int { return Int(dict[ue]!)! }

			name = val("name")
			slot = Slot.load(val("slot"))
			prot = intVal("prot")
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






