//
//  GameSettingsView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 15/08/2023.
//

import SwiftUI

struct GameSettingsView: View {
    
    @Binding var gameMode: String
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameMode: .constant("easy"))
    }
}
