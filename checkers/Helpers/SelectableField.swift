//
//  SelectableField.swift
//  checkers
//
//  Created by Матвей Можевикин on 11.05.2024.
//

import SwiftUI

final class SelectableField: FieldPosition, ObservableObject {
	@Published public private(set) var possibleSelections: Set<Position> = []
	@Published public private(set) var currentChopOptions: Set<ChopConfig> = []
	@Published public private(set) var selectedField: Position? = nil {
		didSet {
			self.possibleSelections = getPossibleSelections()
		}
	}
	
	func selectField(_ position: (Int, Int)) {
		if selectedField == nil && possibleSelections.contains(Position(position: position)) {
			return self.selectedField = Position(position: position)
		}
		
		if let oldSelectedField = selectedField {
			if let checker = self.getPositionData(oldSelectedField.position) {
				if possibleSelections.contains(Position(position: position)) {
					self.selectedField = nil
					return moveChecker(checker, newPosition: position, chopedPos: nil)
				} else {
					let checkers = getSideCheckers(side: turn).reduce(Set<Position>()) { prev, checker in
						var prev = prev
						prev.insert(Position(position: checker.position))
						return prev
					}
					let finalPos = Position(position: position)
					
					if checkers.contains(finalPos) {
						self.selectedField = finalPos
					}
				}
			}
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
		if let selectedField = self.selectedField, let checker = getPositionData(selectedField.position) {
			return getPossibleCheckerMoves(checker)
		} else {
			return getSideCheckers(side: turn).reduce(Set<Position>()) { prev, checker in
				var prev = prev
				prev.insert(Position(position: checker.position))
				return prev
			}
		}
	}
	
	private func moveChecker(_ checker: CheckerState, newPosition: (Int, Int), chopedPos: (Int, Int)?) {
		if let chopedPos = chopedPos {
			deleteChecker(chopedPos)
		} else {
			changeTurn()
		}
		changeCheckerPosition(from: checker.position, to: newPosition)
		self.currentChopOptions = getAllPossibleChops()
	}

	private func getAllPossibleChops() -> Set<ChopConfig> {
		let checkers = getSideCheckers(side: turn)
		
		return checkers.reduce(Set<ChopConfig>()) { prev, checker in
			var prev = prev
			let possibleChops = getPossibleChops(checker)
			
			if !possibleChops.isEmpty {
				prev.insert(ChopConfig(checker: checker, chops: possibleChops))
			}
			
			return prev
		}
	}
	
	private func getPossibleCheckerMoves(_ checker: CheckerState) -> Set<Position> {
		if checker.checkerType == .Checker {
			return getPossibleDefaultCheckerMoves(checker)
		}
		
		return getPossibleQueenMoves(checker)
	}
	
	private func getAllCheckerAroundMoves(_ checker: CheckerState) -> Set<DiagonalPosition> {
		var result = Set<DiagonalPosition>()
		
		for sideDirection in SideDirection.allValues {
			for straightDirection in StraightDirection.allValues {
				result.insert(DiagonalPosition(position: checker.position, direction: (sideDirection, straightDirection)))
			}
		}
		
		return result
	}
	
	private func getPossibleChops(_ checker: CheckerState) -> Set<DiagonalPosition> {
		if checker.checkerType == .Checker {
			return getPossibleDefaultCheckerChops(checker)
		}
		return getPossibleQueenChops(checker)
	}
	
	private func getPossibleDefaultCheckerChops(_ checker: CheckerState) -> Set<DiagonalPosition> {
		getAllCheckerAroundMoves(checker).reduce(Set<DiagonalPosition>()) { prev, position in
			var result = prev
			
			if let currentChecker = self.getPositionData(position.position) {
				if currentChecker.side != checker.side && self.getPositionData(position.getNext().position) == nil {
					result.insert(position.getNext())
				}
			}
			
			return result
		}
	}
	
	private func getPossibleDefaultCheckerMoves(_ checker: CheckerState) -> Set<DiagonalPosition> {
		let moveDirection = sideMoveDirections[checker.side] ?? .Up
		var possibleMoves = Set<DiagonalPosition>()
		
		for item in SideDirection.allValues {
			possibleMoves.insert(DiagonalPosition(position: checker.position, direction: (item, moveDirection)))
		}
		
		return possibleMoves.reduce(Set<DiagonalPosition>()) { prev, position in
			var result = prev
			
			if self.getPositionData(position.position) == nil {
				result.insert(position)
			}
			
			return result
		}
	}
	
	private func getPossibleQueenChops(_ checker: CheckerState) -> Set<DiagonalPosition> {
		return Set<DiagonalPosition>()
	}
	
	private func getPossibleQueenMoves(_ checker: CheckerState) -> Set<DiagonalPosition> {
		return Set<DiagonalPosition>()
	}
}
