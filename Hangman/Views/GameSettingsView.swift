//
//  GameSettingsView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 15/08/2023.
//

import SwiftUI

struct GameSettingsView: View {
    
    @Binding var gameMode: String
    @State private var easyIsClicked = false
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Game Difficulty: ")
                    Spacer()
                }
                
                HStack (spacing: 0) {
                    Spacer()
                    
                    Button("Easy") {
                        gameMode = "easy"
                        easyIsClicked.toggle()
                    }
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height * 0.08)
                    .background(easyIsClicked ? .black : .gray)
                    
                    Button("Medium") {
                        gameMode = "medium"
                    }
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height * 0.08)
                    .border(.black)
                    
                    Button("Hard") {
                        gameMode = "hard"
                    }
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height * 0.08)
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.08)
            
                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
//                        .overlay(
//                        RoundedRectangle(cornerRadius: 16).stroke(.blue, lineWidth: 2).frame(width: UIScreen.main.bounds.width - 40, height: 50)
//                    )
            }
        }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameMode: .constant("easy"))
    }
}
