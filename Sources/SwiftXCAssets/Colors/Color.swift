//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation



extension ColorAsset {
	
	public struct Color : Codable, Hashable {
		
		public var colorSpace:ColorSpace?
		public var components:Components?
		
		var platform:Platform?
		var reference:String?		//like "systemTealColor", "systemPinkColor"
		
		public init(colorSpace: ColorSpace, components: Components) {
			self.colorSpace = colorSpace
			self.components = components
		}
		
		public enum CodingKeys: String, CodingKey {
			case colorSpace = "color-space"
			case platform, reference, components
		}
		
		public enum Platform : String, Codable, Hashable {
			case osx, ios, tvos, watchos, universal
		}
		
	}
	
}



extension ColorAsset.Color {
	
	public struct Components : Codable, Hashable {
		public var alpha:Component?
		public var blue:Component?
		public var green:Component?
		public var red:Component?
		
		public var white:Component?	//only for .grayGamma22, .extendedGray
		
		public init(
			red: Component
			,green: Component
			,blue:Component
			,alpha:Component? = nil
		) {
			self.red = red
			self.green = green
			self.blue = blue
			self.alpha = alpha
		}
		
		public init(white: Component
					,alpha: Component? = nil
		) {
			self.white = white
			self.alpha = alpha
		}
		
	}
	
}
