//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation

#if canImport(AppKit)
import AppKit


extension ColorAsset.Color {

	//returns a named color if the things is a named color
	var namedNSColor:NSColor? {
		guard let platform, let reference else { return  nil }
		switch platform {
		case .osx, .universal:
			
			guard let colorList = NSColorList.availableColorLists
				.filter({ $0.name == "System" })
				.first
			else { return nil }
			return colorList.color(withKey: reference)
			
		default:
			//not sure what to do here?
			return nil
		}
	}
}

#endif


#if canImport(CoreGraphics) && canImport(AppKit)
import CoreGraphics
import AppKit

extension ColorAsset.Color {
	
	public var nsColor:NSColor? {
		if let named = namedNSColor {
			return named
		}
		else if let color:CGColor = self.cgColor {
			return NSColor(cgColor: color)
		}
		else {
			return nil
		}
	}
	
}

#endif

