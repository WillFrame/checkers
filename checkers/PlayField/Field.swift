//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct Field: View {
	@State private var colors: [Color] = [.red, .blue, .purple, .yellow,
										  .black, .indigo, .cyan, .brown,
										  .mint, .orange
	]
	
	private let rows: [GridItem] = Array(repeating: GridItem(.flexible()), count: 8)
	
	@State private var draggingItem: Color?
	
	var body: some View {
		ScrollView(.vertical) {
			LazyHGrid(rows: rows, spacing: 0) {
				ForEach(1...64, id: \.self) { index in
					let isBlack = ((index / 8) + (index % 2)) % 2 == 0
					
					HStack() {
						Checker(color: isBlack ? Color.black : Color.white)
							.padding(2)
					}
					.background(isBlack ? Color.white : Color.brown)
					.padding(0)
				}
			}
//			HStack(spacing: 0) {
//				ForEach ((1...8), id: \.self) { hId in
//					VStack(spacing: 0) {
//						ForEach ((1...8), id: \.self) { vId in
//							if (vId + hId) % 2 == 1 {
//								HStack() {
//									Checker(color: .black)
//										.padding(2)
//								}
//								.frame(width: 50, height: 50)
//								.background(.white)
//								.padding(0)
//							} else {
//								HStack() {
//									Checker(color: .white)
//										.padding(2)
//								}
//								.frame(width: 50, height: 50)
//								.background(.brown)
//								.padding(0)
//							}
//						}
//					}
//				}
//			}
//			HStack {
//				let columns = Array(repeating: GridItem(spacing: 10), count: 3)
//				LazyVGrid(columns: columns, spacing: 10, content: {
//					ForEach(colors, id: \.self) { color in
//						GeometryReader {
//							let size = $0.size
//							
//							RoundedRectangle(cornerRadius: 10)
//								.fill(color.gradient)
//								.draggable(color) {
//									RoundedRectangle(cornerRadius: 10)
//										.fill(.ultraThinMaterial)
//										.frame(width: size.width, height: size.height)
//								}
//								.dropDestination(for: Color.self) { items, location in
//									draggingItem = nil
//									return false
//								} isTargeted: { status in
//									if let draggingItem, status, draggingItem != color {
//										if let sourceIndex = colors.firstIndex(of: draggingItem),
//										   let destinationIndex = colors.firstIndex(of: color) {
//											withAnimation(.bouncy) {
//												let sourceItem = colors.remove(at: sourceIndex)
//												colors.insert(sourceItem, at: destinationIndex)
//											}
//										}
//									}
//								}
//						}
//						.frame(height: 100)
//					}
//				})
//				.padding(15)
//			}
		}
	}
}
