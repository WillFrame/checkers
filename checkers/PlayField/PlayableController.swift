//
//  PlayableController.swift
//  checkers
//
//  Created by Матвей Можевикин on 14.04.2024.
//

import SwiftUI

struct CheckerControllerConfig: Hashable {
	var x: Int
	var y: Int
	var checkerType: CheckerType = .Checker
	let side: Side
}

let startPosition: Set<CheckerControllerConfig> = [
	CheckerControllerConfig(x: 0, y: 0, side: .White),
	CheckerControllerConfig(x: 2, y: 0, side: .White),
	CheckerControllerConfig(x: 4, y: 0, side: .White),
	CheckerControllerConfig(x: 6, y: 0, side: .White),
	CheckerControllerConfig(x: 1, y: 1, side: .White),
	CheckerControllerConfig(x: 3, y: 1, side: .White),
	CheckerControllerConfig(x: 5, y: 1, side: .White),
	CheckerControllerConfig(x: 7, y: 1, side: .White),
	CheckerControllerConfig(x: 0, y: 2, side: .White),
	CheckerControllerConfig(x: 2, y: 2, side: .White),
	CheckerControllerConfig(x: 4, y: 2, side: .White),
	CheckerControllerConfig(x: 6, y: 2, side: .White),

	CheckerControllerConfig(x: 1, y: 5, side: .Black),
	CheckerControllerConfig(x: 3, y: 5, side: .Black),
	CheckerControllerConfig(x: 5, y: 5, side: .Black),
	CheckerControllerConfig(x: 7, y: 5, side: .Black),
	CheckerControllerConfig(x: 0, y: 6, side: .Black),
	CheckerControllerConfig(x: 2, y: 6, side: .Black),
	CheckerControllerConfig(x: 4, y: 6, side: .Black),
	CheckerControllerConfig(x: 6, y: 6, side: .Black),
	CheckerControllerConfig(x: 1, y: 7, side: .Black),
	CheckerControllerConfig(x: 3, y: 7, side: .Black),
	CheckerControllerConfig(x: 5, y: 7, side: .Black),
	CheckerControllerConfig(x: 7, y: 7, side: .Black),
]

class PlayableController {
	@State private var checkersConfig: Set<CheckerControllerConfig> = startPosition
	
	func getPositions() -> Set<CheckerControllerConfig> {
		checkersConfig
	}
	
	func getCellData(x: Int, y: Int) -> CheckerControllerConfig? {
		checkersConfig.first { $0.x == x && $0.y == y }
	}
}
