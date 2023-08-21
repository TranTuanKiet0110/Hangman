//
//  GameSettingsView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 15/08/2023.
//

import SwiftUI

struct GameSettingsView: View {
    
    @Binding var gameMode: String
    @Binding var isDark: Bool
    @Binding var gameLanguage: String
    
    @AppStorage("easyIsClicked") var easyIsClicked: Bool = true
    @AppStorage("mediumIsClicked") var mediumIsClicked: Bool = false
    @AppStorage("hardIsClicked") var hardIsClicked: Bool = false
    @AppStorage("englishIsClicked") var englishIsClicked: Bool = true
    @AppStorage("vietnameseIsClicked") var vietnameseIsClicked: Bool = false
    
    func loadDescription() -> String {
        var description = ""
        
        if easyIsClicked == true {
            description = "Player's HP = 5, -1 HP for each wrong letter, +1 HP for each finished and hint is given for each word."
        } else if mediumIsClicked == true {
            description = "Quite the same as easy mode. Instead, there is no hint given and the hidden word will be hard to guess."
        } else {
            description = "Hell mode!!!😈 No HP recovery.❤️‍🔥 Player's HP = 3 and ofcourse no hint is given. Besides knowledge, you might need some luck to guess the word.🍀"
        }
        
        return description
    }
    
    var body: some View {
        VStack {
            VStack {
                
                VStack {
                    Text("Game Difficulties")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 0) {
                        Spacer()
                        
                        Button("Easy") {
                            gameMode = "easy"
                            easyIsClicked = true
                            mediumIsClicked = false
                            hardIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(easyIsClicked ? .black : .gray).opacity(0.5))
                        
                        Button("Medium") {
                            gameMode = "medium"
                            mediumIsClicked = true
                            easyIsClicked = false
                            hardIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(mediumIsClicked ? .black : .gray).opacity(0.5))
                        
                        Button("Hard") {
                            gameMode = "hard"
                            hardIsClicked = true
                            easyIsClicked = false
                            mediumIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(hardIsClicked ? .black : .gray).opacity(0.5))
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                    
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
                }
                .offset(y: -110)
                
                VStack {
                    Text("Description")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.bottom, 5.0)
                    Text("\(loadDescription())")
                        .multilineTextAlignment(.center)
                }.offset(y: -70)
            }
            
            VStack {
                Divider()
                    .padding(.vertical)
                
                VStack {
                    Toggle("Dark mode", isOn: $isDark).toggleStyle(SwitchToggleStyle(tint: .green))
                        .fontWeight(.bold)
                }
                
                Divider()
                    .padding(.vertical)
                
                VStack {
                    Text("Languages")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 0) {
                        Spacer()
                        
                        Button("English") {
                            gameLanguage = "english"
                            englishIsClicked = true
                            vietnameseIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(easyIsClicked ? .black : .gray).opacity(0.5))
                        
                        Button("Vietnamese") {
                            gameLanguage = "vietnamese"
                            vietnameseIsClicked = true
                            englishIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(mediumIsClicked ? .black : .gray).opacity(0.5))
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                    
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
                }
            }
            .offset(y: -45)
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .frame(width: UIScreen.main.bounds.width - 50)
        .navigationTitle("Settings")
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameMode: .constant("easy"), isDark: .constant(false), gameLanguage: .constant("english"))
    }
}
