//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation


extension ColorAsset {
	
	public struct Wrapper : Codable {
		public var idiom:Idiom
		public var color:Color
		public var subtype:SubType?
		public var appearances:[Appearance]?
		public var displayGamut:DisplayGamut?
		public var locale:String?
		
		public init(idiom: Idiom, color: Color, subtype: SubType? = nil, appearances: [Appearance]? = nil, displayGamut: DisplayGamut? = nil, locale: String? = nil) {
			self.idiom = idiom
			self.color = color
			self.subtype = subtype
			self.appearances = appearances
			self.displayGamut = displayGamut
			self.locale = locale
		}
		
		
		public enum CodingKeys:String,  CodingKey {
			case idiom
			case color
			case subtype
			case appearances
			case displayGamut = "display-gamut"
		}
	}
}
