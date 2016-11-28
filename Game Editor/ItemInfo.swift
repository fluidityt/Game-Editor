//
//  ItemInfo.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//



// TODO: Make the labels editText
// NOTE: If you change the item to a class, then we will need to refactor and avoid crash..

import Foundation
import UIKit

 class IntLabel: UILabel {

  var int: Int = -1
}

 extension UISlider {
  
    func matchLabelToSelf(label: IntLabel) {
      // FIXME: round to 5 algo
      label.int = Int(value)
      label.text = String(label.int)
    }

}

fileprivate func setSlider(_ slider: UISlider,
                         fromItem item: Equipable,
                         min1: Float = 1,
                         max1: Float = 50,
                         itemValue: Int) {

    // getScale():
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

// MARK: - GUI Stuff:

// NOTE: Modify this in the previous VC .didSelectCell before .presentView or whatever...
enum globalEquipItemStuff {
  
  static func defaultItem() -> Equipable { return Equipable(name: "Default", slot: .head, prot: 30, mdef: 20, hp: 0, mp: 0, ap: 0, mpow: 0, cost: 0, level: 0) }
  static func errorItem() -> Equipable { return Equipable(name: "Error in loading cell!", slot: .head, prot: 30, mdef: 20, hp: 0, mp: 0, ap: 0, mpow: 0, cost: 0, level: 0) }
  static var item: Equipable? { didSet { fatalError("crap") } }// Should be a let :{

}

class ItemInfo: UITableViewController {
  
  private var itemModSave = globalEquipItemStuff.item ?? globalEquipItemStuff.errorItem()
  
  private func placeholder() {
  /*
   
   // <#NAME#>:
   @IBOutlet weak var <#name#>Val:    IntLabel!
   @IBOutlet weak var <#name#>Slider: UISlider!
   @IBAction func <#name#>Slide( _ sender: UISlider ) {
     sender.matchLabelToSelf(label: <#name#>Val)
     itemModSave.<#name#> = <#name#>Val.int
   }
   fileprivate func <#name#>DidLoad() {
     setSlider(<#name#>Slider, fromItem: itemModSave, itemValue: itemModSave.<#name#>)
     <#name#>Slider.matchLabelToSelf(label: <#name#>Val)
   }
 
 */
  }

// MARK: - Values:
  
  // PROT:
  @IBOutlet weak var protVal: IntLabel!
  @IBOutlet weak var protSlider: UISlider!
  @IBAction func protSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: protVal)
    itemModSave.prot = protVal.int
  }
  fileprivate func protDidLoad() {
    setSlider(protSlider, fromItem: itemModSave, itemValue: itemModSave.prot)
    protSlider.matchLabelToSelf(label: protVal)
  }
  
  // MDEF:
  @IBOutlet weak var mdefVal:    IntLabel!
  @IBOutlet weak var mdefSlider: UISlider!
  @IBAction func mdefSlide( _ sender: UISlider ) {
    sender.matchLabelToSelf(label: mdefVal)
    itemModSave.mdef = mdefVal.int
  }
  fileprivate func mdefDidLoad() {
    setSlider(mdefSlider, fromItem: itemModSave, itemValue: itemModSave.mdef)
    mdefSlider.matchLabelToSelf(label: mdefVal)
  }
  
  // HP:
  @IBOutlet weak var hpVal:    IntLabel!
  @IBOutlet weak var hpSlider: UISlider!
  @IBAction func hpSlide( _ sender: UISlider ) {
     sender.matchLabelToSelf(label: hpVal)
     itemModSave.hp = hpVal.int
   }
   fileprivate func hpDidLoad() {
     setSlider(hpSlider, fromItem: itemModSave, itemValue: itemModSave.hp)
     hpSlider.matchLabelToSelf(label: hpVal)
   }
  
  // MP:
  @IBOutlet weak var mpVal:    IntLabel!
  @IBOutlet weak var mpSlider: UISlider!
  @IBAction func mpSlide( _ sender: UISlider ) {
     sender.matchLabelToSelf(label: mpVal)
     itemModSave.mp = mpVal.int
   }
   fileprivate func mpDidLoad() {
     setSlider(mpSlider, fromItem: itemModSave, itemValue: itemModSave.mp)
     mpSlider.matchLabelToSelf(label: mpVal)
   }
  
  // AP:
  @IBOutlet weak var apVal:    IntLabel!
  @IBOutlet weak var apSlider: UISlider!
  @IBAction func apSlide( _ sender: UISlider ) {
     sender.matchLabelToSelf(label: apVal)
     itemModSave.ap = apVal.int
   }
   fileprivate func apDidLoad() {
     setSlider(apSlider, fromItem: itemModSave, itemValue: itemModSave.ap)
     apSlider.matchLabelToSelf(label: apVal)
   }
  
  // MPOW:
  @IBOutlet weak var mpowVal:    IntLabel!
  @IBOutlet weak var mpowSlider: UISlider!
  @IBAction func mpowSlide( _ sender: UISlider ){
     sender.matchLabelToSelf(label: mpowVal)
     itemModSave.mpow = mpowVal.int
   }
   fileprivate func mpowDidLoad() {
     setSlider(mpowSlider, fromItem: itemModSave, itemValue: itemModSave.mpow)
     mpowSlider.matchLabelToSelf(label: mpowVal)
   }

  // COST:
  @IBOutlet weak var costVal:    IntLabel!
  @IBOutlet weak var costSlider: UISlider!
  @IBAction func costSlide( _ sender: UISlider ){
     sender.matchLabelToSelf(label: costVal)
     itemModSave.cost = costVal.int
   }
   fileprivate func costDidLoad() {
     setSlider(costSlider, fromItem: itemModSave, itemValue: itemModSave.cost)
     costSlider.matchLabelToSelf(label: costVal)
   }
  
  // LEVEL:
  @IBOutlet weak var levelVal:    IntLabel!
  @IBOutlet weak var levelSlider: UISlider!
  @IBAction func levelSlide( _ sender: UISlider ){
     sender.matchLabelToSelf(label: levelVal)
     itemModSave.level = levelVal.int
   }
   fileprivate func levelDidLoad() {
     setSlider(levelSlider, fromItem: itemModSave, itemValue: itemModSave.level)
     levelSlider.matchLabelToSelf(label: levelVal)
   }
  
// MARK: - Buttons:
  
  @IBAction func clickSave(_ sender: UIButton) {
    itemModSave.saveToUD()
    udef.printl(itemModSave.key())
  }
  
  
}

// MARK: - View stuff:

extension ItemInfo {
  
  override func viewDidLoad() {
    
  		super.viewDidLoad()
    
    protDidLoad()
    mdefDidLoad()
    hpDidLoad()
    mpDidLoad()
    apDidLoad()
    mpowDidLoad()
    costDidLoad()
    levelDidLoad()
    
  }
}

// MARK: - Placeholder stuff:

private func placeholder() {
/* NOT FUNCTIONING:

 // HEY!! We should already have a list of items created that then populates here...
 static func loadFromUserDefaults(forKey: String) -> ItemModelInts {
   return ItemModelInts(forKey: forKey)
   // ... Key update stuff goes here
 }

 private func saveToUserDefaults(forKey: String) {}
 
 // Updates based on what is on the screen
 mutating func updateFromViewModel() {
   saveToUserDefaults(forKey: self.key)
 }

   // @IBYADADYA func saveToEquipableModel() { }
  // @IBYADA    func reset()
*/
}

