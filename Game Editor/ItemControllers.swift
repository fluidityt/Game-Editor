//
//  ViewControllers.swift
//  Game Editor
//
//  Created by Dude Guy  on 12/10/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Top:

fileprivate enum filal {

  // Type to use for last 2 VC:
  static var equipmentTypeSelected = "none"
  
  // For making items from Equipable.makeX(slot: Slot):
  static func findSlot() -> Slot {
  typealias KIE = Keys.Item.Equip
    switch equipmentTypeSelected {
      case KIE.weapon.rawValue:     return Slot.hands
      case KIE.armor.rawValue:      return Slot.chest
      case KIE.accessory.rawValue:  return Slot.finger
      default:                      fatalError("no item type found")
    }
  }
  
  // Item mod save?:
  static var item: Equipable? {                                                           // <- Should be a let :{
    didSet { print("should be a let: static item changed.") }
  }
}


// MARK: - Detail:

class DetailCtrlr: UITableViewController {

  private var itemModSave = filal.item ?? Equipable.makeError(slot: filal.findSlot())     // <- The item that we modify then save. Loaded in previous screen.

  // FIXME: Wow, this is stupid-complicated for no reason:
  private func setSlider(_ slider: UISlider,
                           fromItem item: Equipable,
                           min1: Float = 1,
                           max1: Float = 50,
                           itemValue: Int) {
  
  func getScale(_ level: Int,
                min2: Float,
                max2: Float) -> (min: Float, max: Float) {
    
    if level <= 0 { return (min2, max2) }
    
    // scale():
    func scale(_ val: Float,
               by level2: Int,
               forMax max3: Float) -> Float {
      
      return val + (max3 * Float(level2-1))
    }
    
    return (min: scale(min2, by: level, forMax: max2),
            max: scale(max2, by: level, forMax: max2))
  }
  
  let results = getScale(item.level, min2: min1, max2: max1)
  
  // Assignment:
  slider.minimumValue = results.min
  slider.maximumValue = results.max
  slider.value = Float(itemValue)
}

  // TableView:
  @IBOutlet private var itemInfoTableView: UITableView!
  
  // NAME:
  @IBOutlet private weak var nameVal: UITextField!
  private func nameDidLoad() {
    nameVal.text = itemModSave.name
  }
  private func nameDidSave() {
    
    if itemModSave.name != nameVal.text {
      // Delete old key: with nil?
      UserDefaults.standard.set(nil, forKey: itemModSave.key())
    }
    
    itemModSave.name = nameVal.text!
    print(itemModSave.name)
  }
  
  // PROT:
  @IBOutlet private weak var protCell: UITableViewCell!
  @IBOutlet private weak var protVal: IntLabel!
  @IBOutlet private weak var protSlider: UISlider!
  @IBAction private func protSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: protVal)
    itemModSave.prot = protVal.int
  }
  private func protDidLoad() {
    setSlider(protSlider, fromItem: itemModSave, itemValue: itemModSave.prot)
    protSlider.matchLabelToSelf(label: protVal)
  }
  
  // MDEF:
  @IBOutlet private weak var mdefCell: UITableViewCell!
  @IBOutlet private weak var mdefVal:    IntLabel!
  @IBOutlet  private weak var mdefSlider: UISlider!
  @IBAction private func mdefSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: mdefVal)
    itemModSave.mdef = mdefVal.int
  }
  private func mdefDidLoad() {
    setSlider(mdefSlider, fromItem: itemModSave, itemValue: itemModSave.mdef)
    mdefSlider.matchLabelToSelf(label: mdefVal)
  }
  
  // HP:
  @IBOutlet private weak var hpCell: UITableViewCell!
  @IBOutlet private weak var hpVal:    IntLabel!
  @IBOutlet private weak var hpSlider: UISlider!
  @IBAction private func hpSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: hpVal)
    itemModSave.hp = hpVal.int
  }
  private func hpDidLoad() {
    setSlider(hpSlider, fromItem: itemModSave, itemValue: itemModSave.hp)
    hpSlider.matchLabelToSelf(label: hpVal)
  }
  
  // MP:
  @IBOutlet private weak var mpCell: UITableViewCell!
  @IBOutlet private weak var mpVal:    IntLabel!
  @IBOutlet private weak var mpSlider: UISlider!
  @IBAction private func mpSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: mpVal)
    itemModSave.mp = mpVal.int
  }
  private func mpDidLoad() {
    setSlider(mpSlider, fromItem: itemModSave, itemValue: itemModSave.mp)
    mpSlider.matchLabelToSelf(label: mpVal)
  }
  
  // AP:
  @IBOutlet private weak var apCell: UITableViewCell!
  @IBOutlet private weak var apVal:    IntLabel!
  @IBOutlet private weak var apSlider: UISlider!
  @IBAction private func apSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: apVal)
    itemModSave.ap = apVal.int
  }
  private func apDidLoad() {
    setSlider(apSlider, fromItem: itemModSave, itemValue: itemModSave.ap)
    apSlider.matchLabelToSelf(label: apVal)
  }
  
  // MPOW:
  @IBOutlet private weak var mpowCell: UITableViewCell!
  @IBOutlet private weak var mpowVal:    IntLabel!
  @IBOutlet private weak var mpowSlider: UISlider!
  @IBAction private func mpowSlide( _ sender: UISlider ){
    sender.matchLabelToSelf(label: mpowVal)
    itemModSave.mpow = mpowVal.int
  }
  private func mpowDidLoad() {
    setSlider(mpowSlider, fromItem: itemModSave, itemValue: itemModSave.mpow)
    mpowSlider.matchLabelToSelf(label: mpowVal)
  }
  
  // COST:
  @IBOutlet private weak var costVal:    IntLabel!
  @IBOutlet private weak var costSlider: UISlider!
  @IBAction  private func costSlide( _ sender: UISlider ){
    sender.matchLabelToSelf(label: costVal)
    itemModSave.cost = costVal.int
  }
  private func costDidLoad() {
    setSlider(costSlider, fromItem: itemModSave, itemValue: itemModSave.cost)
    costSlider.matchLabelToSelf(label: costVal)
  }
  
  // LEVEL: (Has weird function pattern or levelSlide)
  @IBOutlet private weak var levelVal:    IntLabel!
  @IBOutlet private weak var levelSlider: UISlider!
  private func levelDidLoad() {
    levelSlider.minimumValue = 1
    levelSlider.maximumValue = 5
    levelSlider.value        = Float(itemModSave.level)
    levelSlider.matchLabelToSelf(label: levelVal)
  }
  private func didLoad() {
    nameDidLoad()
    protDidLoad()
    mdefDidLoad()
    hpDidLoad()
    mpDidLoad()
    apDidLoad()
    mpowDidLoad()
    costDidLoad()
    levelDidLoad()
  }
  @IBAction  private func levelSlide( _ sender: UISlider ){                                         // <- When we move level, we need to re-update all the others.
    levelVal.int      = Int(sender.value)
    itemModSave.level = levelVal.int
    didLoad()
    
  }
  
  // Other funcs:
  
  @IBAction private func clickSave(_ sender: UIButton) {
    nameDidSave()
    itemModSave.saveToUD()
    Toast.make(message: "Item Saved!", viewController: self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    didLoad()
    
    func showWeapons(){
      protCell.isHidden = true
      mdefCell.isHidden = true
      hpCell.isHidden = true
      mpCell.isHidden = true
    }
    func showArmor(){
      apCell.isHidden = true
      hpCell.isHidden = true
      mpCell.isHidden = true
      mpowCell.isHidden = true
    }
    func showAcessories(){
      protCell.isHidden = true
      mdefCell.isHidden = true
      apCell.isHidden = true
      mpowCell.isHidden = true
    }
    
    switch filal.equipmentTypeSelected {
      case Keys.Item.Equip.weapon.rawValue: showWeapons()
      case Keys.Item.Equip.armor.rawValue: showArmor()
      case Keys.Item.Equip.accessory.rawValue: showAcessories()
      default: fatalError("no string found")

    }
    // FIXME: Hide uneeded cells here
    // itemInfoTableView.deleteRows(at:, with: <#T##UITableViewRowAnimation#>)
    filal.item = nil                                                       // <- Because we want ensure that we get a fresh new item.
  }
}


// MARK: - List:

class ListCtrl: UITableViewController {
  
  private var isDeleteMode = false
  private var equipment = [(name: "Crash Inc", key: "Crash Key")]                         // <- temporary
  private var deletionIP: IndexPath? = nil
  
  private func addNewItem(toArray equipArray: inout [(name: String, key: String)]) {      // <- Gives us a new Equipment instance.
    // FIXME: Hotfixed... change to let and not a UUID:
    var newItem = Equipable.makeNew(slot: filal.findSlot())
    newItem.name += ( " item with ID:  " + UUID().uuidString )
    newItem.saveToUD()
    equipArray.append( (name: newItem.name, key: newItem.key()) )
  }
  
  private func deleteRow(alertAction: UIAlertAction!) {
    if let indexPath = deletionIP {
      tableView.beginUpdates()
      
      equipment.remove(at: indexPath.row)
      
      // Note that indexPath is wrapped in an array:  [indexPath]
      tableView.deleteRows(at: [indexPath], with: .automatic)
      
      deletionIP = nil
      
      tableView.endUpdates()
    }
  }
  
  private func cancelDeletion(alertAction: UIAlertAction!) {
    deletionIP = nil
  }
  
  private func confirmDelete(planet: (name: String, key: String)) {
    let alert = UIAlertController(title: "Delete Planet",
                                  message: "Are you sure you want to permanently delete \(planet.name)?",
                                  preferredStyle: .actionSheet)
    
    let DeleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: deleteRow)
    let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: cancelDeletion)
    
    alert.addAction(DeleteAction)
    alert.addAction(CancelAction)
    
    // Support display in iPad
    alert.popoverPresentationController?.sourceView = self.view
    alert.popoverPresentationController?.sourceRect = CGRect(x: view.bounds.size.width / 2.0,
                                                             y: view.bounds.size.height / 2.0,
                                                             width: 1.0,
                                                             height: 1.0)
    
    present(alert, animated: true, completion: nil)
  }
  
  @IBOutlet private weak var titleLabel: UILabel! {
    didSet { titleLabel.text = filal.equipmentTypeSelected }
  }
  
  @IBOutlet private var
  itemViewTable: UITableView!
  
  @IBAction private func goBack(_ sender: UIButton) {
    presentVC(named: "Type View")
  }
  
  @IBAction private func clickNew(_ sender: UIButton) {
    addNewItem(toArray: &equipment)
    itemViewTable.reloadData()
    Toast.make(message: "New Item Added!", viewController: self)
  }
  
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
  
  // I like having the name of the funcs directly under it is easier to find...
  override func tableView(_ tableView: UITableView,
                          didSelectRowAt indexPath: IndexPath) {
    func doDeleteMode(selectedRow: Int) {
      // TODO: Stuff
    }
    
    func doRegularMode(selectedRow: Int) {
      print(equipment[selectedRow].key)
      filal.item = Equipable.loadFromKey( ziggly(equipment[selectedRow].key) )
      presentVC(named: "Item Info")
    }
    
    doRegularMode(selectedRow: indexPath.row)
    // FIXME: Fix deletemode
    /* isDeleteMode
     ? doDeleteMode ( selectedRow: indexPath.row )
     : doRegularMode( selectedRow: indexPath.row )
     */
  }
  
  override func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int {
      return equipment.count
  }
  
  override func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      let cell = grabCell(indexPath: indexPath)
      cell.textLabel?.text = equipment[indexPath.row].name
      
      return cell
  }
  
  override func tableView(_ tableView: UITableView,
                          commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      deletionIP = indexPath
      let planetToDelete = equipment[indexPath.row]
      confirmDelete(planet: planetToDelete)
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // TODO: Make ui test of thi
    loadEquipment: do {                                                                     // <- Loads all of our `standard` data into `equipment`.
      equipment = []                                                                        // <- We need fresh data.
      for (key, val) in udef.loadEquipmentKeysAsDictVals() {
        // FIXME: Append keys in Equip page.
        if val.contains(filal.equipmentTypeSelected) {
          equipment.append((key, val))                                                      // <- Fresh data :)
        }
      }
      if equipment.isEmpty { addNewItem(toArray: &equipment) }                              // <- Makes sure that we have a key to load for didSelect().
    }
  }
  
}



// MARK: - Main:

class MainCtrlr: UITableViewController {
  
  @IBAction private func
    clickedWeapon(_ sender: UIButton) {
  filal.equipmentTypeSelected = Keys.Item.Equip.weapon.rawValue
    presentVC(named: "Item View")
  }
  
  @IBAction private func
    clickedArmor(_ sender: UIButton) {
  filal.equipmentTypeSelected = Keys.Item.Equip.armor.rawValue
    presentVC(named: "Item View")
  }
  
  @IBAction private func
    clickedAccessories(_ sender: UIButton) {
      filal.equipmentTypeSelected = Keys.Item.Equip.accessory.rawValue
    print(filal.equipmentTypeSelected)
    presentVC(named: "Item View")
  }
  
  override func viewDidLoad() {
    filal.equipmentTypeSelected = "none"
  }
}


// MARK: - Bottom:
