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
            .frame(width: 100, height: 100)
            .offset(y: 50)
            .background(.white)
    }
}

struct KeyboardButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
            .background(.gray)
            .opacity(0.7)
            .foregroundColor(.white).brightness(0.2)
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

struct AchievementName: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct AchievementDescription: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 15))
            .foregroundColor(.white)
    }
}

struct AchievementImage: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 50, height: 50)
    }
}

struct RecordOrder: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct RecordDetail: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 25))
            .fontWeight(.bold)
            .foregroundColor(.white)
    }
}

struct GuideButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 15))
            .fontWeight(.bold)
    }
}

struct GuideDescription: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 20))
            .padding(.horizontal)
            .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
    }
}

struct GuideTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .font(.system(size: 20))
            .fontWeight(.bold)
    }
}
