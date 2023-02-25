//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation
import System



//TODO: something about representing and saving the asset catalog itself

public struct AssetCatalog {
	
	public var path:FilePath
	
	public init?(path:FilePath) {
		self.path = path
		let fileManager = FileManager()
		guard let url = URL(filePath: path)
			,let subFiles = try? fileManager.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
			else { return nil }
		
		assets = subFiles.compactMap({ aUrl in
			if aUrl.pathExtension == "colorset" {
				guard let filePath = FilePath(aUrl) else { return nil }
				return ColorAsset(path: filePath)
			}
			//TODO: images
			//TODO: data
			return nil
		})
	}
	
	//TODO: support assets in folders
	
	public var assets:[Asset]
	
	public var colors:[ColorAsset] {
		return assets.compactMap({ $0 as? ColorAsset })
	}
	
}
