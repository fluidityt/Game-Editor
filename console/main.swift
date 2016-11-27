//
//  main.swift
//  console
//
//  Created by Dude Guy on 11/23/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
import Foundation


var sword = makeSword()!
sword.saveToUD()
sword.name = "Buster"
sword.saveToUD()
//print(udef.loadEquipmentKeysAsDictVals())
udef.printl(Keys.Item.equip.rawValue)

/*
 
 0. Load the list of equipment into a dictionary listOfEquipmentModel = [nameToDisplayInView: keyToInstantiateWith]
 
 1. Make the "list of equipment" table view from that dictionary.count and
    (this will list names but not instantiate)
  2. Instantiate object on .didSelectCell() with `keyTo..` which is `listOf..[nameTo..]` 
     -- dealloc on "return"
 3. Store object into the target View Controller's static property "itemToWorkOn"
 4. Make changes to IBOutlet vars on GUI change
 5. update "itemToWorkOn" on "save", then .saveToUD() -- only do: `dealloc` if click return with no saving
 
 
/* MARK: End */ print("")


*/
