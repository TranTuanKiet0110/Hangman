//
//  MenuView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct MenuView: View {
    
    @AppStorage("gameMode") var gameMode: String = "easy" //game difficulty
    @AppStorage("isDark") private var isDark = false //light/dark mode
    @AppStorage("gameLanguage") var gameLanguage: String = "english" //game language
    
    @State private var isStart = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("background")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .blur(radius: 7)
                    .edgesIgnoringSafeArea(.vertical) //background image
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
                    } //game's settings
                    
                    Spacer()
                        .frame(height: 110)
                    Image("app-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150, height: 150) //logo
                    Text("Hangman").font(.custom("BloodyTerror", size: 35))
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .offset(y: -30) //app's name
                    NavigationLink(destination: RegisterView( gameMode: gameMode, gameLanguage: gameLanguage)
                        .onAppear {playSound(sound: "start-button", type: "mp3", numOfLoop: 0)}) {
                        Text(gameLanguage == "english" ? "Start!" : "Bắt đầu!")
                            .modifier(MenuButtonModifier())
                        } // play button
                    NavigationLink(destination: LeaderboardView(gameLanguage: gameLanguage)) {
                        Image(systemName: "trophy.fill")
                            .modifier(MenuButtonModifier())
                    } //leaderboard
                    NavigationLink(destination: GuideView(gameLanguage: gameLanguage)) {
                        Text(gameLanguage == "english" ? "How to play?" : "Hướng dẫn")
                            .modifier(MenuButtonModifier())
                    } //how to play
                    
                    Spacer()
                        .frame(height: 100)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                    playSound(sound: "background-music", type: "mp3", numOfLoop: -1)
                } //delay background music
            }
        }
        .navigationViewStyle(.stack) //to hide side menu in ipad
        .preferredColorScheme(isDark ? .dark : .light) //for light/dark mode
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
