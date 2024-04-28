//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct Field: View {
	private let rows: [GridItem] = Array(repeating: GridItem(), count: 8)
	
	@State private var currentPlace: (Int, Int) = (0, 0)
	@State private var selectedField: (Int, Int)? = (0, 0)
	@State private var checkersPosition: PlayableField = PlayableField()
	
	var body: some View {
		VStack(spacing: 0) {
			ForEach(0...7, id: \.self) { i in
				let currentRow = i;
				
				HStack(spacing: 0) {
					ForEach(0...7, id: \.self) { j in
						let currentColumn = j % 8
						let currentCoordinates = (currentRow, currentColumn)
						let isBlackField = (currentRow + currentColumn) % 2 == 0
						@State var isSelect: Bool = {
							if let selectedField = selectedField {
								return currentCoordinates == selectedField
							} else {
								return false
							}
						}()

						Cell(isBlackField: isBlackField, isSelect: isSelect, onTap: {
							self.selectedField = currentCoordinates
						}) {
							CheckerModel(color: isBlackField ? .white : .black)
						}
					}
				}
			}
		}
	}
}
