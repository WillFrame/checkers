//
//  DiagonalPosition.swift
//  checkers
//
//  Created by Матвей Можевикин on 11.05.2024.
//

class DiagonalPosition: Position {
	let direction: (SideDirection, StraightDirection)

	var sideModify: Int {
		get { direction.0 == .Right ? 1 : -1 }
	}
	
	var straightModify: Int {
		get { direction.1 == .Down ? 1 : -1 }
	}
	
	func setNext() {
		self.changePosition(position.0 + sideModify, position.1 + straightModify)
	}
	
	func getNext() -> DiagonalPosition {
		DiagonalPosition(position: position, direction: direction)
	}
	
	init(position: (Int, Int), direction: (SideDirection, StraightDirection)) {
		self.direction = direction
		super.init(
			position: (
				position.0 + (direction.0 == .Right ? 1 : -1),
				position.1 + (direction.1 == .Down ? 1 : -1)
			)
		)
	}
}
