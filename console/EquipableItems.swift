	//
	//  EquipableItems.swift
	//  Game Editor
	//
	//  Created by Dude Guy on 11/24/16.
	//  Copyright © 2016 Dude Guy. All rights reserved.
	//

	import Foundation


	// MARK: - TOP -

	// ********************************************** \\
	// ********** EQUIPABLE ITEMS.swift ************* \\
	// ********************************************** \\


// MARK: -

	/// Used everywhere:
	enum Slot: String {
		case
		head =  "head",
		chest = "chest",
		hands = "hands",
		feet = "feet",
		legs = "legs",
		finger = "finger"

		static func load(_ ue: String) -> Slot { return Slot(rawValue: ue)! }
	}

	/// Enums can be used to generate things via the Editor, which store stuff in an array/dict:
	fileprivate enum Keys:String {
	/**/case item = "Item->"
	/**//**/enum Item: String {
	/**//**//**/case equip = "Item->Equip->"
	/**//**//**//**/enum Equip: String {
	/**//**//**//**//**/case head = "Item->Equip->Head->"
	/**//**//**//**//**/case chest = "Item->Equip->Chest->"
	/**//**//**//**/}
	/**//**/}
	}

	fileprivate let ud = UserDefaults.standard

	/* Lists: */

	fileprivate var listOfItems:[String: String] = [:]
	fileprivate let listOfItemsKey = "Equip Items Key"

	fileprivate func list(_ name: String,_ slot: Slot) { listOfItems[name] = slot.rawValue }
	fileprivate func saveList() { ud.set(listOfItems, forKey: listOfItemsKey); ud.synchronize() }
	fileprivate func loadList() { listOfItems = ud.value(forKey: listOfItemsKey) as! [String:String] }

	func listTest() {
		list("Dagger",.hands)
		list("Sword",.hands)
		list("BronzeHelm",.head)

		saveList()
		print(NSDictionary(dictionary: listOfItems))

	}

// MARK: -

	/// The actual item instance:
	struct Equipable {

	/* Properties: */ let

		name: String,
		slot: Slot,
		prot: Int

	/* Inits: */

		init(name: String, slot: Slot, prot: Int) {						// Full init
			self.name = name; self.slot = slot; self.prot = prot
		}

	}

// MARK: - Protocol:

	extension Equipable {

		private typealias E = Equipable // For convenience

		func key() -> String { return(slot.rawValue + name)	}

		static func key(name2: String, slot2: Slot) -> String { return(slot2.rawValue + name2) }

		func saveToUD() {
			let info: [String:String]
				=	["name": name,
					 "slot": slot.rawValue,
					 "prot": String(prot)]

			ud.set(info, forKey: key())
			ud.synchronize()
		}

		init?(loadFromName named: String, forSlot slotted: Slot) {

			let key1 = E.key(name2: named, slot2: slotted)
			if let dict = ud.value( forKey: key1 ) as! [String: String]? {

				func val(_ ue: String) -> String { return dict[ue]! }
				func intVal(_ ue: String) -> Int { return Int(dict[ue]!)! }

				name = val("name")
				slot = Slot.load(val("slot"))
				prot = intVal("prot")
			}

			else { return nil }
		}

	}//EoC

// MARK: -

	// Model to hold it:
	enum EquipHeadPageInfo {

		static var name = ""

		static func clickSave(toItem: Equipable){
			// for stuff in self, copy to item

		}
	}

// MARK: - Bottom -






