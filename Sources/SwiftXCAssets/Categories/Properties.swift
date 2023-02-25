//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation



public struct Properties : Codable {
	public var localizable:Bool?
	
	public init(localizable: Bool? = nil) {
		self.localizable = localizable
	}
}
