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

// MARK: Template:

/*
  // <#name#>:
  @IBOutlet weak var <#name#>Val:    UILabel!
  @IBOutlet weak var <#name#>Slider: UISlider!
	@IBAction func <#name#>Slide( _ sender: Any ) {
    matchLabelToSlider(label: <#name#>Val, slider: <#name#>Slider)
	}
*/

// MARK: - ViewModel / ViewConfig stuff:

  
  // This data will be used on .save() to create / modify an Equipable so it can .saveToUD()
  // NOTE: Also serves as configuration data (for now).

  // This is used as "default" stuff:
  // TODO: Change this with a config screen / file

  fileprivate enum itemConfig {
      static var
          hp   = MMV( 0, 50, 50 ),
          cost = MMV( 1, 500, 25 )
      
      
  }

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

  // TODO: Make the labels editText
  
  // NOTE: Matches up with EquipableItems.swift.
  
  // TODO: Minimum value and stuff auto-jumps based on level.
  
  
  struct Item35 {
    var level = 1
  
  }
  private func setSlider(slider: UISlider, fromItem item: Item35) {
  
    func getScale(_ level: Int) -> (min: Float, max: Float) {
      let minner = Float(1.0)
      let maxxer = Float(50.0)
      
      if level <= 0 { return (minner, maxxer) }
      
      func scale(_ val: Float, by level2: Int, forMax max: Float) -> Float {
        return val + (max * Float(level2-1))
      }
      
      return (min: scale(minner, by: level, forMax: maxxer),
              max: scale(maxxer, by: level, forMax: maxxer))
    }
    
    slider.minimumValue = getScale(item.level).min
    slider.maximumValue = getScale(item.level).max
    
  }
  
  // PROT:
  @IBOutlet weak var protVal:    UILabel!
  @IBOutlet weak var protSlider: UISlider!
	@IBAction func protSlide( _ sender: Any ) {
    matchLabelToSlider(label: protVal, slider: protSlider)
	}
  fileprivate func protDidLoad(fromItem item: Any) {
    protSlider
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
 
  // mp:
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

extension ItemInfo {
  func scaleToLevel(_ level: Int) {
   
    
  }
  override func viewDidLoad() {
		super.viewDidLoad()

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

