//
//  RegisterView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @Binding var userRecord: [UserRecord]
    
    @State var gameMode: String
    @State private var userInput = ""
    @State private var lastScore = 0
    @State private var userScore = 0
    @State private var played = false
    @State private var isHighScore = false
    @State private var isAvailable = false
    @State private var index = 0
    @State private var scoreStatus = ""
    
    @Environment(\.dismiss) var dismiss
    
    func addUserRecord() {
        if !userRecord.isEmpty {
            if isHighScore == true && isAvailable == true {
                userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                userRecord.remove(at: index)
                dismiss()
            } else if isHighScore == true && isAvailable == false {
                userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                dismiss()
            }
            index += 1
        } else {
            userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
            dismiss()
        }
        print(userRecord)
    }
    
    func checkAvailable() {
        if !userRecord.isEmpty {
            for record in userRecord {
                if record.userName == userInput {
                    lastScore = record.score
                    isAvailable = true
                } else {
                    isAvailable = false
                }
            }
        } else {
            isAvailable = false
        }
    }
    
    func checkHighScore() {
        if !userInput.isEmpty {
            if !userRecord.isEmpty {
                if isAvailable == true && lastScore < userScore {
                    scoreStatus = "New High Score!"
                    isHighScore = true
                } else if isAvailable == false && lastScore < userScore {
                    scoreStatus = "New High Score!"
                    isHighScore = true
                } else {
                    scoreStatus = "Better luck next time!"
                    isHighScore = false
                }
            } else {
                if userScore > 0 {
                    scoreStatus = "New High Score!"
                    isHighScore = true
                } else {
                    scoreStatus = "Better luck next time"
                    isHighScore = false
                }
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
                    Image(systemName: "door.right.hand.open").foregroundColor(.blue).multilineTextAlignment(.center)
                        .font(.system(size: 25))
                }
                .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                Button() {
                    addUserRecord()
                } label: {
                    Image(systemName: "square.and.arrow.down").foregroundColor(.blue).multilineTextAlignment(.center)
                        .font(.system(size: 25))
                }
                .disabled(isHighScore == false)
                    .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                NavigationLink(destination: {
                    if gameMode == "easy" {
                        EasyGameView(score: $userScore, played: $played, words: words)
                    } else {
                        Text("None")
                    }
                }) {
                    Image(systemName: "play").foregroundColor(.blue).multilineTextAlignment(.center)
                        .font(.system(size: 25))
                    .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                }.disabled(played == true || userInput.isEmpty)
            }.offset(y: 150)
        }.toolbar(.hidden)
            .onAppear {
                checkAvailable()
                checkHighScore()
                print(isAvailable)
                print(isHighScore)
            }.onDisappear {
                isHighScore = false
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userRecord: .constant([UserRecord(id: UUID(), userName: "Kiet", score: 0)]), gameMode: "easy")
    }
}
