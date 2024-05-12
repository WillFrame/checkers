//
//  Turn.swift
//  checkers
//
//  Created by Матвей Можевикин on 11.05.2024.
//

class Turn {
	public private(set) var turn: Side = .White
	
	func changeTurn() {
		if self.turn == .Black {
			return self.turn = .White
		}
		
		return self.turn = .Black
	}
}
