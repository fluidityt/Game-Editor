//
//  YAN Utility GameEditor.swift
//  Game Editor
//
//  Created by Dude Guy on 11/22/16.
//  Copyright © 2016 Dude Guy. All rights reserved.
//

import Foundation
import UIKit

// Utility:
struct MinMaxValue {
	var min: Float
	var max: Float
	var val: Float

	init (_ min2: Float = 0,_ max2: Float = 1,_ val2: Float = 1) {
		min = min2
		max  = max2
		val = val2
	}

	func setSliderToMinMaxVal(slider: inout UISlider) {
		slider.maximumValue = max
		slider.minimumValue = min
		slider.value				= val
	}
}
typealias MMV = MinMaxValue

protocol ViewModel {}
