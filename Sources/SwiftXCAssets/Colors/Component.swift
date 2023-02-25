//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation
import SwiftPatterns


extension ColorAsset.Color.Components {
	
	public enum Component : Codable, Equatable, Hashable {
		case float(Float)
		case integer(Int)
		case hexByte(UInt8)
		
		
		//MARK: - Codable
		
		public func encode(to encoder: Encoder) throws {
			var container = encoder.singleValueContainer()
			
			switch self {
			case .integer(let value):
				try container.encode("\(value)")
				
			case .float(let value):
				try container.encode("\(value)")
				
			case .hexByte(let value):
				try container.encode("0x" + Data([value]).hexEncodedString())
			}
		}
		
		public init(from decoder: Decoder) throws {
			let container = try decoder.singleValueContainer()
			let stringValue = try container.decode(String.self)
			let interpretableValue = stringValue.replacingOccurrences(of: ",", with: "")
			if let hexDigits = interpretableValue.withoutPrefix("0x") {
				//it's hex
				guard let value = UInt8(hexDigits, radix: 16) else {
					throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Value was not recognizable as a hexadecimal 8-bit number"))
				}
				self = .hexByte(value)
			}
			else if interpretableValue.contains(".") {
				//it's a float
				guard let value = Float(interpretableValue) else {
					throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Value was not recognizable as a floating point number"))
				}
				self = .float(value)
			}
			else {
				// it's an integer from 0...255
				guard let value = Int(interpretableValue) else {
					throw DecodingError.dataCorrupted(.init(codingPath: decoder.codingPath, debugDescription: "Value was not recognizable as an unsigned 8-bit byte"))
				}
				self = .integer(value)
			}
		}
		
	}
	
}
