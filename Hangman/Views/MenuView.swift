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
    
    let userDefaults = UserDefaults.standard
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GameSettingsView(gameMode: $gameMode, isDark: $isDark)) {
                    Image(systemName: "gearshape.fill").foregroundColor(.gray).font(.system(size: 25))
                }.offset(x: 130, y: -270)
                NavigationLink(destination: RegisterView( gameMode: gameMode)) {
                    Text("Start!")
                        .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                }
                NavigationLink(destination: LeaderboardView()) {
                    Image(systemName: "trophy.fill")
                        .frame(width: 200, height: 60)
                        .font(.system(size: 25)).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
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
