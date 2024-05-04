//
//  CheckerController.swift
//  checkers
//
//  Created by Матвей Можевикин on 28.04.2024.
//

import SwiftUI

enum Side {
	case Black
	case White
}

enum CheckerType {
	case Checker
	case Queen
}

struct CheckerController: View {
	let side: Side
	let type: CheckerType
	var color: Color {
		get {
			side == .White ? .white : .black
		}
	}
	
	var body: some View {
		if type == .Checker {
			Checker(color: color)
				.padding(4)
		} else {
			EmptyView()
		}
	}
}
