//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct Field: View {
	@StateObject private var fieldPositions = SelectableField()
	
	var body: some View {
		VStack {
			Text("Ход \(fieldPositions.turn == .Black ? "черных" : "белых")")
				.font(.title)
			VStack(spacing: 0) {
				ForEach(0...7, id: \.self) { currentRow in
					HStack(spacing: 0) {
						ForEach(0...7, id: \.self) { currentColumn in
							let position = (currentColumn, currentRow)
							let isBlackField = fieldPositions.getIsPosibleField(position)
							let checkerConfig = fieldPositions.getPositionData(position)
							let isSelected: Bool = fieldPositions.getIsSelectedField(position)
							let isSelectPossible: Bool = fieldPositions.selectedField != nil && fieldPositions.getIsSelectPossible(position)
							
							CellController(
								fieldColor: isBlackField ? .Black : .White,
								isSelected: isSelected,
								isSelectPossible: isSelectPossible,
								onTap: {
									if isBlackField {
										fieldPositions.selectField(position)
									}
	//								withAnimation(.default) {
//									print(fieldPositions.possibleSelections.map { $0.position })
	//								}
								}
							) {
								if let checkerConfig = checkerConfig {
									CheckerController(side: checkerConfig.side, type: checkerConfig.checkerType)
										.padding(4)
//										.transition(.offset(x: 0, y: 400))
								}
							}
						}
					}
				}
			}
		}
	}
}
