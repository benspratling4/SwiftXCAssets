//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation
#if canImport(CoreGraphics)
import CoreGraphics

extension ColorAsset.Color.Components.Component {
	
	//converts the color from any of its representations into a value from 0 to 1
	public var cgFloatValue:CGFloat {
		switch self {
		case .hexByte(let byte):
			return CGFloat(byte) / CGFloat(255)
			
		case .float(let float):
			return CGFloat(float)
			
		case .integer(let value):
			return CGFloat(value) / CGFloat(255)
		}
	}
}

#endif
