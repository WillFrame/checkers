//
//  ChopConfig.swift
//  checkers
//
//  Created by Матвей Можевикин on 18.05.2024.
//

class ChopConfig: Hashable {
	public private(set) var checker: CheckerState
	public private(set) var chops: Set<DiagonalPosition> // позиции на которых будут стоять шашки, возможные к срублению
	public private(set) var chopOptions: Set<ChopItem>
	private var maximumFieldValue: Int
	public private(set) var countPossibleFieldsAfterChop: Int
	
	func getFieldsAfterChop() -> Set<Position> {
		chopOptions.reduce(Set<Position>()) { $0.union($1.positionsAfterChop) }
	}
	
	func hash(into hasher: inout Hasher) {
		hasher.combine("\(checker.position.0) \(checker.position.1)")
	}
	
	static func == (lhs: ChopConfig, rhs: ChopConfig) -> Bool {
		lhs.checker == rhs.checker
	}
	
	init(checker: CheckerState, chops: Set<DiagonalPosition>, maximumFieldValue: Int, countPossibleFieldsAfterChop: Int = 1) {
		let resultCountPossibleFieldsAfterChop = countPossibleFieldsAfterChop <= 6 ? countPossibleFieldsAfterChop : 6
		
		self.checker = checker
		self.chops = chops
		self.maximumFieldValue = maximumFieldValue
		self.countPossibleFieldsAfterChop = resultCountPossibleFieldsAfterChop
		self.chopOptions = chops.reduce(Set<ChopItem>()) { prev, next in
			var prev = prev
			prev.insert(ChopItem(chopItem: next, maximumFieldValue: maximumFieldValue, countPossibleFieldsAfterChop: resultCountPossibleFieldsAfterChop))
			return prev
		}
	}
}
