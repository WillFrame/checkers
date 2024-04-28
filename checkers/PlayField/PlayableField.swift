//
//  PlayableField.swift
//  checkers
//
//  Created by Матвей Можевикин on 14.04.2024.
//

import SwiftUI

struct FieldCoordinates: Hashable {
	var x: Int
	var y: Int
}

class PlayableField {
	@State private var whiteCheckers: Set<FieldCoordinates> = [
		FieldCoordinates(x: 0, y: 0),
		FieldCoordinates(x: 2, y: 0),
		FieldCoordinates(x: 4, y: 0),
		FieldCoordinates(x: 6, y: 0),
		FieldCoordinates(x: 1, y: 1),
		FieldCoordinates(x: 3, y: 1),
		FieldCoordinates(x: 5, y: 1),
		FieldCoordinates(x: 7, y: 1),
		FieldCoordinates(x: 0, y: 2),
		FieldCoordinates(x: 2, y: 2),
		FieldCoordinates(x: 4, y: 2),
		FieldCoordinates(x: 6, y: 2),
	]
	
	@State private var blackCheckers: Set<FieldCoordinates> = [
		FieldCoordinates(x: 1, y: 5),
		FieldCoordinates(x: 3, y: 5),
		FieldCoordinates(x: 5, y: 5),
		FieldCoordinates(x: 7, y: 5),
		FieldCoordinates(x: 0, y: 6),
		FieldCoordinates(x: 2, y: 6),
		FieldCoordinates(x: 4, y: 6),
		FieldCoordinates(x: 6, y: 6),
		FieldCoordinates(x: 1, y: 7),
		FieldCoordinates(x: 3, y: 7),
		FieldCoordinates(x: 5, y: 7),
		FieldCoordinates(x: 7, y: 7),
	]
}
