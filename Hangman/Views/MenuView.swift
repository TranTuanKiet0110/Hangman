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

    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: RegisterView(userRecord: $userRecord)) {
                    Text("Start")
                        .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray))
                }
                NavigationLink(destination: LeaderboardView(userRecord: userRecord)) {
                    Text("Leaderboard")
                        .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray))
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
