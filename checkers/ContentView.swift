//
//  ContentView.swift
//  checkers
//
//  Created by Матвей Можевикин on 02.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View {
        VStack {
            Button(
                action: {
                    print("Играть вдвоем")
                }
            ) {
                Text("Играть вдвоем")
            }
			Button(
				action: {
					print("Тестовая кнопка")
				}
			) {
				Text("Тестовая кнопка")
			}
            Button(
                action: {
                    print("Настройки")
                }
            ) {
                Text("Настройки")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
