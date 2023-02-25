//
//  ColorTests.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import XCTest
import System
import SwiftXCAssets
import AppKit


final class ColorTests: XCTestCase {
	
	func newAssetCatalog()->AssetCatalog? {
		guard let url = Bundle.module.url(forResource: "TestAssets", withExtension: "notxcassets")
			,let filePath = FilePath(url)
			else { return nil }
		return AssetCatalog(path:filePath)
	}
	
	func newAssetCatalogWrapper()->AssetCatalogWrapper? {
		guard let url = Bundle.module.url(forResource: "TestAssets", withExtension: "notxcassets")
			,let fileWrapper = try? FileWrapper(url: url)
			else { return nil }
		return AssetCatalogWrapper(fileWrapper: fileWrapper)
	}
	

	func testFindOneColor() throws {
		let assetCatalog:AssetCatalog = try XCTUnwrap(newAssetCatalog())
		let oneColor = try XCTUnwrap(assetCatalog.colors.filter({ $0.name == "one color" }).first)
		let contents = try XCTUnwrap(oneColor.contents)
		
		for color in (contents.colors ?? [] ) {
			let nsColor:NSColor = try XCTUnwrap(color.color.nsColor)
			print(nsColor)
		}
		//TODO: examine the contents for equivalence
	}
	
	
	func testColorWrapper() throws {
		let assetCatalog = try XCTUnwrap(newAssetCatalogWrapper())
		let oneColor = try XCTUnwrap(assetCatalog.colors.filter({ $0.name == "one color" }).first)
		let contents = try XCTUnwrap(oneColor.contents)
		
		for color in (contents.colors ?? [] ) {
			let nsColor:NSColor = try XCTUnwrap(color.color.nsColor)
			print(nsColor)
		}
		
		//TODO: examine the contents for equivalence
		
	}
	
	
	
}
