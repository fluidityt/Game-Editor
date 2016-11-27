/*
//  EquipableItems.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
*/

import Foundation



// *****≥***************************************** \\
// ********** EQUIPABLE ITEMS.swift ************* \\
// ********************************************** \\

// MARK: - TOP -

fileprivate let ud = UserDefaults.standard

/// Used everywhere:
enum Slot: String {
	case
			head   = "Head->",
			chest  = "Chest->",
			hands  = "Hands->",
			feet   = "Feet->",
			legs   = "Legs->",
			finger = "Finger->"

	static func load( _ ue: String ) -> Slot {
		return Slot( rawValue: ue )!
	}
}

// MARK: -

/// Enums can be used to generate things via the Editor, which store stuff in an array/dict:
enum Keys: String {
	case item = "Item->"
	enum Item: String {
		case equip = "Item->Equip->"
	}
}

// MARK: - Main:

/// The actual item instance:
struct Equipable {

	/* Properties: */
	var
			name: String,
			slot: Slot,
			prot: Int,
			mdef: Int,
			hp:   Int,
			mp:   Int,
			ap:   Int,
			mpow: Int,
  
      cost: Int,
      // TODO: fill in:
      level = 1
}

// MARK: - Protocol:

extension Equipable {

	private typealias E = Equipable // For convenience

	/** Used in save: */
	func key() -> String {
		// TODO: Update this with udef
		return (Keys.Item.equip.rawValue + slot.rawValue + name)
	}

	/** Used in load:*/
	static func key( name2: String, slot2: Slot ) -> String {
		return (Keys.Item.equip.rawValue + slot2.rawValue + name2)
	}

	/** Called only in the item editor page:*/
	func saveToUD() {
		let info: [String: String]
				= ["name": name,
				   "slot": slot.rawValue,
				   "prot": String( prot ),
				   "mdef": String( mdef ),
				   "hp": String( hp ),
				   "mp": String( mp ),
				   "ap": String( ap ),
				   "mpow": String( mpow ),
				   "cost": String( cost )
          
		]
		udef.set( info, key() )
	}

	init?( loadFromName named: String, forSlot slotted: Slot ) {

		let key1 = E.key( name2: named, slot2: slotted )
		if let dict = ud.value( forKey: key1 ) as! [String: String]? {

      
			func val( _ ue: String ) -> String {
				return dict[ue]!
			}
			func intVal( _ ue: String ) -> Int {
				return Int( dict[ue]! )!
			}

			name = val( "name" )
			slot = Slot.load( val( "slot" ) )
			prot = intVal( "prot" )
			mdef = intVal( "mdef" )
			hp = intVal( "hp" )
			mp = intVal( "mp" )
			ap = intVal( "ap" )
			mpow = intVal( "mpow" )
      cost = intVal( "cost" )

		}

		else {
			return nil
		}
	}

}


// MARK: Utility: 

func makeSword() -> Equipable? {
	return Equipable( name: "Sword", slot: .hands, prot: 0, mdef: 0, hp: 0, mp: 0, ap: 45, mpow: 0, cost: 1 )
}

func printHands() {
	let searcher = Keys.Item.equip.rawValue + Slot.hands.rawValue
	func printItemList( by key: String ) {
		let dict = UserDefaults.standard.dictionaryRepresentation()

		for (dKey, val) in dict {
			if dKey.contains( key ) {
				print( dKey.replacingOccurrences( of: searcher, with: "" ),
				       val, "\n"
				);
			}
		}
	}
	printItemList( by: searcher )
}



// MARK: - Bottom -






