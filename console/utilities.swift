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

	private static var udKey = "Ziggly: "

	/** Saves values with easy to find id: */
	static func set( _ val: Any?, _ forKey: String ) {
		let ud = UserDefaults.standard
		ud.setValue( val, forKey: udKey + forKey )
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
