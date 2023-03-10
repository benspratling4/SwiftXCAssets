//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation


public struct Appearance : Codable, Hashable {
	public var appearance:Appearance
	public var value:Value
	
	public init(appearance: Appearance, value: Value) {
		self.appearance = appearance
		self.value = value
	}
	
	public enum Appearance : String, Codable, Hashable {
		case luminosity
		case contrast
	}
	
	public enum Value : String, Codable, Hashable {
		//default light
		case dark, light
		
		//default low
		case high, low
	}
}
