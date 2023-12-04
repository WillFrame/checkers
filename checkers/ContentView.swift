//
//  ContentView.swift
//  checkers
//
//  Created by Матвей Можевикин on 02.12.2023.
//

import SwiftUI

struct PlayTogether: View {
	var body: some View {
		VStack {
			Text("Играть вдвоем")
			Text("ТЕСТ")
		}
	}
}

// третий экран (открывающийся по ссылке с первого)
struct Settings: View {
	var body: some View {
		VStack {
			Text("Настройки")
			Text("ТЕСТ")
		}
	}
}

struct ContentView: View {
    @State var tapCount = 0
	@State private var tagSelection: String? = nil
    
    var body: some View {
        VStack {
			NavigationView {
				VStack {
					NavigationLink(
						destination: PlayTogether(),tag: "Играть вдвоем", selection: $tagSelection
					) { EmptyView() }
					NavigationLink(destination: Settings(), tag: "Настройки", selection: $tagSelection) { EmptyView() }
					
					Button(
						
						action: {tagSelection = "Играть вдвоем"}
					) {
						Text("Играть вдвоем")
							.padding([.horizontal], 30)
							.padding([.vertical], 10)
							.background(.brown)
							.cornerRadius(20)
							.foregroundStyle(.black)
					}
					Button(
						action: {tagSelection = "Настройки"}
					) {
						Text("Настройки")
							.padding([.horizontal], 30)
							.padding([.vertical], 10)
							.background(.brown)
							.cornerRadius(20)
							.foregroundStyle(.black)
					}
				}
				.navigationTitle("Главное меню")
			}
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
