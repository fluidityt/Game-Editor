//
//  tests.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation


private func testBuildSaveLoadSword() {


let sword = EquipableItem()
	let swordDict = ud.value(forKey: EquipableItem.key(sword.name)); _=swordDict
sword.saveToFile()

	let itemToLoad = EquipableItem.key(sword.name); _=itemToLoad

	let newSword = EquipableItem(loadFromName: "Sword")

print(newSword!)

}
