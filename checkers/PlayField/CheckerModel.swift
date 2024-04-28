//
//  CheckerModel.swift
//  checkers
//
//  Created by Матвей Можевикин on 28.04.2024.
//

import SwiftUI

struct CheckerModel: View {
	public let color: Color;
	
	var body: some View {
		Checker(color: color)
			.padding(4)
	}
}
