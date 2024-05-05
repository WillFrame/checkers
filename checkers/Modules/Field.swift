//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct Field: View {
	@State private var selectedField: (Int, Int)? = (0, 0)
	@State private var checkersPositions = CheckerPositionsController()
	
	var body: some View {
		VStack(spacing: 0) {
			ForEach(0...7, id: \.self) { i in
				let currentRow = i;
				
				HStack(spacing: 0) {
					ForEach(0...7, id: \.self) { j in
						let currentColumn = j % 8
						let currentCoordinates = (currentRow, currentColumn)
						let isBlackField = (currentRow + currentColumn) % 2 == 0
						let checkerConfig = checkersPositions.getCellData(x: currentColumn, y: currentRow) ?? CheckerControllerConfig(x: 0, y: 0, checkerType: .Queen, side: .White)
						let isSelected: Bool = selectedField != nil
							? currentCoordinates == selectedField!
							: false

						CellController(fieldColor: isBlackField ? .Black : .White, isSelected: isSelected, onTap: {
							self.selectedField = currentCoordinates
						}) {
							CheckerController(side: checkerConfig.side, type: checkerConfig.checkerType)
								.padding(4)
						}
					}
				}
			}
		}
	}
}
