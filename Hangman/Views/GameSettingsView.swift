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
            if englishIsClicked == true {
                description = "Player's HP = 5, -1 HP for each wrong letter, +1 HP for each finished and hint is given for each word."
            } else {
                description = "Người chơi có 5 mạng (HP), -1 HP cho mỗi đoán sai ký tự, +1 HP khi đoán đúng 1 từ và sẽ có gợi ý cho mỗi từ."
            }
        } else if mediumIsClicked == true {
            if englishIsClicked == true {
                description = "Quite the same as easy mode. Instead, there is no hint given and the hidden word will be hard to guess."
            } else {
                description = "Khá giống với chế độ dễ. Thay vào đó, người chơi sẽ không được gợi ý và từ bị ẩn sẽ khó đoán hơn."
            }
        } else {
            if englishIsClicked == true {
                description = "Hell mode!!!😈 No HP recovery.❤️‍🔥 Player's HP = 3 and ofcourse no hint is given. Besides knowledge, you might need some luck to guess the word.🍀"
            } else {
                description = "Chế độ khó!!!😈 Người chơi sẽ không được hồi HP sau mỗi màn.❤️‍🔥 HP người chơi = 3 và đương nhiên sẽ không có gợi ý nào. Ngoài kiến thức, bạn sẽ phải cần sự may mắn để đoán chữ.🍀"
            }
        }
        
        return description
    }
    
    var body: some View {
        VStack {
            VStack {
                
                VStack {
                    Text(englishIsClicked ? "Difficulty" : "Độ khó")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 0) {
                        Spacer()
                        
                        Button(englishIsClicked ? "Easy" : "Dễ") {
                            gameMode = "easy"
                            easyIsClicked = true
                            mediumIsClicked = false
                            hardIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(easyIsClicked ? .black : .gray).opacity(0.5))
                        
                        Button(englishIsClicked ? "Medium" : "Trung bình") {
                            gameMode = "medium"
                            mediumIsClicked = true
                            easyIsClicked = false
                            hardIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(mediumIsClicked ? .black : .gray).opacity(0.5))
                        
                        Button(englishIsClicked ? "Hard" : "Khó") {
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
                .offset(y: -70)
                
                VStack {
                    Text(englishIsClicked ? "Description" : "Mô tả")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("\(loadDescription())")
                        .multilineTextAlignment(.center)
                }.offset(y: -20)
            }
            
            VStack {
                Divider()
                    .padding(.vertical)
                
                VStack {
                    Toggle(englishIsClicked ? "Dark mode" : "Chế độ tối", isOn: $isDark).toggleStyle(SwitchToggleStyle(tint: .green))
                        .fontWeight(.bold)
                }
                
                Divider()
                    .padding(.vertical)
                
                VStack {
                    Text(englishIsClicked ? "Languages" : "Ngôn ngữ")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 0) {
                        Spacer()
                        
                        Button(englishIsClicked ? "English" : "Tiếng Anh") {
                            gameLanguage = "english"
                            englishIsClicked = true
                            vietnameseIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(englishIsClicked ? .black : .gray).opacity(0.5))
                        
                        Button(englishIsClicked ? "Vietnamese" : "Tiếng Việt") {
                            gameLanguage = "vietnamese"
                            vietnameseIsClicked = true
                            englishIsClicked = false
                        }
                        .foregroundColor(.white)
                        .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16).foregroundColor(vietnameseIsClicked ? .black : .gray).opacity(0.5))
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                    
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
                }
            }
            .offset(y: 20)
        }
        .preferredColorScheme(isDark ? .dark : .light)
        .frame(width: UIScreen.main.bounds.width - 50)
        .navigationTitle(englishIsClicked ? "Settings" : "Cài Đặt")
    }
}

struct GameSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        GameSettingsView(gameMode: .constant("easy"), isDark: .constant(false), gameLanguage: .constant("english"))
    }
}
