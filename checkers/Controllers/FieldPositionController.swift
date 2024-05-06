//
//  FieldPositionController.swift
//  checkers
//
//  Created by Матвей Можевикин on 14.04.2024.
//

import SwiftUI

let startPosition: Set<CheckerStateController> = [
	CheckerStateController(position: (1, 0), side: .Black),
	CheckerStateController(position: (3, 0), side: .Black),
	CheckerStateController(position: (5, 0), side: .Black),
	CheckerStateController(position: (7, 0), side: .Black),
	CheckerStateController(position: (0, 1), side: .Black),
	CheckerStateController(position: (2, 1), side: .Black),
	CheckerStateController(position: (4, 1), side: .Black),
	CheckerStateController(position: (6, 1), side: .Black),
	CheckerStateController(position: (1, 2), side: .Black),
	CheckerStateController(position: (3, 2), side: .Black),
	CheckerStateController(position: (5, 2), side: .Black),
	CheckerStateController(position: (7, 2), side: .Black),

	CheckerStateController(position: (0, 5), side: .White),
	CheckerStateController(position: (2, 5), side: .White),
	CheckerStateController(position: (4, 5), side: .White),
	CheckerStateController(position: (6, 5), side: .White),
	CheckerStateController(position: (1, 6), side: .White),
	CheckerStateController(position: (3, 6), side: .White),
	CheckerStateController(position: (5, 6), side: .White),
	CheckerStateController(position: (7, 6), side: .White),
	CheckerStateController(position: (0, 7), side: .White),
	CheckerStateController(position: (2, 7), side: .White),
	CheckerStateController(position: (4, 7), side: .White),
	CheckerStateController(position: (6, 7), side: .White),
]

class FieldPositionController: ObservableObject {
	@Published private var checkersConfig: Set<CheckerStateController> = startPosition
	
	func getCellData(_ x: Int, _ y: Int) -> CheckerStateController? {
		checkersConfig.first { $0.position.0 == x && $0.position.1 == y }
	}
	
	func changeCheckerPosition(from startPos: (Int, Int), to EndPos: (Int, Int)) {
		let (xStart, yStart) = startPos
		let (xEnd, yEnd) = EndPos
		
		if let checkerConfig = getCellData(xStart, yStart) {
			return checkerConfig.changePosition(xEnd, yEnd)
		}
	}
	
	func getPossibleMoves(_ x: Int, _ y: Int) -> Void {
		return
	}
	
	func deleteChecker(_ x: Int, _ y: Int) {
		if let checkerConfig = getCellData(x, y) {
			checkersConfig.remove(checkerConfig)
		}
	}
}
