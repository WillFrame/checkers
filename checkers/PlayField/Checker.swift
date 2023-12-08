//
//  Checker.swift
//  checkers
//
//  Created by Матвей Можевикин on 09.12.2023.
//

import SwiftUI

struct Checker: View {
	let color: Color;
	
	var body: some View {
		HStack() {
			Circle()
				.fill(color)
				.background(Circle().foregroundColor(color))
				.padding(1)
				.background(Circle().foregroundColor(.gray))
				.padding(4)
				.background(Circle().foregroundColor(color))
				.padding(1)
				.background(Circle().foregroundColor(.gray))
				.padding(2)
				.background(Circle().foregroundColor(color))
				.frame(maxWidth: .infinity, maxHeight: .infinity)
		}
	}
}
