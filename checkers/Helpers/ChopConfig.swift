//
//  ChopConfig.swift
//  checkers
//
//  Created by Матвей Можевикин on 18.05.2024.
//

class ChopConfig: Hashable {
	var checker: CheckerState
	var chops: Set<DiagonalPosition> // позиции на которых будут стоять шашки, возможные к срублению
	
	static func == (lhs: ChopConfig, rhs: ChopConfig) -> Bool {
		lhs.checker == rhs.checker
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine("\(checker.position.0) \(checker.position.1)")
	}
	
	init(checker: CheckerState, chops: Set<DiagonalPosition>) {
		self.checker = checker
		self.chops = chops
	}
}
