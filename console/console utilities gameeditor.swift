//
//  console utilities gameeditor.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

enum udef {

	static private var udKey = "Ziggly: "

	/// Saves values with easy to find id:
	static func set(_ val: Any?,_ forKey: String) {
		let ud = UserDefaults.standard
		ud.setValue(val, forKey: udKey + forKey)
		ud.synchronize()
	}

	/// Loads all values:
	static func load() -> NSDictionary {
		var returnMatchedDict: [String: Any?] = [:]
		for (key, val) in UserDefaults.standard.dictionaryRepresentation() {
			if key.contains(udKey) {
				returnMatchedDict[key.replacingOccurrences(of: udKey, with: "")] = val
			}
		}
		return returnMatchedDict as NSDictionary
	}

	static func printl() {
		let dict = load() as NSDictionary
		for (key, val) in dict {
			if key as! String == "" { print("\"\"", "=", val, "\n")
			} else {	print(key, "=", val, "\n") }
		}
	}
}
