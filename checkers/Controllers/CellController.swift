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
	var isSelectPossible: Bool = false
	let onTap: () -> Void
	let bgOpacity = 0.5
	@ViewBuilder let content: () -> Content
	
	private var cellColor: Color {
		get {
			fieldColor == .Black ? .brown : .white
		}
	}
	
	var body: some View {
		Cell(color: cellColor, bgOpacity: (isSelected || isSelectPossible) ? bgOpacity : 1) {
			content()
		}
			.background(isSelected
							? .red
							: isSelectPossible
								? .green
								: .clear
			)
			.onTapGesture(perform: onTap)
	}
}
