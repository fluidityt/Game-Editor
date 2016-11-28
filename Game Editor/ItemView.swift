//
//  ItemView.swift
//  Game Editor
//
//  Created by Dude Guy on 11/21/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//


// To the bottom:
//	@IBAction func addItem(_ sender: Any) {
//		testCounter += 1
//		let newItem = testName + "\(testCounter)"
//		items.append(newItem)
//
//		let newPath = IndexPath(row: (items.count - 1), section: 0)
//		tableView.insertRows(at: [newPath], with: .automatic)
//	}


import Foundation
import UIKit

// TODO: Header

class ItemView: UITableViewController {

/* Fields: */ private var
              // Can I use a dictionary for this?
              // Can use udef.load for this? Followed by = Equipable(loadFrom: )?
							equipment		= [(name: "Crash Inc", key: "Crash Key")],
							insertTop		= false,
							testCounter = 0,
							testName		= "Item "


/* MARK: Funcs: */

	func grabCell(indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
	}

  private func loadEquipment() {
    
    equipment = []
    for (key, val) in udef.loadEquipmentKeysAsDictVals() {
      equipment.append((key, val))
    }
    if equipment.isEmpty { // Makes sure that we have a key to load for didSelect():
      let ourOnlyItem = globalEquipItemStuff.defaultItem()
      ourOnlyItem.saveToUD()
      equipment.append((ourOnlyItem.name, "Ziggly: " + ourOnlyItem.key()))
    }
  }
  

/* MARK: - Overrides: */

	override func viewDidLoad() {
		super.viewDidLoad()
    loadEquipment()
	}

	/// didSelectRow()
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    globalEquipItemStuff.item = Equipable(loadFromName: nil, forSlot: nil,
                                          loadFromKey: udef.udKey + equipment[indexPath.row].key)
    let nextVC = UIStoryboard(name: "item2", bundle: nil).instantiateViewController(withIdentifier: "Item Info") as! UITableViewController
    present(nextVC, animated: true, completion: nil)
	}

	/// makeRows()
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
		-> Int {
      return equipment.count;
	}

	/// grabCellAtRow()
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
		-> UITableViewCell {

			let cell = grabCell(indexPath: indexPath)
			cell.textLabel?.text = equipment[indexPath.row].name

			return cell
	}

} // EoC
