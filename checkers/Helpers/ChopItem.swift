//
//  ChopItem.swift
//  checkers
//
//  Created by Матвей Можевикин on 19.05.2024.
//

class ChopItem: Hashable {
	var chopItem: DiagonalPosition
	private var maximumFieldValue: Int
	var countPossibleFieldsAfterChop: Int
	
	var positionsAfterChop: Set<Position> {
		var result = Set<Position>()
		var tmpPos = chopItem
		
		for _ in 0...(countPossibleFieldsAfterChop - 1) {
			result.insert(tmpPos.getNext())
			tmpPos = tmpPos.getNext()
		}
		
		return result.filter { getPositionPossible($0.position) }
	}
	
	func getPositionPossible(_ position: (Int, Int)) -> Bool {
		position.0 <= maximumFieldValue && position.1 <= maximumFieldValue && position.0 >= 0 && position.1 >= 0
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine("\(chopItem.position.0) \(chopItem.position.1) \(chopItem.direction))")
	}
	
	static func == (lhs: ChopItem, rhs: ChopItem) -> Bool {
		lhs.chopItem == rhs.chopItem && lhs.positionsAfterChop == rhs.positionsAfterChop
	}
	
	init(chopItem: DiagonalPosition, maximumFieldValue: Int, countPossibleFieldsAfterChop: Int) {
		self.chopItem = chopItem
		self.maximumFieldValue = maximumFieldValue
		self.countPossibleFieldsAfterChop = countPossibleFieldsAfterChop
	}
}
