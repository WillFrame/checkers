//
//  FieldPosition.swift
//  checkers
//
//  Created by Матвей Можевикин on 14.04.2024.
//

class FieldPosition: Turn {
	private var checkersConfig: Set<CheckerState> = startPosition
	
	public let maximumFieldValue = 7
	public let sideMoveDirections: [Side: StraightDirection] = [
		.White: .Up,
		.Black: .Down,
	]
	
	func getPositionData(_ position: (Int, Int)) -> CheckerState? {
		checkersConfig.first { $0.position.0 == position.0 && $0.position.1 == position.1 }
	}
	
	func changeCheckerPosition(from startPos: (Int, Int), to EndPos: (Int, Int)) {
		let (xStart, yStart) = startPos
		let (xEnd, yEnd) = EndPos
		
		if let checkerConfig = getPositionData((xStart, yStart)) {
			return checkerConfig.changePosition(xEnd, yEnd)
		}
	}
	
	func getSideCheckers(side: Side) -> Set<CheckerState> {
		checkersConfig.reduce(Set<CheckerState>()) { prev, checker in
			var result = prev
			
			if checker.side == side {
				result.insert(checker)
			}
			
			return result
		}
	}
	
	func getCurrentSideCheckers() -> Set<CheckerState> {
		getSideCheckers(side: turn)
	}
	
	func deleteChecker(_ position: (Int, Int)) {
		if let checkerConfig = getPositionData(position) {
			checkersConfig.remove(checkerConfig)
		}
	}
	
	func getIsValidPosition(_ position: (Int, Int)) -> Bool {
		position.0 <= maximumFieldValue && position.1 <= maximumFieldValue && position.0 >= 0 && position.1 >= 0
	}
}
