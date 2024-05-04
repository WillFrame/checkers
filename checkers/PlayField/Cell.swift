//
//  Cell.swift
//  checkers
//
//  Created by Матвей Можевикин on 28.04.2024.
//

import SwiftUI

struct Cell <Content: View>: View {
	public let isBlackField: Bool
	public var isSelect: Bool
	public var onTap: () -> Void
	public var content: () -> Content
	
	var body: some View {
		HStack {
			content()
		}
		.frame(width: 54, height: 54)
		.background(isSelect ? .red : .clear)
		.opacity(0.7)
		.background(isBlackField ? Color.white : Color.brown)
		.padding(0)
		.onTapGesture(perform: onTap)
	}
}
