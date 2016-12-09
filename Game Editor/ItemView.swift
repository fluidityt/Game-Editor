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

// FIXME: mod this to be from the Key.enum
enum EquipmentToShow: String {
  case
  weapons = "Weapon",
  armor = "Armor",
  accessories = "Accessory",
  error = "Error"
}

// MARK: - Class:

class ItemView: UITableViewController {
  
  static var equipmentToShow: EquipmentToShow = .error                                    // <- This is modified from the previous VC
  
  @IBOutlet weak var titleLabel: UILabel! { didSet {
    titleLabel.text = ItemView.equipmentToShow.rawValue
    // FIXEME: hotfix
    switch titleLabel.text! {
    case "Weapon": ItemInfo.itemType = .weapons
    case "Armor": ItemInfo.itemType = .armor
    case "Accessory": ItemInfo.itemType = .accessories
      default: ItemInfo.itemType = .error
    }
    }
  }
  
  @IBOutlet private var itemViewTable: UITableView!
  
  @IBAction func goBack(_ sender: UIButton) {
    presentVC(named: "Type View")
  }
  private var equipment = [(name: "Crash Inc", key: "Crash Key")]
  
  private func addNewItem(toArray equipArray: inout [(name: String, key: String)]) {      // <- Gives us a new Equipment instance.
    // FIXME: Hotfixed... change to let and not a UUID:
    var newItem = globalEquipItemStuff.newItem()
    newItem.name += ( " item with ID:  " + UUID().uuidString )
    newItem.saveToUD()
    equipArray.append( (name: newItem.name, key: newItem.key()) )
  }
  
  
  // MARK: - viewDidLoad:
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    loadEquipment: do {                                                                     // <- Loads all of our `standard` data into `equipment`.
      equipment = []                                                                        // <- We need fresh data.
      for (key, val) in udef.loadEquipmentKeysAsDictVals() {
        // FIXME: Append keys in Equip page.
        if key.contains(titleLabel.text!) {
          equipment.append((key, val))                                                      // <- Fresh data :)j
        }
      }
      if equipment.isEmpty { addNewItem(toArray: &equipment) }                              // <- Makes sure that we have a key to load for didSelect().
    }
  }
  
  
  // MARK: - clickNew:
  
  @IBAction private func clickNew(_ sender: UIButton) {
    addNewItem(toArray: &equipment)
    itemViewTable.reloadData()
    Toast.make(message: "New Item Added!", viewController: self)
  }
  
  
  // MARK: - clickDeleteMode:
  
  private var isDeleteMode = false
  
  @IBAction private func clickDeleteMode(_ sender: UIButton) {
    // FIXME: Import toggle()
    isDeleteMode
      ? (isDeleteMode = false)
      : (isDeleteMode = true)
    
    equipment = []
    udef.deleteEquipment() // <- FIXME: Uhh.. I don't actually want to do this, right?
    
    addNewItem(toArray: &equipment)
    itemViewTable.reloadData()
    Toast.make(message: "Equipment Deleted!", viewController: self)
  }
  
  
  // MARK: - didSelectRow():
  
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    func doDeleteMode(selectedRow: Int) {
      // TODO: Stuff
    }
    
    func doRegularMode(selectedRow: Int) {
      print(equipment[selectedRow].key)
      globalEquipItemStuff.item = Equipable.loadFromKey( ziggly(equipment[selectedRow].key) )
      presentVC(named: "Item Info")
    }
    
    doRegularMode(selectedRow: indexPath.row)
    // FIXME: Fix deletemode
    /* isDeleteMode
     ? doDeleteMode ( selectedRow: indexPath.row )
     : doRegularMode( selectedRow: indexPath.row )
     */
  }
  
  
  // MARK: - numberOfRowsInSection:
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)
    -> Int {
      return equipment.count
  }
  
  
  // MARK: - cellForRowAt():
  
  private func grabCell(indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
    -> UITableViewCell {
      
      let cell = grabCell(indexPath: indexPath)
      cell.textLabel?.text = equipment[indexPath.row].name
      
      return cell
  }
  
} // EoC
