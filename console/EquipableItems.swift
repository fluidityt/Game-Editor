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
    enum Equip: String {
      case weapon = "Weapon->"
      case armor  = "Armor->"
      case accessory = "Accessory->"
    }
	}
}

// MARK: - Main:

/// The actual item instance:
struct Equipable {

	/* Properties: */
	var name: String { didSet { if name == "" { name = "empty" } } }
  
  var slot: Slot,
      prot: Int,
			mdef: Int,
			hp:   Int,
			mp:   Int,
			ap:   Int,
			mpow: Int,
  
      cost: Int,
      level: Int
}

extension Equipable {
  func findType() -> Keys.Item.Equip {
    switch slot {
      case .head, .chest, .feet, .legs: return .armor
      case .hands: return .weapon
      case .finger: return .accessory
    }
  }
  
  static func findType(slot: Slot) -> Keys.Item.Equip {
   switch slot {
      case .head, .chest, .feet, .legs: return .armor
      case .hands: return .weapon
      case .finger: return .accessory
    }
  }
}


// MARK: - Protocol:

extension Equipable {
  
  private typealias E = Equipable // For convenience
  
  /** Used in save: */
  func key() -> String {
    return ziggly(Keys.Item.equip.rawValue + findType().rawValue + slot.rawValue + name)
  }
  
  /** Used in load:*/
  static func key( nameOfItem: String, slotOfItem: Slot ) -> String {
    return ziggly (
      Keys.Item.equip.rawValue
      +
      findType(slot: slotOfItem).rawValue
      +
      slotOfItem.rawValue
      +
      nameOfItem
    )
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
    
    // FIXME: Give prompt to over-write existing data... ?
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
          return ud.value(forKey: ziggly(key)) as! [String : String]
        }
      }
      
      initializer1: do {
        if let name = named { if let slot = slotted {
          let key = E.key( nameOfItem: name, slotOfItem: slot )
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
  
  static func loadFromKey(_ key: String) -> Equipable? {
    return Equipable(loadFromName: nil, forSlot: nil, loadFromKey: key)
  }
}

extension Equipable {
  
 static func makeDefault(slot: Slot) -> Equipable { return Equipable(name: "Default", slot: slot, prot: 0,  mdef: 0,  hp: 0, mp: 0, ap: 0, mpow: 0, cost: 0, level: 0) }
 static func makeError(slot: Slot) -> Equipable { return Equipable(name: "Error",   slot: slot, prot: 30, mdef: 20, hp: 0, mp: 0, ap: 0, mpow: 0, cost: 0, level: 0) }
 static func makeNew(slot: Slot) -> Equipable { return Equipable(name: "New \(slot.rawValue)", slot: slot,  prot: 30, mdef: 20, hp: 0, mp: 0, ap: 0, mpow: 0, cost: 0, level: 0)}
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






