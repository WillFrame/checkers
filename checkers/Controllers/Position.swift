//
//  Position.swift
//  checkers
//
//  Created by Матвей Можевикин on 07.05.2024.
//

class Position: Hashable {
	var position: (Int, Int)
	
	func getPosition() -> (Int, Int) {
		position
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine("\(position.0) \(position.1)")
	}
	
	static func == (lhs: Position, rhs: Position) -> Bool {
		return lhs.position.0 == rhs.position.0 && lhs.position.1 == rhs.position.1
	}
	
	func changePosition(_ x: Int, _ y: Int) {
		self.position = (x, y)
	}
	
	init(position: (Int, Int)) {
		self.position = position
	}
}
