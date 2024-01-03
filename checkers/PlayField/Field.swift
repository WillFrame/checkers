//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct Field: View {
	private let rows: [GridItem] = Array(repeating: GridItem(.adaptive(minimum: 40), spacing: 0), count: 8)
	
	@State private var currentPlace: (Int, Int) = (0, 0)
	@State private var selectedField: (Int, Int)?
	
	var body: some View {
		VStack {
			GeometryReader { geometry in
				LazyHGrid(rows: rows, spacing: 0) {
					ForEach(0...63, id: \.self) { index in
						let currentRow = index / 8
						let currentColumn = index % 8
						let currentCoordinates = (currentRow, currentColumn)
						let isBlackField = (currentRow + currentColumn) % 2 == 0
						
						HStack() {
							if currentPlace == currentCoordinates {
								Checker(color: .black).padding(2)
							}
						}
						.frame(minWidth: 40, maxWidth: .infinity, minHeight: 40, maxHeight: .infinity)
						.background(selectedField != nil && currentCoordinates == selectedField
							? Color.red
							: nil
						)
						.opacity(0.7)
						.background(isBlackField ? Color.white : Color.brown)
						.padding(0)
						.onTapGesture {selectedField = currentCoordinates}
					}
				}
				.frame(width: geometry.size.width, height: geometry.size.width)
			}
		}
	}
}
