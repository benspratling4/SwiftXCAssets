//
//  File.swift
//  
//
//  Created by Ben Spratling on 2/24/23.
//

import Foundation
import System


public protocol Asset {
	
	var name:String { get }
	
	var path:FilePath { get }
	
}
