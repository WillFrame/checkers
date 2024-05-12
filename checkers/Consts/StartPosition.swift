//
//  StartPosition.swift
//  checkers
//
//  Created by Матвей Можевикин on 11.05.2024.
//

let startPosition: Set<CheckerState> = [
	CheckerState(position: (1, 0), side: .Black),
	CheckerState(position: (3, 0), side: .Black),
	CheckerState(position: (5, 0), side: .Black),
	CheckerState(position: (7, 0), side: .Black),
	CheckerState(position: (0, 1), side: .Black),
	CheckerState(position: (2, 1), side: .Black),
	CheckerState(position: (4, 1), side: .Black),
	CheckerState(position: (6, 1), side: .Black),
	CheckerState(position: (1, 2), side: .Black),
	CheckerState(position: (3, 2), side: .Black),
	CheckerState(position: (5, 2), side: .Black),
	CheckerState(position: (7, 2), side: .Black),

	CheckerState(position: (0, 5), side: .White),
	CheckerState(position: (2, 5), side: .White),
	CheckerState(position: (4, 5), side: .White),
	CheckerState(position: (6, 5), side: .White),
	CheckerState(position: (1, 6), side: .White),
	CheckerState(position: (3, 6), side: .White),
	CheckerState(position: (5, 6), side: .White),
	CheckerState(position: (7, 6), side: .White),
	CheckerState(position: (0, 7), side: .White),
	CheckerState(position: (2, 7), side: .White),
	CheckerState(position: (4, 7), side: .White),
	CheckerState(position: (6, 7), side: .White),
]
