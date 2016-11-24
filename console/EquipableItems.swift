//
//  EquipableItems.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

// ********** EQUIPABLE ITEMS.swift ************* \\

// MARK: - TOP -

fileprivate let ud = UserDefaults.standard

// MARK: -

/// Enums can be used to generate things via the Editor, which store stuff in an array/dict:
enum Keys:String {
/**/case item = "Item->"
/**//**/enum Item: String {
/**//**//**/case equip = "Item->Equip->"
/**//**//**//**/enum Equip: String {
/**//**//**//**//**/case head = "Item->Equip->Head->"
/**//**//**//**//**/case chest = "Item->Equip->Chest->"
/**//**//**//**/}
/**//**/}
}

/// Enums used in the Equippable Item Page:
enum Slot: String {
	case
	head =  "head",
	chest = "chest"

	/*func key() -> String {
		return (Keys.Item.equip.rawValue + self.rawValue)
	}*/

	static func load(_ ue: String) -> Slot { return Slot(rawValue: ue)! }
}

// MARK: -

/// The actual item instance:
struct EquipableHeadItem {


/* Properties: */ let

	name: String,
	slot: Slot,
	prot: Int

/* Inits: */

	init() {
		name = "Sword"; slot = .chest; prot = 45
	}

}

/* Protocol: */

extension EquipableHeadItem: CanSave {

	private typealias EHI = EquipableHeadItem // For convenience

	static func key(_ itemName: String) -> String {
		return(Keys.Item.Equip.head.rawValue + itemName)
	}

	func saveToUD() {
		let info: [String:String]
			=	["name": name,
			 	 "slot": slot.rawValue,
			 	 "prot": String(prot)]

		ud.set(info, forKey: EHI.key(name))
		ud.synchronize()
	}

	init?(loadFromName named: String) {

		if let dict = ud.value( forKey: EHI.key(named) ) as! [String: String]? {

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
enum EquipHeadPageInfo {

	static var name = ""

	static func clickSave(toItem: EquipableHeadItem){
		// for stuff in self, copy to item

	}

}






