//
//  RegisterView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @Binding var userRecord: [UserRecord]
    
    @State private var userInput = ""
    @State private var userScore = 0
    @State private var played = false
    @State private var isHighScore = false
    @State private var index = 0
    @State private var scoreStatus = ""
    
    @Environment(\.dismiss) var dismiss
    
    func addUserRecord() {
        if !userInput.isEmpty {
            if !userRecord.isEmpty {
                for record in userRecord {
                    if record.userName == userInput {
                        if record.score < userScore {
                            userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                            userRecord.remove(at: index)
                            dismiss()
                        } else {
                            dismiss()
                        }
                    } else {
                        userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                        dismiss()
                    }
                    index += 1
                }
            } else {
                userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                dismiss()
                }
        print(userRecord)
        }
    }
    
    func checkHighScore() {
        if !userRecord.isEmpty {
            for record in userRecord {
                if record.userName == userInput {
                    if record.score < userScore && userScore != 0 {
                        scoreStatus = "New High Score!"
                        isHighScore.toggle()
                    }
                }
            }
        } else {
            if userScore > 0 {
                scoreStatus = "New High Score!"
                isHighScore.toggle()
            } else {
                scoreStatus = ""
            }
        }
    }
    
    var body: some View {
        VStack {
            TextField("Enter player's name!", text: $userInput).disabled(played == true).offset(y: -50).frame(width: 200).multilineTextAlignment(.center).textFieldStyle(.roundedBorder)
            VStack {
                Text("\(scoreStatus)")
                HStack {
                    Text("Your score: ")
                    Text("\(userScore)")
                }
            }
            HStack {
                Button() {
                    dismiss()
                } label: {
                    Image(systemName: "door.right.hand.open").foregroundColor(.white).multilineTextAlignment(.center)
                        .font(.system(size: 25))
                }
                .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                Button() {
                    if !userInput.isEmpty {
                        addUserRecord()
                    }
                } label: {
                    Image(systemName: "square.and.arrow.down").foregroundColor(.white).multilineTextAlignment(.center)
                        .font(.system(size: 25))
                }
                .disabled(played == false)
                    .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                NavigationLink(destination: EasyGameView(score: $userScore, played: $played, words: words)) {
                    Image(systemName: "play").foregroundColor(.white).multilineTextAlignment(.center)
                        .font(.system(size: 25))
                    .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                }.disabled(played == true || userInput.isEmpty)
            }.offset(y: 150)
        }.toolbar(.hidden)
            .onAppear {
                checkHighScore()
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userRecord: .constant([UserRecord(id: UUID(), userName: "Kiet", score: 0)]))
    }
}
