//
//  main.swift
//  console
//
//  Created by Dude Guy on 11/23/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
fileprivate func tests() {


	let sword = Equipable(name: "Sword", slot: .chest, prot: 45)

	print(sword)

	let loadedSword = Equipable.init(loadFromName: "Sword", forSlot: .chest)

}; tests()

listTest()



/*  ************ ***************** ************** ************* ************ ******************/ print("")
