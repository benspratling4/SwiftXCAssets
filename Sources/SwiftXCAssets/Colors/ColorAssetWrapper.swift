//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/25/23.
//

import Foundation

public struct ColorAssetWrapper : AssetWrapper {
	
	//has colorset extension
	//has a Contents.json file inside
	public init(preferredFileName:String? = nil
				, fileWrapper: FileWrapper) {
		name = preferredFileName
			?? fileWrapper.filename?.withoutSuffix(".colorset")
			?? ""
		self.fileWrapper = fileWrapper
	}
	
	public var name:String
	
	public var contents:ColorAsset.Contents? {
		guard fileWrapper.isDirectory
			,let contentsWrapper = fileWrapper.fileWrappers?["Contents.json"]
			,contentsWrapper.isRegularFile
			,let data = contentsWrapper.regularFileContents
			else { return nil }
		return try? JSONDecoder().decode(ColorAsset.Contents.self, from: data)
	}
	
	
	//MARK: - Asset
	
	public var fileWrapper: FileWrapper
	
}
