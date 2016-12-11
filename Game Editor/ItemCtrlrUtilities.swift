//
//  ItemCtrlrUtilities.swift
//  Game Editor
//
//  Created by Dude Guy  on 12/10/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

public class IntLabel: UILabel {
  var int: Int = -1
}

public extension UISlider {
  
  func matchLabelToSelf(label: IntLabel) {
    // FIXME: round to 5 algo
    label.int = Int(value)
    label.text = String(label.int)
  }
  
}

public extension UIViewController {
   func presentVC(named vc: String) {
    if let sb2 = storyboard {
      present(sb2.instantiateViewController(withIdentifier: vc), animated: true, completion: nil)
    } else { fatalError("couldnt load storyboard") }
  }
}

public extension UITableViewController {
  func grabCell(indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
  }
  
  func grabCell(name: String) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: name)!
  }
      func grabPath(cellName: String) -> IndexPath {
      return tableView.indexPath(for: (tableView.dequeueReusableCell(withIdentifier: cellName))!)!
    }
}


