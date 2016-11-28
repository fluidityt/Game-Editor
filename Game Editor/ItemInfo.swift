//
//  ItemInfo.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

// FIXME: Make the labels editText
// FIXME: Make a save function, but we need data from the other controller.

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
    print(item)
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
   @IBOutlet weak var <#name#>Val:    IntLabel! { didSet { item.<#name#> = <#name#>.int } }
   @IBOutlet weak var <#name#>Slider: UISlider!
   @IBAction func <#name#>Slide( _ sender: UISlider ) {
     sender.matchToLabel(label: <#name#>Val)
   }
   fileprivate func <#name#>DidLoad() {
     setSlider(<#name#>Slider, fromItem: item, itemValue: item.<#name#>)
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
  @IBAction func mdefSlide( _ sender: UISlider ) { sender.matchLabelToSelf(label: mdefVal) }
  //fileprivate func mdefDidLoad() { setSlider(mdefSlider, fromItem: item, itemValue: item.mdef) }
  
  // HP:
  @IBOutlet weak var hpVal:    IntLabel!
  @IBOutlet weak var hpSlider: UISlider!
  @IBAction func hpSlide( _ sender: UISlider ) { sender.matchLabelToSelf(label: hpVal)	}
  //fileprivate func hpDidLoad() { setSlider(hpSlider, fromItem: item, itemValue: item.hp) }
  
  // MP:
  @IBOutlet weak var mpVal:    IntLabel!
  @IBOutlet weak var mpSlider: UISlider!
  @IBAction func mpSlide( _ sender: UISlider ) {    sender.matchLabelToSelf(label: mpVal)  }
  //fileprivate func mpDidLoad() { setSlider(mpSlider, fromItem: item, itemValue: item.mp) }
  
  // AP:
  @IBOutlet weak var apVal:    IntLabel!
  @IBOutlet weak var apSlider: UISlider!
  @IBAction func apSlide( _ sender: UISlider ) {    sender.matchLabelToSelf(label: apVal)  }
  //fileprivate func apDidLoad() { setSlider(apSlider, fromItem: item, itemValue: item.ap) }
  
  // MPOW:
  @IBOutlet weak var mpowVal:    IntLabel!
  @IBOutlet weak var mpowSlider: UISlider!
  @IBAction func mpowSlide( _ sender: UISlider ) {    sender.matchLabelToSelf(label: mpowVal)  }
  //fileprivate func mpowDidLoad() { setSlider(mpowSlider, fromItem: item, itemValue: item.mpow) }

  // COST:
  @IBOutlet weak var costVal:    IntLabel!
  @IBOutlet weak var costSlider: UISlider!
  @IBAction func costSlide( _ sender: UISlider ) {    sender.matchLabelToSelf(label: costVal)  }
  //fileprivate func costDidLoad() { setSlider(costSlider, fromItem: item, itemValue: item.cost) }
  
  // LEVEL:
  @IBOutlet weak var levelVal:    IntLabel!
  @IBOutlet weak var levelSlider: UISlider!
  @IBAction func levelSlide( _ sender: UISlider ) {    sender.matchLabelToSelf(label: levelVal)  }
  //fileprivate func levelDidLoad() { setSlider(levelSlider, fromItem: item, itemValue: item.level) }
}

// MARK: - View stuff:

extension ItemInfo {
  
  override func viewDidLoad() {
    
  		super.viewDidLoad()
    
    protDidLoad()
    /*mdefDidLoad()
    hpDidLoad()
    mpDidLoad()
    apDidLoad()
    mpowDidLoad()
    costDidLoad()
    levelDidLoad()
    */
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

