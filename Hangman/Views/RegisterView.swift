//
//  RegisterView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct RegisterView: View {
    
//    @Binding var userRecord: [UserRecord]
    @State private var userRecord: [UserRecord] = []
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
    
//    func load() {
//        let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("test1.json")
//        if let url = url, let data = try? Data(contentsOf: url) {
//            let decoder = JSONDecoder()
//            if let loadedRecord = try? decoder.decode([UserRecord].self, from: data) {
//                userRecord = loadedRecord
//            }
//        }
//    }
    func save(userRecord: UserRecord, jsonFileName: String) {
        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
            do {
                let encoder = JSONEncoder()
                let encoded = try encoder.encode(userRecord)
                try encoded.write(to: file)
            } catch let error {
                fatalError("Failed to encode data: \(error)")
            }
        } else {
            fatalError("Couldn't find \(jsonFileName) file")
        }
    }
    
    func addUserRecord() {
        if !userRecord.isEmpty {
            if isHighScore == true && isAvailable == true {
                userRecord.append(UserRecord(id: index, userName: userInput, score: userScore))
                userRecord.remove(at: index)
                save(userRecord: UserRecord(id: index, userName: userInput, score: userScore), jsonFileName: "userRecord.json")
                print(userRecord)
                dismiss()
            } else if isHighScore == true && isAvailable == false {
                userRecord.append(UserRecord(id: index, userName: userInput, score: userScore))
                save(userRecord: UserRecord(id: index, userName: userInput, score: userScore), jsonFileName: "userRecord.json")
                print(userRecord)
                dismiss()
            }
            index += 1
        } else {
            userRecord.append(UserRecord(id: 0, userName: userInput, score: userScore))
            save(userRecord: UserRecord(id: index, userName: userInput, score: userScore), jsonFileName: "userRecord.json")
            print(userRecord)
            dismiss()
        }
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
    
    func resetArray() {
        userRecord.removeAll()
    }
    
    func save(userRecord: [UserRecord]) {
        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(userRecord)
            let url = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("test1.json")
            try data.write(to: url)
        } catch {
            print(error)
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
                
//                load()
                print(userRecord)
                checkAvailable()
                checkHighScore()
                print(isAvailable)
                print(isHighScore)
            }.onDisappear {
                resetArray()
                isHighScore = false
            }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView( gameMode: "easy")
    }
}
