//
//  ItemInfo.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//
/** TODO: Figure out how to make sliders increments of five etc
	TODO: Import key from the first tableView (should be something like didselect cell to a global or something)
	USAGE: var item = ItemModelInts.loadFromuserDefaults(forKey: desiredKey)
	ViewModel:
 TODO: Figure out configuration stuff
 
 TODO: Put in levels for items and config data for each one 
 TODO: Make a config screen / view for the sliders etc..
 TODO: Battle tester :)
 
 TODO: Figure out how to change uislider increments
*/

import Foundation
import UIKit

// MARK: Util stuff:

    public extension UILabel {
        
      var int: Int { get {return self.int} set {} }
    }

    public func matchLabelToSlider(label: UILabel, slider: UISlider) {
      // TODO: round to 5 algo
      label.int = Int(slider.value)
      label.text = String(label.int)
    }

// MARK: - GUI Stuff:

class ItemInfo: UITableViewController {

  // NOTE: Matches up with EquipableItems.swift.
  
  // TODO: Make the labels editText
  
  /*
   
   // <#NAME#>:
   @IBOutlet weak var <#name#>Val:    UILabel!
   @IBOutlet weak var <#name#>Slider: UISlider!
   @IBAction func <#name#>Slide( _ sender: Any ) {
   matchLabelToSlider(label: <#name#>Val, slider: <#name#>Slider)
   }
   
 */
  
  struct Item35 {
    var level = 1
    var prot = 45
  }

  // PROT:
  @IBOutlet weak var protVal:    UILabel!
  @IBOutlet weak var protSlider: UISlider!
  @IBAction func protSlide( _ sender: Any ) {
    matchLabelToSlider(label: protVal, slider: protSlider)
  }
  
  // MDEF:
  @IBOutlet weak var mdefVal:    UILabel!
  @IBOutlet weak var mdefSlider: UISlider!
	@IBAction func mdefSlide( _ sender: Any ) {
    matchLabelToSlider(label: mdefVal, slider: mdefSlider)
	}

  // HP:
	@IBOutlet weak var hpVal:    UILabel!
	@IBOutlet weak var hpSlider: UISlider!
	@IBAction func hpSlide( _ sender: Any ) {
    matchLabelToSlider(label: hpVal, slider: hpSlider)
	}
 
  // MP:
  @IBOutlet weak var mpVal:    UILabel!
  @IBOutlet weak var mpSlider: UISlider!
	@IBAction func mpSlide( _ sender: Any ) {
    matchLabelToSlider(label: mpVal, slider: mpSlider)
	}

  // AP:
  @IBOutlet weak var apVal:    UILabel!
  @IBOutlet weak var apSlider: UISlider!
	@IBAction func apSlide( _ sender: Any ) {
    matchLabelToSlider(label: apVal, slider: apSlider)
	}

  // MPOW:
  @IBOutlet weak var mpowVal:    UILabel!
  @IBOutlet weak var mpowSlider: UISlider!
	@IBAction func mpowSlide( _ sender: Any ) {
    matchLabelToSlider(label: mpowVal, slider: mpowSlider)
	}

	// COST:
	@IBOutlet weak var costVal:    UILabel!
	@IBOutlet weak var costSlider: UISlider!
	@IBAction func costSlide( _ sender: Any ) {
		matchLabelToSlider(label: costVal, slider: costSlider)
 }

}

// MARK: - View stuff:

/*     setSlider(slider: <#name#>Slider, fromItem: itemTWWO, itemValue: itemTWWO.<#name#>) */

extension ItemInfo {
  
  // Item that we"re working on:
  var itemTWWO: Item35 { get {return self.itemTWWO} set {} }
  
  // setSlider():
  private func setSlider(slider: UISlider,
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
  

  
  override func viewDidLoad() {
		super.viewDidLoad()
    setSlider(slider: protSlider, fromItem: itemTWWO, itemValue: itemTWWO.prot)

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

