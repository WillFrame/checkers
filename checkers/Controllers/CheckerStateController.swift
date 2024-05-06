//
//  CheckerStateController.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.05.2024.
//

import SwiftUI

class CheckerStateController: Position {
	var checkerType: CheckerType = .Checker
	let side: Side
	
	func evolve() -> Void? {
		if checkerType == .Queen {
			return nil
		}
		
		return self.checkerType = .Queen
	}
	
	init(position: (Int, Int), side: Side, checkerType: CheckerType) {
		self.checkerType = checkerType
		self.side = side
		super.init(position: position)
	}
	
	init(position: (Int, Int), side: Side) {
		self.side = side
		super.init(position: position)
	}
}
