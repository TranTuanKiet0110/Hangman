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
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 7)
                    .edgesIgnoringSafeArea(.vertical)
                VStack {
                    
                    Spacer()
                        .frame(height: 5)
                    HStack {
                        
                        Spacer()
                            .frame(width: 280)
                        
                        NavigationLink(destination: GameSettingsView(gameMode: $gameMode, isDark: $isDark, gameLanguage: $gameLanguage)) {
                            Image(systemName: "gearshape.fill")
                                .foregroundColor(.white)
                                .font(.system(size: 25))
                        }
                    }
                    
                    Spacer()
                        .frame(height: 110)
                    Image("app-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150)
                    Text("Hangman").font(.custom("BloodyTerror", size: 35))
                        .foregroundColor(.white)
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
                    NavigationLink(destination: LeaderboardView(gameLanguage: gameLanguage)) {
                        Text(gameLanguage == "english" ? "How to play?" : "Hướng dẫn")
                            .modifier(MenuButtonModifier())
                    }
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
        }.navigationViewStyle(.stack)
        .preferredColorScheme(isDark ? .dark : .light)
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
