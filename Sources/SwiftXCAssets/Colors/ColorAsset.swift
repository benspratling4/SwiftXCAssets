//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation
import System



public struct ColorAsset : Asset {
	
	//has colorset extension
	//has a Contents.json file inside
	public init(path:FilePath) {
		name = path.stem ?? ""
		self.path = path
	}
	
	public var name:String
	
	
	public var contents:Contents? {
		guard let url = URL(filePath: path.appending("Contents.json"))
			,let data = try? Data(contentsOf: url)
			else { return nil }
		return try? JSONDecoder().decode(Contents.self, from: data)
	}
	
	
	//MARK: - Asset
	
	public var path:FilePath
	
}




extension ColorAsset {
	
	public struct Contents : Codable, Hashable {
		
		public var colors:[Wrapper]?
		public var info:Info?
		public var properties:Properties?
		
//		public func bestMatch(
//			idiom:Idiom
//			,subtype:SubType?
//			,displayGamut:DisplayGamut?
//			,appearances:[Appearance]?
//			,locale:String?
//		)->Wrapper? {
//			//TODO: write me
//		}
		
		
		
		
		public init(colors: [Wrapper]? = nil, info: Info? = nil, properties: Properties? = nil) {
			self.colors = colors
			self.info = info
			self.properties = properties
		}
		
	}
	
}

