//
//  ContentView.swift
//  checkers
//
//  Created by Матвей Можевикин on 02.12.2023.
//

import SwiftUI

struct ContentView: View {
	@State private var tagSelection: String? = nil
	
	var body: some View {
		VStack {
			NavigationView {
				VStack(spacing: 20) {
					NavigationLink(
						destination: PlayTogether(),
						tag: "playTogether",
						selection: $tagSelection
					) {
						NavigationButton(title: "Играть вдвоем") {
							tagSelection = "playTogether"
						}
					}
					NavigationLink(
						destination: Settings(),
						tag: "settings",
						selection: $tagSelection
					) {
						NavigationButton(title: "Настройки") {
							tagSelection = "settings"
						}
					}
				}
				.navigationTitle("Главное меню")
				.padding(.bottom, 100)
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
