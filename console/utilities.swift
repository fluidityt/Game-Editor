//
//  console utilities gameeditor.swift
//  Game Editor
//
//  Created by Dude Guy on 11/24/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation

// VERY COOL EXTENSION:
extension String {
  
  func remove(_ occurrence: String) -> String {
    return self.replacingOccurrences(of: occurrence, with: "")
  }
  
  mutating func remove2(_ thing: String) {
    self = self.replacingOccurrences(of: thing, with: "")
    print(self)
  }
}

