//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation


extension ColorAsset.Color {
	
	public enum ColorSpace : String, Codable {
		case srgb
		case extendedsRGB = "extended-srgb"
		case extendedLienarSRGB = "extended-linear-srgb"
		case displayP3 = "display-p3"
		case grayGamma22 = "gray-gamma-22"
		case extendedGray = "extended-gray"
	}
}
