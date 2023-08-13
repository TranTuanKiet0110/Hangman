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
    @State private var isClick = false
    @State private var index = 0
    
    func addUserRecord() {
        if !userInput.isEmpty {
            if !userRecord.isEmpty {
                for record in userRecord {
                    if record.userName != userInput {
                        userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                    } else {
                        if record.score < userScore {
                            userRecord.remove(at: index)
                            userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                        }
                    }
                    index += 1
                }
            } else {
                userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                }
        print(userRecord)
        }
    }
    
    var body: some View {
        VStack {
            TextField("Username", text: $userInput)
            Button("Save") {
                if !userInput.isEmpty {
                    isClick.toggle()
                    addUserRecord()
                }
            }.disabled(isClick == true)
            
            NavigationLink(destination: EasyGameView(score: $userScore, words: words)) {
                Text("Play")
                    .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
            }.disabled(isClick == false)
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userRecord: .constant([UserRecord(id: UUID(), userName: "Kiet", score: 0)]))
    }
}
