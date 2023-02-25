//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation



public struct Info : Codable, Hashable {
	public var author:String?	//xcode
	public var version:Int?
	public init(author: String? = nil, version: Int? = nil) {
		self.author = author
		self.version = version
	}
}
