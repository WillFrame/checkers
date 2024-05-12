//
//  SelectableField.swift
//  checkers
//
//  Created by Матвей Можевикин on 11.05.2024.
//

import SwiftUI

final class SelectableField: FieldPosition, ObservableObject {
	@Published public private(set) var possibleSelections: Set<Position> = []
	@Published public private(set) var selectedField: Position? = nil {
		didSet {
			self.possibleSelections = getPossibleSelections()
		}
	}
	
	func selectField(_ position: (Int, Int)) {
		if selectedField == nil {
			return self.selectedField = Position(position: position)
		}
		
		if turn == .Black {
			
		}
		
		self.selectedField = nil
	}
	
	func getIsPosibleField(_ position: (Int, Int)) -> Bool {
		(position.0 + position.1) % 2 == 1
	}
	
	func getIsSelectedField(_ position: (Int, Int)) -> Bool {
		if let selectedField = self.selectedField {
			return position == selectedField.position
		}
		
		return false
	}
	
	func getIsSelectPossible(_ position: (Int, Int)) -> Bool {
		self.possibleSelections.contains { $0.position == position }
	}
	
	private func getPossibleSelections() -> Set<Position> {
		if let selectedField = self.selectedField {
			return getPossibleCheckerMoves(self.getPositionData(selectedField.position)!)
		} else {
			return getSideCheckers(side: turn)
		}
	}
	
	private func getPossibleCheckerMoves(_ checker: CheckerState) -> Set<Position> {
		if checker.checkerType == .Checker {
			return getPossibleDefaultCheckerMoves(checker)
		} else {
			return getPossibleQueenMoves(checker)
		}
	}
	
	private func getPossibleDefaultCheckerMoves(_ checker: CheckerState) -> Set<Position> {
		let moveDirection = sideMoveDirections[checker.side] ?? .Up
		
		let posibleMoves: Set<DiagonalPosition> = [
			DiagonalPosition(position: checker.position, direction: (.Left, moveDirection)),
			DiagonalPosition(position: checker.position, direction: (.Right, moveDirection)),
		]
		
		return posibleMoves.reduce(Set<DiagonalPosition>()) { prev, position in
			var result = prev
			
			if let currentChecker = self.getPositionData(position.position) {
				if currentChecker.side != checker.side && self.getPositionData(position.getNext().position) == nil {
					result.insert(position.getNext())
				}
			} else {
				result.insert(position)
			}
			
			return result
		}
	}
	
	private func getPossibleQueenMoves(_ checker: CheckerState) -> Set<Position> {
		return Set<Position>()
	}
}

