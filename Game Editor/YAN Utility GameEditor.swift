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
