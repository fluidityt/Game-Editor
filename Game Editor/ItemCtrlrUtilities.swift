//
//  ItemCtrlrUtilities.swift
//  Game Editor
//
//  Created by Dude Guy  on 12/10/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

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

extension UIViewController {
  func presentVC(named vc: String) {
    if let sb2 = storyboard {
      present(sb2.instantiateViewController(withIdentifier: vc), animated: true, completion: nil)
    } else { fatalError("couldnt load storyboard") }
  }
}

