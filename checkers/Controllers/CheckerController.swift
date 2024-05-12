//
//  CheckerController.swift
//  checkers
//
//  Created by Матвей Можевикин on 28.04.2024.
//

import SwiftUI

struct CheckerController: View {
	let side: Side
	var type: CheckerType
	var color: Color {
		get {
			side == .White ? .white : .black
		}
	}
	
	var body: some View {
		if type == .Checker {
			Checker(color: color)
		} else {
			EmptyView()
		}
	}
}
