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
	
	var assetCatalog:AssetCatalog?
	
    override func setUpWithError() throws {
		guard let url = Bundle.module.url(forResource: "TestAssets", withExtension: "notxcassets")
			,let filePath = FilePath(url)
			else { return }
		assetCatalog = AssetCatalog(path:filePath)
    }


	func testFindOneColor() throws {
		guard let assetCatalog else {
			XCTFail("couldn't load asset catalog")
			return
		}
		let oneColor = try XCTUnwrap(assetCatalog.colors.filter({ $0.name == "one color" }).first)
		let contents = try XCTUnwrap(oneColor.contents)
		
		for color in (contents.colors ?? [] ) {
			let nsColor:NSColor = try XCTUnwrap(color.color.nsColor)
			print(nsColor)
		}
		
		
		//TODO: examine the contents for equivalence
		
	}
	
}
