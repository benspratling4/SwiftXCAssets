//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/25/23.
//

import Foundation

public protocol AssetWrapper {
	
	var name:String { get }
	
	var fileWrapper:FileWrapper { get }
	
}
