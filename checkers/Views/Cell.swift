//
//  Cell.swift
//  checkers
//
//  Created by Матвей Можевикин on 28.04.2024.
//

import SwiftUI

struct Cell<Content: View> : View {
	let color: Color
	var bgOpacity: Double = 1
	@ViewBuilder let content: () -> Content
	
	var body: some View {
		HStack {
			content()
		}
			.frame(width: 54, height: 54)
			.background(color)
			.opacity(bgOpacity)
			.padding(0)
	}
}
