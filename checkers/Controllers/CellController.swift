//
//  CellController.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.05.2024.
//

import SwiftUI

struct CellController<Content: View>: View {
	let fieldColor: FieldColor
	var isSelected: Bool = false
	var isMovable: Bool = false
	let onTap: () -> Void
	let bgOpacity = 0.5
	@ViewBuilder let content: () -> Content
	
	var bgColor: Color {
		get { isSelected ? .red : isMovable ? .green : .clear }
	}
	
	private var cellColor: Color {
		get {
			fieldColor == .Black ? .brown : .white
		}
	}
	
	var body: some View {
		Cell(color: cellColor, bgOpacity: (isSelected || isMovable) ? bgOpacity : 1) {
			content()
		}
			.background(bgColor)
			.onTapGesture(perform: onTap)
	}
}
