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

// FIXME: Header
// FIXME: I need an array integrity check, or implement Set<> (for things like new button)
// FIXME: If we have two "empty" names that is a problem (in both view controllers) -- add a check in other VC before saving to UD

import Foundation
import UIKit

extension UIViewController {
  func presentVC(named vc: String) {
    if let sb2 = storyboard {
      present(sb2.instantiateViewController(withIdentifier: vc), animated: true, completion: nil)
    } else { fatalError("couldnt load storyboard") }
  }
}

func toast(title: String = "Toast", message: String, duration: Int = 2, viewController vc: UIViewController) {
  
    Toast(inViewController: vc, title: title, message: message, duration: duration).showAlertMsg()
  
}
// MARK: - Class:

class ItemView: UITableViewController {
  
  

  
  
  
  
  
  @IBOutlet var itemViewTable: UITableView!
  
  private var equipment = [(name: "Crash Inc", key: "Crash Key")]

  private func addNewItem(toArray equipArray: inout [(name: String, key: String)]) {
    // FIXME: Hotfixed... change to let and not a UUID:
    var newItem = globalEquipItemStuff.newItem()
    newItem.name += UUID().uuidString
    newItem.saveToUD()
    equipArray.append( (name: newItem.name, key: newItem.key()) )
  }

  
// MARK: - viewDidLoad:
  
  private func loadEquipment() {
    equipment = []                                                                        // <- We need fresh data.
    for (key, val) in udef.loadEquipmentKeysAsDictVals() { equipment.append((key, val)) } // <- Fresh data :)
    if equipment.isEmpty { addNewItem(toArray: &equipment) }                              // <- Makes sure that we have a key to load for didSelect().
  }

	override func viewDidLoad() {
		super.viewDidLoad()
    loadEquipment()                                                                       // <- Loads all of our `standard` data into `equipment`.
	}
  
  
// MARK: - clickNew:
  
  @IBAction func clickNew(_ sender: UIButton) {
      addNewItem(toArray: &equipment)
      itemViewTable.reloadData()
      let alert = Alerter(inViewController: self)
      alert.showAlertMsg("Test Alert", message: "This will disappear in ", time: 2)
  }

  
// MARK: - didSelectRow():
  
  private var isDeleteMode = false
  
  @IBAction func clickDeleteMode(_ sender: UIButton) {
    // FIXME: Import toggle()
    isDeleteMode
    ? (isDeleteMode = false)
    : (isDeleteMode = true)
  }
  
  private func doDeleteMode(selectedRow: Int) {
    // TODO: Stuff
  }
  
  private func doRegularMode(selectedRow: Int) {
  
    globalEquipItemStuff.item = Equipable.loadFromKey( ziggly(equipment[selectedRow].key) )
    presentVC(named: "Item Info")
  }
  
	override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    isDeleteMode
    ? doDeleteMode ( selectedRow: indexPath.row )
    : doRegularMode( selectedRow: indexPath.row )
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
