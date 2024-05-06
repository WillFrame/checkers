//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct Field: View {
	@State private var selectedField: (Int, Int)?
	@StateObject private var fieldPositions = FieldPositionController()
	
	var body: some View {
		VStack(spacing: 0) {
			ForEach(0...7, id: \.self) { i in
				let currentRow = i;
				
				HStack(spacing: 0) {
					ForEach(0...7, id: \.self) { j in
						let currentColumn = j % 8
						let cellCoordinates = (currentColumn, currentRow)
						let isBlackField = (currentColumn + currentRow) % 2 == 1
						let checkerConfig = fieldPositions.getCellData(currentColumn, currentRow)
						let isSelected: Bool = selectedField != nil
							? cellCoordinates == selectedField!
							: false

						CellController(fieldColor: isBlackField ? .Black : .White, isSelected: isSelected, onTap: {
							if let selectField = selectedField {
								if selectField == cellCoordinates {
									return self.selectedField = nil
								}
								
								if fieldPositions.getCellData(selectField.0, selectField.1) != nil {
									fieldPositions.changeCheckerPosition(from: selectField, to: cellCoordinates)
									return self.selectedField = nil
								}
							}
							
							self.selectedField = cellCoordinates
						}) {
							if checkerConfig != nil {
								CheckerController(side: checkerConfig!.side, type: checkerConfig!.checkerType)
									.padding(4)
							}
						}
					}
				}
			}
		}
	}
}
