//
//  console utilities gameeditor.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

// VERY COOL EXTENSION:
extension String {
  
  func remove(_ occurrence: String) -> String {
    return self.replacingOccurrences(of: occurrence, with: "")
  }
}

// TODO: Figure out how to email / web this or something--transfer the dictionary.. iCloud?
// TODO: Figure out how to do a backup / multiple saves
enum udef {

	fileprivate static var udKey = "Ziggly: "
}

func ziggly(_ key: String) -> String {
  var improperZigKey = key
  while improperZigKey.contains(udef.udKey) {
    improperZigKey = improperZigKey.remove(udef.udKey)
  }
  
  let properZigKey = udef.udKey + improperZigKey
  return properZigKey
}

public class Toast {
  
  let viewController: UIViewController
  
  var alertController: UIAlertController?
  
  // For timer:
  var alertTimer:   Timer?,
      baseMessage:  String?,
      remainingTime = 0
  
  let title:        String,
      message:      String,
      duration:     Int
  
  init(inViewController vc: UIViewController, title: String, message: String, duration: Int) {
    self.viewController = vc
    self.title          = title
    self.message        = message
    self.duration       = duration
  }
  
  func showAlertMsg() {
    
    guard (alertController == nil) else {
      print("Alert already displayed")
      return
    }
    
    // alertTimer:
    remainingTime   = duration
    alertTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(countDown),
                                      userInfo: nil, repeats: true)
    
    // alertController
    baseMessage     = message
    alertController = UIAlertController(title: title, message: baseMessage, preferredStyle: .alert)
    
    // Cancel action:
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
      print("Alert was cancelled")
      self.alertController=nil
      self.alertTimer?.invalidate()
      self.alertTimer=nil
    }
    
    alertController!.addAction(cancelAction)
    viewController!.present(alertController!, animated: true, completion: nil)
  }
  
  @objc func countDown() {
    
    self.remainingTime -= 1
    if (self.remainingTime < 0) {
      self.alertTimer?.invalidate()
      self.alertTimer = nil
      self.alertController!.dismiss(animated: true, completion: {
        self.alertController = nil
      })
    } else {
      self.alertController!.message = self.alertMessage()
    }
    
  }
  
  func alertMessage() -> String {
    var message=""
    if let baseMessage=self.baseMessage {
      message=baseMessage+" "
    }
    return(message+"\(self.remainingTime)")
  }
}


// MARK: - udef:

extension udef {
  
  // FIXME: Give prompt to over-write existing data... ?
	/** Saves values with easy to find id: */
	static func set( _ val: Any?, _ forKey: String ) {
		let ud = UserDefaults.standard
    let key = ziggly(forKey)
    
    if ud.value(forKey: key) != nil { print("overwriting key:", key) }
		ud.setValue( val, forKey: ziggly(forKey) )
		ud.synchronize()
	}

	/** Loads all values: */
	static func load( _ searchKey: String = udKey ) -> NSDictionary {
	  var returnMatchedDict: [String: Any?] = [:]
	
    for (key, val) in UserDefaults.standard.dictionaryRepresentation() {
			if key.contains( searchKey ) {
				returnMatchedDict[key.remove(udKey).remove(searchKey)] = val
			}
		}
		return returnMatchedDict as NSDictionary
	}

	static func printl( _ searchKey: String = udKey ) {
		let dict = load( searchKey ) as NSDictionary
		print( "Showing: " + searchKey + "\n" )
		for (key, val) in dict {
			if key as! String == "" {
				print( "\"\"", "=", val, "\n" )
			}	else { print( key, "=", val, "\n" )	}
		}
	}
}

// Load equipment:
extension udef {
  
  private static func clean(dirtyKey: String) {
    print("Cleaning", dirtyKey, "value was not NSDictionary")
    set(nil, dirtyKey)
  }
  
  static func loadEquipmentKeysAsDictVals() -> [String:String] {
    
    var returnMatchedDict: [String: String] = [:]
    
    let equipmentKey = ziggly(Keys.Item.equip.rawValue)
    
    for (key, val) in UserDefaults.standard.dictionaryRepresentation() {
      // Find all keys in 'standard' that match equipmentKey:
      if key.contains(equipmentKey) {
        // Error checking:
        if let val2 = val as? NSDictionary {
          let name = val2.value(forKey: "name") as! String
          returnMatchedDict[name] = ziggly(key) // Our desired format: ["Sword": "Ziggy->Sword
        } else { clean(dirtyKey: key) }
        
      }
    }
    
    return returnMatchedDict
  }
}

// Delete equipment:
extension udef {
  
  static func deleteEquipment() {
    
    let itemKey = ziggly(Keys.Item.equip.rawValue)
    
    for (key, _) in UserDefaults.standard.dictionaryRepresentation() {
      if key.contains(itemKey) {
        set(nil, key)
      }
    }
  }
}

