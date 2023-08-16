//
//  MenuView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct MenuView: View {
    
    @State private var userRecord: [UserRecord] = []
    @State private var isStart = false
    @AppStorage("gameMode") var gameMode: String = "easy"
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: GameSettingsView(gameMode: $gameMode)) {
                    Image(systemName: "gearshape.fill").foregroundColor(.gray).font(.system(size: 25))
                }.offset(x: 130, y: -290)
                NavigationLink(destination: RegisterView(userRecord: $userRecord, gameMode: gameMode)) {
                    Text("Start!")
                        .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                }
                NavigationLink(destination: LeaderboardView(userRecord: userRecord)) {
                    Image(systemName: "trophy.fill")
                        .frame(width: 200, height: 60)
                        .font(.system(size: 25)).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                }
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
