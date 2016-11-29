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

extension UIViewController {
  func presentVC(named vc: String) {
    if let sb2 = storyboard {
      present(sb2.instantiateViewController(withIdentifier: vc), animated: true, completion: nil)
    } else { fatalError("couldnt load storyboard") }
  }
}

// TODO: Header

class ItemView: UITableViewController {

  // MARK: - clickNew:
  
  @IBAction func clickNew(_ sender: Any) {
  }
  
 
// MARK: - viewDidLoad:
  
		private var equipment = [(name: "Crash Inc", key: "Crash Key")]
  
    private func loadEquipment() {
    
    equipment = []
    for (key, val) in udef.loadEquipmentKeysAsDictVals() {
      equipment.append((key, val))
    }
    
    if equipment.isEmpty { // Makes sure that we have a key to load for didSelect():
      let ourOnlyItem = globalEquipItemStuff.defaultItem()
      ourOnlyItem.saveToUD()
      equipment.append((ourOnlyItem.name, ourOnlyItem.key()))
    }
  }

	override func viewDidLoad() {
		super.viewDidLoad()
    loadEquipment()
	}

  // MARK: - didSelectRow():
  
  private var isDeleteMode = false
  
  @IBAction func clickDeleteMode(_ sender: Any) {
  }
  private func doDeleteMode(selectedRow: Int) {
  }
  private func doRegularMode(selectedRow: Int) {
  
    globalEquipItemStuff.item = Equipable.loadFromKey( ziggly(equipment[indexPath.row].key) )
    presentVC(named: "Item Info")
  }
  
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    isDeleteMode
    ? doDeleteMode(selectedRow: indexPath.row)
    : doRegularMode(selectedRow: indexPath.row)
    
	}

    // MARK: - numberOfRowsInSection:
    
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
		-> Int {
      return equipment.count;
	}

// MARK: - cellForRowAt():
    
func grabCell(indexPath: IndexPath) -> UITableViewCell {
		return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
	}
    
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
		-> UITableViewCell {

			let cell = grabCell(indexPath: indexPath)
			cell.textLabel?.text = equipment[indexPath.row].name

			return cell
	}

} // EoC
