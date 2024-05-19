//
//  SelectableField.swift
//  checkers
//
//  Created by Матвей Можевикин on 11.05.2024.
//

import SwiftUI

final class SelectableField: FieldPosition, ObservableObject {
	@Published public private(set) var possibleMoves: Set<Position> = []
	@Published public private(set) var possibleCheckers: Set<CheckerState> = []
	@Published public private(set) var currentChopOptions: Set<ChopConfig> = []
	@Published public private(set) var selectedField: Position? = nil
	@Published private var currentChecker: CheckerState?
	@Published private var isActiveChops = false
	
	func selectField(_ position: (Int, Int)) {
		if let selectedField = selectedField, selectedField.position == position {
			return clearSelections()
		}
		
		if let checker = possibleCheckers.first(where: { $0.position == position }) {
			self.selectedField = Position(position: checker.position)
			self.currentChecker = checker
			if currentChopOptions.isEmpty {
				self.possibleMoves = getPossibleCheckerMoves(checker)
			} else if let options = currentChopOptions.first(where: { $0.checker == currentChecker }) {
				self.possibleMoves = filterPossiblePositions(options.getFieldsAfterChop())
			} else {
				clearPossibleMoves()
			}
			return
		}
		
		print(possibleMoves.map { $0.position })
		
		if possibleMoves.contains(where: { $0.position == position }), let currentChecker = currentChecker {
			var chopedChecker: (Int, Int)?
			
			if let chop = currentChopOptions.first(where: { $0.checker == currentChecker }) {
				let nextPos = Position(position: position)
				let findedChop = chop.chopOptions.first(where: { $0.positionsAfterChop.contains(nextPos) })
				
				chopedChecker = findedChop?.chopItem.position
			}
			
			moveChecker(currentChecker, newPosition: position, chopedPos: chopedChecker)
			
			if chopedChecker == nil {
				self.isActiveChops = false
				return endTurn()
			}
			
			let currentChopOptionals = getAllPossibleChops()
			if !currentChopOptionals.isEmpty {
				return self.isActiveChops = true
			}
			
			return endTurn()
		}
		
		clearSelections()
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
	
	private func clearPossibleMoves() {
		self.possibleMoves.removeAll()
	}
	
	private func clearSelections() {
		clearPossibleMoves()
		self.currentChecker = nil
		return self.selectedField = nil
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
	
	private func moveChecker(_ checker: CheckerState, newPosition: (Int, Int), chopedPos: (Int, Int)? = nil) {
		changeCheckerPosition(from: checker.position, to: newPosition)
		if let chopedPos = chopedPos {
			deleteChecker(chopedPos)
		}
	}

	private func getAllPossibleChops() -> Set<ChopConfig> {
		let checkers = getSideCheckers(side: turn)
		
		return checkers.reduce(Set<ChopConfig>()) { prev, checker in
			var prev = prev
			let possibleChops = getPossibleChops(checker)
			
			if !possibleChops.isEmpty {
				prev.insert(ChopConfig(checker: checker, chops: possibleChops, maximumFieldValue: self.maximumFieldValue))
			}
			
			return prev
		}
	}
	
	private func getPossibleCheckerMoves(_ checker: CheckerState) -> Set<Position> {
		filterPossiblePositions(checker.checkerType == .Checker
			? getPossibleDefaultCheckerMoves(checker)
			: getPossibleQueenMoves(checker)
		)
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
		return (checker.checkerType == .Checker
			? getPossibleDefaultCheckerChops(checker)
				: getPossibleQueenChops(checker)).filter { getIsValidPosition($0.position) }
	}
	
	private func getPossibleDefaultCheckerChops(_ checker: CheckerState) -> Set<DiagonalPosition> {
		getAllCheckerAroundMoves(checker).reduce(Set<DiagonalPosition>()) { prev, position in
			var result = prev
			
			if let currentChecker = self.getPositionData(position.position) {
				let nextItem = position.getNext()
				
				if currentChecker.side != checker.side && getIsValidPosition(nextItem.position) && self.getPositionData(nextItem.position) == nil  {
					result.insert(position)
				}
			}
			
			return result
		}.filter { self.getIsValidPosition($0.position) }
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
	
	private func endTurn() {
		changeTurn()
		clearSelections()
		self.currentChopOptions = getAllPossibleChops()
		self.possibleCheckers = getCurrentSideCheckers()
	}
	
	override init() {
		super.init()
		self.possibleCheckers = getCurrentSideCheckers()
	}
}
