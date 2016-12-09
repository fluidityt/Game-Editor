//
//  TypeView.swift
//  Game Editor
//
//  Created by  Dude Guy  on 12/9/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

class TypeView: UITableViewController {

  @IBAction func clickedWeapon(_ sender: UIButton) {
    ItemView.equipmentToShow = .weapons
    presentVC(named: "Item View")
  }

  @IBAction func clickedArmor(_ sender: UIButton) {
  ItemView.equipmentToShow = .armor
  presentVC(named: "Item View")
  }
  
  @IBAction func clickedAccessories(_ sender: UIButton) {
  ItemView.equipmentToShow = .accessories
    presentVC(named: "Item View")
  }
  
  override func viewDidLoad() {
    print("hi")
  }
}
