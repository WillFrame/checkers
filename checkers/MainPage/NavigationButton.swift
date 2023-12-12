//
//  NavigationButton.swift
//  checkers
//
//  Created by Матвей Можевикин on 06.12.2023.
//

import SwiftUI

struct NavigationButton: View {
	public let title: String
	public let action: () -> Void
	
	var body: some View {
		Button(action: action) {
			Text(title)
				.frame(width: 160, height: 20)
				.padding(.vertical, 15)
				.padding(.horizontal, 30)
				.background(.brown)
				.cornerRadius(20)
				.foregroundStyle(.black)
		}
	}
}
