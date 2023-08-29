//
//  Modifiers.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct GameItemImageModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .scaledToFit()
            .frame(width: 100, height: 100).offset(y: -40)
    }
}

struct KeyboardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .background(.gray)
            .opacity(0.5)
    }
}

struct MenuButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
            .frame(width: 200, height: 70)
            .font(.custom("BloodyTerror", size: 25))
            .background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
    }
}
