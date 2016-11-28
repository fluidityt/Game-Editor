//
//  console utilities gameeditor.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

// VERY COOL EXTENSION:
extension String {
  
  func remove(_ occurrence: String) -> String {
    return self.replacingOccurrences(of: occurrence, with: "")
  }
}

// TODO: Figure out how to email / web this or something--transfer the dictionary.. iCloud?
// TODO: Figure out how to do a backup / multiple saves
enum udef {

	fileprivate static var udKey = "Ziggly: "
}

func ziggly(_ key: String) -> String {
  var improperZigKey = key
  while improperZigKey.contains(udef.udKey) {
    improperZigKey = improperZigKey.remove(udef.udKey)
  }
  
  let properZigKey = udef.udKey + improperZigKey
  return properZigKey
}

extension udef {
  
	/** Saves values with easy to find id: */
	static func set( _ val: Any?, _ forKey: String ) {
		let ud = UserDefaults.standard
		ud.setValue( val, forKey: ziggly(forKey) )
		ud.synchronize()
	}

	/** Loads all values: */
	static func load( _ searchKey: String = udKey ) -> NSDictionary {
	  var returnMatchedDict: [String: Any?] = [:]
	
    for (key, val) in UserDefaults.standard.dictionaryRepresentation() {
			if key.contains( searchKey ) {
				returnMatchedDict[key.remove(udKey).remove(searchKey)] = val
			}
		}
		return returnMatchedDict as NSDictionary
	}

	static func printl( _ searchKey: String = udKey ) {
		let dict = load( searchKey ) as NSDictionary
		print( "Showing: " + searchKey + "\n" )
		for (key, val) in dict {
			if key as! String == "" {
				print( "\"\"", "=", val, "\n" )
			}	else { print( key, "=", val, "\n" )	}
		}
	}
}

// For equipables?
extension udef {
    
  static func loadEquipmentKeysAsDictVals() -> [String:String] {
    
    var returnMatchedDict: [String: String] = [:]
    
    let itemKey = ziggly(Keys.Item.equip.rawValue)
    
    for (key, val) in UserDefaults.standard.dictionaryRepresentation() {
      if key.contains(itemKey) {
        let val2 = val as! NSDictionary
        let name = val2.value(forKey: "name") as! String
        returnMatchedDict[name] = ziggly(key) // Our desired format: ["Sword": "Ziggy->Sword
      }
    }
    
    return returnMatchedDict
  }
}
