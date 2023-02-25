//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/25/23.
//

import Foundation



public struct AssetCatalogWrapper {
	
	public init?(fileWrapper:FileWrapper) {
		guard fileWrapper.isDirectory else { return nil }
		
		assets = fileWrapper.fileWrappers?
			.compactMap({ (preferredFileName, childFileWrapper) in
				guard childFileWrapper.isDirectory else { return nil }
				if childFileWrapper.isDirectory
					,let fileName = preferredFileName.withoutSuffix(".colorset") {
					return ColorAssetWrapper(preferredFileName:fileName
											 ,fileWrapper: childFileWrapper)
				}
				//TODO: support images
				//TODO: support other kinds
				return nil
			})
		?? []
	}
	
	public var assets:[AssetWrapper]
	
	public var colors:[ColorAssetWrapper] {
		return assets.compactMap({ $0 as? ColorAssetWrapper })
	}
	
}
