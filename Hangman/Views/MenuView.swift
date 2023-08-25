//
//  MenuView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct MenuView: View {
    
    @State private var isStart = false
    @AppStorage("gameMode") var gameMode: String = "easy"
    @AppStorage("isDark") private var isDark = false
    @AppStorage("gameLanguage") var gameLanguage: String = "english"
    
    let userDefaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GameSettingsView(gameMode: $gameMode, isDark: $isDark, gameLanguage: $gameLanguage)) {
                    Image(systemName: "gearshape.fill")
                        .foregroundColor(.gray).font(.system(size: 25))
                }
                .offset(x: 130, y: -110)
                Image("app-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .offset(y: -30)
                Text("Hangman").font(.custom("BloodyTerror", size: 35))
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .offset(y: -30)
                NavigationLink(destination: RegisterView( gameMode: gameMode, gameLanguage: gameLanguage)) {
                    Text(gameLanguage == "english" ? "Start!" : "Bắt đầu!")
                        .modifier(MenuButtonModifier())
                }
                NavigationLink(destination: LeaderboardView(gameLanguage: gameLanguage)) {
                    Image(systemName: "trophy.fill")
                        .modifier(MenuButtonModifier())
                }
            }
        }.preferredColorScheme(isDark ? .dark : .light)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
