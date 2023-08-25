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
            .frame(width: 40, height: 40)
            .background(.gray)
            .opacity(0.5)
    }
}

struct MenuButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .fontWeight(.bold)
            .frame(width: 200, height: 60)
            .font(.system(size: 20)).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
    }
}
