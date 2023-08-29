//
//  GuideView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 29/08/2023.
//

import SwiftUI

struct GuideView: View {
    
    @State var gameLanguage: String
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 9)
                .edgesIgnoringSafeArea(.vertical)
            ScrollViewReader { value in
                ScrollView(.horizontal, showsIndicators: false){
                    HStack (spacing: 0){
                        
                        Spacer()
                            .frame(width: 10)
                        VStack {
                            Text(gameLanguage == "english" ?"Game's menu" : "Menu game")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("menu")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text("- Start game: Tap \"Start!\" button.\n- Open leaderboard: Tap \"🏆\" button.\n- Open game's settings: Tap gear button in the upper-right corner.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            Text(gameLanguage == "english" ?"Game's settings" : "Cài đặt")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("setting")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text("- Change game's difficulty: Tap on the difficulty indicator.\n- Change light/dark mode: Toggle the dark mode button.\n- Change language: Tap on the languages indicator.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            Text(gameLanguage == "english" ? "Register page" : "Điền thông tin")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("register")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text("- Enter your name in the text field.\n- Press play button to play.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            Text("Gameplay")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("game")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text("- Guess the word base on the picture given.\n- If succeed: score + 1.\n- Choose a wrong letter: HP - 1.\n- No ending, Win if get highscore.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            Text("Pause")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("pause")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text("- Continue: Tap \"Play\" button.\n- Quit: Tap \"Door\" button.\n- Reset character: Tap \"Reset\" button.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            Text("Game's Result")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("result")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text("- Save result: Tap \"Save\" button.\n- Quit: Tap \"Reset\" or \"Door\" button.\n- Saved result will be recorded into leaderboard.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        
                        Spacer()
                            .frame(width: 10)
                    }
                    .navigationTitle(gameLanguage == "english" ? "Game's guide" : "Hướng dẫn")
                    .navigationBarBackButtonHidden(true)
                }
            }
            .toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.uturn.left").font(.system(size: 15)).fontWeight(.bold)
                            Text(gameLanguage == "english" ? "Return" : "Quay lại")
                                .fontWeight(.bold)
                        }
                        .foregroundColor(.white)
                    }
                }
            }
        }
    }
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(gameLanguage: "english")
    }
}
