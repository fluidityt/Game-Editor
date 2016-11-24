//
//  stuff.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

let ud = UserDefaults.standard

// Enums can be used to generate things via the Editor, which store stuff in an array/dict:
enum Keys:String {
	case item = "Item->"
		enum Item: String {
			case equip = "Item->Equip->"
		}
}
/// Contains key(), init?(loadFromName), and saveToFile()
protocol HasKey {
/** Make sure to use the global enoom Key
	

		 // "Item->Equip->Bow"
	    return(Keys.Item.equip.rawValue + itemName)
*/
	static func key(_:String) -> String


/** Loads everything from ud:

		if let dict = ud.value(forKey: EI.key(named)) 
      as! [String:String]? {

        func val(_ ue: String) -> String
        { return dict[ue]! }
	
        func intVal(_ ue: String) -> Int
        { return Int(dict[ue]!)! }

		    name = val("name")
		    slot = Slot.load(val("slot"))
		    prot = intVal("prot")
		}

		else { return nil }
*/
	init?(loadFromName named: String)


/** Put everything in dict then synchronize:

	## Body example:

		let info: [String:String]
      = ["name": name,
         "slot": slot.rawValue,
         "prot": String(prot)]

		ud.set(info, forKey: EI.key(name))
		ud.synchronize()
*/
	func saveToFile()

}
