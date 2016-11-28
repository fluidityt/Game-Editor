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
      level: Int
}

// MARK: - Protocol:

extension Equipable {
  
  private typealias E = Equipable // For convenience
  
  /** Used in save: */
  func key() -> String {
    return (Keys.Item.equip.rawValue + slot.rawValue + name)
  }
  
  /** Used in load:*/
  static func key( nameOfItem: String, slotOfItem: String ) -> String {
    return (Keys.Item.equip.rawValue + slotOfItem + nameOfItem)
  }
  
  /** Called only in the item editor page:*/
  func saveToUD() {
    let info: [String: String]
      = ["name": name,
         "slot": slot.rawValue,
         "prot": String( describing: prot ), // WTF
         "mdef": String( mdef ),
         "hp":   String( hp ),
         "mp":   String( mp ),
         "ap":   String( ap ),
         "mpow": String( mpow ),
         
         "cost": String( cost ),
         "level": String( level )
    ]
    
    udef.set( info, key() )
  }
  
  // Check initializer and early exit in reverse order (if init3, exit... if init2, exit...
  
  init?(  // Initializer 1:
          loadFromName named: String?, forSlot slotted: Slot?,
        
          // Initializer 2:
          loadFromKey: String? = nil ) {

    func findTheDict() -> [String:String] {
      initializer2: do {
        if let key = loadFromKey {
          return ud.value(forKey: "Ziggly: " + key) as! [String : String]
        }
      }
      
      initializer1: do {
        if let name = named { if let slot = slotted {
          let key = E.key( nameOfItem: name, slotOfItem: slot.rawValue )
          return ud.value( forKey: key ) as! [String: String] /**/ } /**/
        }
      }
      
      print("error incoming")
      return [:]
    }
    
    assignTheThings: do {
    
      let foundDict = findTheDict()
      if  foundDict.isEmpty { return nil }
      
      // Convenience:
      func val( _ value: String ) -> String {
        return foundDict[value]!
      }
      func intVal( _ value: String ) -> Int {
        return Int( foundDict[value]! )!
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
      level = intVal( "level" )
    }
  }
}

// MARK: Utility:

func makeSword() -> Equipable? {
	return Equipable.init(name: "Sword", slot: .hands, prot: 0, mdef: 0, hp: 0, mp: 0, ap: 45, mpow: 0, cost: 100, level: 1)
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






