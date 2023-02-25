//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation



public enum Idiom:String, Codable, Hashable {
	case universal, iphone, ipad, car, mac, watch, tv
}

//idiom would need to be .ipad
public enum SubType:String, Codable, Hashable {
	case macCatalyst = "mac-catalyst"
}
