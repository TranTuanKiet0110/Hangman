//
//  GameSettingsView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 15/08/2023.
//

import SwiftUI

struct GameSettingsView: View {
    
    @Binding var gameMode: String
    @AppStorage("easyIsClicked") var easyIsClicked: Bool = true
    @AppStorage("mediumIsClicked") var mediumIsClicked: Bool = false
    @AppStorage("hardIsClicked") var hardIsClicked: Bool = false
    
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
                        easyIsClicked = true
                        mediumIsClicked = false
                        hardIsClicked = false
                    }
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height * 0.08)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(easyIsClicked ? .black : .gray).opacity(0.5))
                    
                    Button("Medium") {
                        gameMode = "medium"
                        mediumIsClicked = true
                        easyIsClicked = false
                        hardIsClicked = false
                    }
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height * 0.08)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(mediumIsClicked ? .black : .gray).opacity(0.5))
                    
                    Button("Hard") {
                        gameMode = "hard"
                        hardIsClicked = true
                        easyIsClicked = false
                        mediumIsClicked = false
                    }
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height * 0.08)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(hardIsClicked ? .black : .gray).opacity(0.5))
                    Spacer()
                }
                .frame(width: geometry.size.width * 0.9, height: geometry.size.height * 0.08)
            
                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
            }
        }
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameMode: .constant("easy"))
    }
}
