//
//  ItemInfo.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

// MARK: - GUI Stuff:

class ItemInfo: UITableViewController {

  // NOTE: Matches up with EquipableItems.swift.
  

  

  // Temporary item
  struct Item35 {
    var
    name: String,
    slot: String,
    prot: Int,
    mdef: Int,
    hp:   Int,
    mp:   Int,
    ap:   Int,
    mpow: Int,
    
    cost: Int,
    level: Int
  }
  
  /*
   
   // <#NAME#>:
   @IBOutlet weak var <#name#>Val:    UILabel!
   @IBOutlet weak var <#name#>Slider: UISlider!
   @IBAction func <#name#>Slide( _ sender: UISlider ) {
   matchLabelToSlider(label: <#name#>Val, slider: <#name#>Slider)
   }
   
 */
  
  // FIXME: Put in the edit texts here
  // TODO: Make the labels editText
  
  // PROT:
  @IBOutlet weak var protVal:    UILabel!
  @IBOutlet weak var protSlider: UISlider!
  @IBAction func protSlide( _ sender: UISlider ) {
    matchLabelToSlider(label: protVal, slider: protSlider)
  }
  
  // MDEF:
  @IBOutlet weak var mdefVal:    UILabel!
  @IBOutlet weak var mdefSlider: UISlider!
	@IBAction func mdefSlide( _ sender: UISlider ) {
    matchLabelToSlider(label: mdefVal, slider: mdefSlider)
	}
    // HP:
	@IBOutlet weak var hpVal:    UILabel!
	@IBOutlet weak var hpSlider: UISlider!
	@IBAction func hpSlide( _ sender: UISlider ) {
    matchLabelToSlider(label: hpVal, slider: hpSlider)
	}
 
  // MP:
  @IBOutlet weak var mpVal:    UILabel!
  @IBOutlet weak var mpSlider: UISlider!
	@IBAction func mpSlide( _ sender: UISlider ) {
    matchLabelToSlider(label: mpVal, slider: mpSlider)
	}

  // AP:
  @IBOutlet weak var apVal:    UILabel!
  @IBOutlet weak var apSlider: UISlider!
	@IBAction func apSlide( _ sender: UISlider ) {
    matchLabelToSlider(label: apVal, slider: apSlider)
	}

  // MPOW:
  @IBOutlet weak var mpowVal:    UILabel!
  @IBOutlet weak var mpowSlider: UISlider!
	@IBAction func mpowSlide( _ sender: UISlider ) {
    matchLabelToSlider(label: mpowVal, slider: mpowSlider)
	}

	// COST:
	@IBOutlet weak var costVal:    UILabel!
	@IBOutlet weak var costSlider: UISlider!
	@IBAction func costSlide( _ sender: UISlider ) {
		matchLabelToSlider(label: costVal, slider: costSlider)
 }

 // LEVEL:
 @IBOutlet weak var levelVal:    UILabel!
 @IBOutlet weak var levelSlider: UISlider!
 @IBAction func levelSlide( _ sender: UISlider ) {
 matchLabelToSlider(label: levelVal, slider: levelSlider)
 }
  
}

// MARK: - View stuff:

extension ItemInfo {
  
  // This gets updated in the previous view controller's .didSelectCell()
  static var itemToWorkOn = Item35.init(name: "Bow", slot: "hands", prot: 0, mdef: 0, hp: 0, mp: 0, ap: 25, mpow: 0, cost: 250, level: 1)
  
  override func viewDidLoad() {

    // Local copy:
    let itemTWWO = ItemInfo.itemToWorkOn
  
  // setSlider():
   func setSlider(slider: UISlider,
                         fromItem item: Item35,
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
    
		super.viewDidLoad()
    /* Placeholders: */ do {
    /*
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>)
     */
  }
    setSlider(slider: protSlider, fromItem: itemTWWO, itemValue: itemTWWO.prot)
    setSlider(slider: mdefSlider, fromItem: itemTWWO, itemValue: itemTWWO.mdef)
    setSlider(slider: hpSlider,   fromItem: itemTWWO, itemValue: itemTWWO.hp)
    setSlider(slider: mpSlider,   fromItem: itemTWWO, itemValue: itemTWWO.mp)
    setSlider(slider: apSlider,   fromItem: itemTWWO, itemValue: itemTWWO.ap)
    setSlider(slider: mpowSlider, fromItem: itemTWWO, itemValue: itemTWWO.mpow)
  }
  
  // TODO: Make a save function, but we need data from the other controller.
  

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

