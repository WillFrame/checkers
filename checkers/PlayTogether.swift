//
//  PlayTogether.swift
//  checkers
//
//  Created by Матвей Можевикин on 05.12.2023.
//

import SwiftUI

struct PlayTogether: View {
	var body: some View {
		HStack(spacing: 0) {
			ForEach ((1...8), id: \.self) { hId in
				VStack(spacing: 0) {
					ForEach ((1...8), id: \.self) { vId in
						if (vId + hId) % 2 == 1 {
							Text("")
								.frame(width: 50, height: 50)
								.background(.white)
								.padding(0)
						} else {
							Text("")
								.frame(width: 50, height: 50)
								.background(.brown)
								.padding(0)
						}
					}
				}
			}
		}
	}
}
