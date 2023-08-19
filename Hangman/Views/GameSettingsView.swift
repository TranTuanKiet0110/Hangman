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
    @Binding var isDark: Bool
    
    var body: some View {
        VStack {
            VStack {
                HStack {
                    Spacer()
                    
                    Text("Game Difficulties")
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
                    .foregroundColor(.white)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(easyIsClicked ? .black : .gray).opacity(0.5))
                    
                    Button("Medium") {
                        gameMode = "medium"
                        mediumIsClicked = true
                        easyIsClicked = false
                        hardIsClicked = false
                    }
                    .foregroundColor(.white)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(mediumIsClicked ? .black : .gray).opacity(0.5))
                    
                    Button("Hard") {
                        gameMode = "hard"
                        hardIsClicked = true
                        easyIsClicked = false
                        mediumIsClicked = false
                    }
                    .foregroundColor(.white)
                    .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(hardIsClicked ? .black : .gray).opacity(0.5))
                    Spacer()
                }
                .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                
                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
            }
            
            Divider()
                .padding(.vertical)
            
            VStack {
                Toggle("Dark mode", isOn: $isDark).toggleStyle(SwitchToggleStyle(tint: .green))
            }
            
            Divider()
                .padding(.vertical)
            
            VStack {
                Text("Languages")
            }
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .frame(width: UIScreen.main.bounds.width - 50)
        .navigationTitle("Settings")
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameMode: .constant("easy"), isDark: .constant(false))
    }
}
