/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Tran Tuan Kiet
  ID: 3879300
  Created  date: 15/08/2023
  Last modified: 05/09/2023
  Acknowledgement: 
*/

import SwiftUI

struct GameSettingsView: View {
    
    //binding to menu view
    @Binding var gameMode: String
    @Binding var isDark: Bool
    @Binding var gameLanguage: String
    
    @AppStorage("easyIsClicked") var easyIsClicked: Bool = true
    @AppStorage("mediumIsClicked") var mediumIsClicked: Bool = false
    @AppStorage("hardIsClicked") var hardIsClicked: Bool = false
    @AppStorage("englishIsClicked") var englishIsClicked: Bool = true
    @AppStorage("vietnameseIsClicked") var vietnameseIsClicked: Bool = false
    
    @Environment(\.dismiss) var dismiss //to go back to previous view
    
    func loadDescription() -> String {
        var description = ""
        
        if easyIsClicked == true {
            if englishIsClicked == true {
                description = "Player's HP = 5, -1 HP for each wrong letter, +1 HP for each finished word and hint is given for each word."
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
                
                Spacer()
                    .frame(height: 100)
                VStack { //custom difficulty picker
                    Text(englishIsClicked ? "Difficulty" : "Độ khó")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 0) {
                        
                        Spacer()
                        Button {
                            gameMode = "easy"
                            easyIsClicked = true
                            mediumIsClicked = false
                            hardIsClicked = false
                        } label: {
                            Text(englishIsClicked ? "Easy" : "Dễ")
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(easyIsClicked ? .black : .gray).opacity(0.5))
                        }
                        
                        Button {
                            gameMode = "medium"
                            mediumIsClicked = true
                            easyIsClicked = false
                            hardIsClicked = false
                        } label: {
                            Text(englishIsClicked ? "Medium" : "Trung bình")
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(mediumIsClicked ? .black : .gray).opacity(0.5))
                        }
                        
                        Button {
                            gameMode = "hard"
                            hardIsClicked = true
                            easyIsClicked = false
                            mediumIsClicked = false
                        } label: {
                            Text(englishIsClicked ? "Hard" : "Khó")
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 3, height: 70)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(hardIsClicked ? .black : .gray).opacity(0.5))
                        }
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                    
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
                }
                
                Spacer()
                    .frame(height: 60)
                VStack { //difficulty's description
                    Text(englishIsClicked ? "Description" : "Mô tả")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    Text("\(loadDescription())")
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width - 20, height: 100)
                }
            }
            
            Spacer()
                .frame(height: 30)
            VStack {
                Divider()
                    .padding(.vertical)
                
                VStack {
                    Toggle(englishIsClicked ? "Dark mode" : "Chế độ tối", isOn: $isDark)
                        .toggleStyle(SwitchToggleStyle(tint: .green))
                        .fontWeight(.bold)
                } //light /dark toggle button
                
                Divider()
                    .padding(.vertical)
                
                Spacer()
                    .frame(height: 50)
                VStack { //custom language picker
                    Text(englishIsClicked ? "Languages" : "Ngôn ngữ")
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                    HStack (spacing: 0) {
                        Spacer()
                        
                        Button {
                            gameLanguage = "english"
                            englishIsClicked = true
                            vietnameseIsClicked = false
                        } label: {
                            Text(englishIsClicked ? "English" : "Tiếng Anh")
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 70)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(englishIsClicked ? .black : .gray).opacity(0.5))
                        }
                        
                        Button {
                            gameLanguage = "vietnamese"
                            vietnameseIsClicked = true
                            englishIsClicked = false
                        } label: {
                            Text(englishIsClicked ? "Vietnamese" : "Tiếng Việt")
                                .foregroundColor(.white)
                                .frame(width: (UIScreen.main.bounds.width - 50) / 2, height: 70)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(vietnameseIsClicked ? .black : .gray).opacity(0.5))
                        }
                        
                        Spacer()
                    }
                    .frame(width: UIScreen.main.bounds.width - 50, height: 70)
                    .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray))
                }
            }
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true) //hide back button
        .toolbar { //customize toolbar
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.uturn.left")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                        Text(gameLanguage == "english" ? "Return" : "Quay lại")
                            .fontWeight(.bold)
                    }
                }
            }
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
