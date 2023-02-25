//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation

#if canImport(CoreGraphics)
import CoreGraphics


extension ColorAsset.Color {
	
	//can only use components, not platform / references
	public var cgColor:CGColor? {
		if let colorSpace, let components {
			
			let space: CGColorSpace?
			switch colorSpace {
			case .srgb:
				guard let red = components.red
					,let green = components.green
					,let blue = components.blue
					else { return nil }
				return CGColor(srgbRed: red.cgFloatValue
							   , green: green.cgFloatValue
							   , blue: blue.cgFloatValue
							   , alpha: components.alpha?.cgFloatValue ?? 1.0)
				
			case .displayP3:
				space = CGColorSpace(name: CGColorSpace.displayP3)
				
			case .extendedGray:
				space = CGColorSpace(name: CGColorSpace.extendedGray)
				
			case .extendedLienarSRGB:
				space = CGColorSpace(name: CGColorSpace.extendedLinearSRGB)
				
			case .extendedsRGB:
				space = CGColorSpace(name: CGColorSpace.extendedSRGB)
				
			case .grayGamma22:
				guard let white = components.white else { return nil }
				return CGColor(genericGrayGamma2_2Gray: white.cgFloatValue
							   , alpha:components.alpha?.cgFloatValue ?? 1.0)
			}
			
			guard let space else { return nil }
			
			let componentFloats:[CGFloat]
			switch colorSpace {
			case .grayGamma22, .srgb:
				//already did it above, so this is not reached
				return nil
				
			case .extendedGray:
				guard let white = components.white else { return nil }
				componentFloats = [white.cgFloatValue, components.alpha?.cgFloatValue ?? 1.0]
				
			case .displayP3, .extendedLienarSRGB, .extendedsRGB:
				guard let red = components.red
					,let green = components.green
					,let blue = components.blue
					else { return nil }
				componentFloats = [
					red.cgFloatValue,
					green.cgFloatValue,
					blue.cgFloatValue,
					components.alpha?.cgFloatValue ?? 1.0
				]
			}
			
			return componentFloats.withUnsafeBufferPointer { bufferPointer in
				return CGColor(colorSpace: space, components: bufferPointer.baseAddress!)
			}
		}
		else if let platform, let reference {
			//TODO: write me
			return nil
		}
		else {
			return nil
		}
	}
	
	
	
	public var extendedsRGBCGColor:CGColor? {
		guard let cgColor = self.cgColor else { return nil }
		return cgColor.converted(to: CGColorSpace(name: CGColorSpace.extendedSRGB)!  , intent: .absoluteColorimetric, options: nil)
	}
	
}

#endif
