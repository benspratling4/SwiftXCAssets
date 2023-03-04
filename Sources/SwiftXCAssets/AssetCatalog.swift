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
			else { return nil }
		
		
		func recursiveAssetFinder(_ folderUrl:URL)->[Asset] {
			guard let subFiles = try? fileManager.contentsOfDirectory(at: folderUrl, includingPropertiesForKeys: nil) else { return [] }
			let localColorAssets:[Asset] = subFiles.compactMap({ aUrl in
				if aUrl.pathExtension == "colorset" {
					guard let filePath = FilePath(aUrl) else { return nil }
					return ColorAsset(path: filePath)
				}
				//TODO: images
				//TODO: data
				return nil
			})
			
			//get sub folders
			let subFolders = subFiles.filter({
				return $0.hasDirectoryPath && $0.pathExtension == ""
			})
			
			let subFolderAssets = subFolders.map(recursiveAssetFinder)
			
			
			return localColorAssets + subFolderAssets.reduce([], { $0 + $1 })
		}
		
		assets = recursiveAssetFinder(url)
		
		//TODO: support assets inside of folders
		
		
		
		
		
		
	}
	
	//TODO: support assets in folders
	
	public var assets:[Asset]
	
	public var colors:[ColorAsset] {
		return assets.compactMap({ $0 as? ColorAsset })
	}
	
}
