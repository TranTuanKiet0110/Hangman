//
//  RegisterView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @AppStorage("saveName") var saveName = ""
    @AppStorage("saveScore") var saveScore = 0
    @AppStorage("isPause") var isPause = false
    @AppStorage("easyCurrentHealth") var easyCurrentHealth = 5
    @AppStorage("mediumCurrentHealth") var mediumCurrentHealth = 5
    @AppStorage("hardCurrentHealth") var hardCurrentHealth = 3
    
    @State private var userRecord: [UserRecord] = []
    @State var gameMode: String
    @State var gameLanguage: String
    @State private var userInput = ""
    @State private var lastScore = 0
    @State private var userScore = 0
    @State private var played = false
    @State private var isHighScore = false
    @State private var isAvailable = false
    @State private var index = 1
    @State private var scoreStatus = ""
    @State private var pauseIsClicked = false
    @State private var isFinished = false
    
    @Environment(\.dismiss) var dismiss
    
    func save(userRecord: [UserRecord]) {
        do {
            let url = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test6.json")
            let encoder = JSONEncoder()
            try encoder.encode(userRecord).write(to: url)
        } catch {
            print(error)
        }
    }
    
    func load() -> [UserRecord]{
        do {
            let url = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test6.json")
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let records = try decoder.decode([UserRecord].self, from: data)
            return records
        } catch {
            print(error)
            return []
        }
    }
    
    func addUserRecord() {
        if !userRecord.isEmpty {
            print(isAvailable)
            print(isHighScore)
            if isHighScore == true && isAvailable == true {
                userRecord.removeAll(where: {$0.userName == "\(userInput)"})
                userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                save(userRecord: userRecord)
                print(userRecord)
                playSound(sound: "quit-button", type: "mp3", numOfLoop: 0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    dismiss()
                }
            } else if isHighScore == true && isAvailable == false {
                userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
                save(userRecord: userRecord)
                print(userRecord)
                playSound(sound: "quit-button", type: "mp3", numOfLoop: 0)
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    dismiss()
                }
            }
        } else {
            userRecord.append(UserRecord(id: UUID(), userName: userInput, score: userScore))
            save(userRecord: userRecord)
            print(userRecord)
            playSound(sound: "quit-button", type: "mp3", numOfLoop: 0)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                dismiss()
            }
        }
    }
    
    func checkAvailable() {
        if !userRecord.isEmpty {
            for record in userRecord {
                if record.userName == userInput {
                    lastScore = record.score
                    isAvailable = true
                    break
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
            if played == true {
                if !userRecord.isEmpty {
                    if isAvailable == true && lastScore < userScore {
                        if gameLanguage == "english" {
                            scoreStatus = "New High Score!"
                            isHighScore = true
                            reset()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound(sound: "win", type: "mp3", numOfLoop: 0)
                            }
                        } else {
                            scoreStatus = "Kỷ lục mới!"
                            isHighScore = true
                            reset()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound(sound: "win", type: "mp3", numOfLoop: 0)
                            }
                        }
                    } else if isAvailable == false && lastScore < userScore {
                        if gameLanguage == "english" {
                            scoreStatus = "New High Score!"
                            isHighScore = true
                            reset()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound(sound: "win", type: "mp3", numOfLoop: 0)
                            }
                        } else {
                            scoreStatus = "Kỷ lục mới!"
                            isHighScore = true
                            reset()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound(sound: "win", type: "mp3", numOfLoop: 0)
                            }
                        }
                    } else {
                        if gameLanguage == "english" {
                            scoreStatus = "Better luck next time!"
                            isHighScore = false
                            reset()
                        } else {
                            scoreStatus = "Chúc bạn may mắn lần sau!"
                            isHighScore = false
                            reset()
                        }
                    }
                } else {
                    if userScore > 0 {
                        if gameLanguage == "english" {
                            scoreStatus = "New High Score!"
                            isHighScore = true
                            reset()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound(sound: "win", type: "mp3", numOfLoop: 0)
                            }
                        } else {
                            scoreStatus = "Kỷ lục mới!"
                            isHighScore = true
                            reset()
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                playSound(sound: "win", type: "mp3", numOfLoop: 0)
                            }
                        }
                    } else {
                        if gameLanguage == "english" {
                            scoreStatus = "Better luck next time"
                            isHighScore = false
                            reset()
                        } else {
                            scoreStatus = "Chúc bạn may mắn lần sau!"
                            isHighScore = false
                            reset()
                        }
                    }
                }
            } else {
                if gameLanguage == "english" {
                    scoreStatus = "The game is paused!\nPress play to resume."
                } else {
                    scoreStatus = "Game đang tạm dừng! Nhấn nút chơi để tiếp tục."
                }
            }
        }
    }
    
    func resetArray() {
        userRecord.removeAll()
    }
    
    func checkIsPause() {
        if isPause == true {
            userInput = saveName
            userScore = saveScore
        }
    }
    
    func checkPause() {
        if pauseIsClicked == true {
            saveName = userInput
            saveScore = userScore
        }
    }
    
    func reset() {
        isPause = false
        pauseIsClicked = false
        saveName = ""
        saveScore = 0
        easyCurrentHealth = 5
        mediumCurrentHealth = 5
        hardCurrentHealth = 3
    }
    
    var body: some View {
        ZStack {
            Image("register-background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 7)
                .edgesIgnoringSafeArea(.vertical)
            VStack {
                VStack {
                    TextField(gameLanguage == "english" ? "Enter player's name!" : "Hãy điền tên của bạn!", text: $userInput).disabled(played == true || isPause == true || pauseIsClicked == true)
                        .offset(y: -80)
                        .frame(width: 200)
                        .multilineTextAlignment(.center).textFieldStyle(.roundedBorder)
                    VStack {
                        Text("\(scoreStatus)")
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.bottom)
                            .foregroundColor(.white)
                        
                        HStack {
                            Text(gameLanguage == "english" ? "Your score: " : "Điểm của bạn: ")
                            Text("\(userScore)")
                        }
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                    }
                    
                    Button() {
                        reset()
                        playSound(sound: "quit-button", type: "mp3", numOfLoop: 0)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                            dismiss()
                        }
                    } label: {
                        HStack {
                            Image(systemName: "arrow.counterclockwise")
                                .foregroundColor(.white)
                                .font(.system(size: 30))
                            Text(gameLanguage == "english" ? "Reset saved data" : "Xoá dữ liệu")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .font(.system(size: 17))
                        }
                        .frame(width: 160, height: 70)
                        .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(.gray).opacity(0.5))
                    }
                    .offset(y: 30)
                }
                HStack {
                    Button() {
                        if isPause == true {
                            pauseIsClicked = true
                        }
                        playSound(sound: "quit-button", type: "mp3", numOfLoop: 0)
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                            dismiss()
                        }
                    } label: {
                        Image(systemName: "door.right.hand.open")
                            .foregroundColor(.white).multilineTextAlignment(.center)
                            .font(.system(size: 25))
                            .frame(width: 100, height: 60)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                                .foregroundColor(.gray).opacity(0.5))
                    }
                    
                    Button() {
                        addUserRecord()
                    } label: {
                        Image(systemName: "square.and.arrow.down")
                            .foregroundColor(.white)
                            .multilineTextAlignment(.center)
                            .font(.system(size: 25))
                            .frame(width: 100, height: 60)
                            .background(RoundedRectangle(cornerRadius: 16, style: .continuous)
                            .foregroundColor(.gray)
                            .opacity(0.5))
                    }
                    .disabled(isHighScore == false)
                    
                    NavigationLink(destination: {
                
                            if gameMode == "easy" {
                                EasyGameView(score: $userScore, played: $played, isPause: $pauseIsClicked, currentHealth: $easyCurrentHealth, words: easyWords, gameLanguage: gameLanguage)
                            } else if gameMode == "medium" {
                                MediumGameView(score: $userScore, played: $played, isPause: $pauseIsClicked, currentHealth: $mediumCurrentHealth, words: mediumWords, gameLanguage: gameLanguage)
                            } else {
                                HardGameView(score: $userScore, played: $played, isPause: $pauseIsClicked, currentHealth: $hardCurrentHealth, words: hardWords, gameLanguage: gameLanguage)
                            }
                
                    }) {
                        Image(systemName: "play").foregroundColor(.white).multilineTextAlignment(.center)
                            .font(.system(size: 25))
                            .frame(width: 100, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
                    }
                    .disabled(played == true || userInput.isEmpty)
                }
                .offset(y: 150)
            }
            .toolbar(.hidden)
                .onAppear {
                    isHighScore = false
                    self.userRecord = load()
                    checkIsPause()
                    checkPause()
                    checkAvailable()
                    checkHighScore()
                }.onDisappear {
                    resetArray()
                    if played == true {
                        reset()
                    }
                    isPause = pauseIsClicked
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView( gameMode: "easy", gameLanguage: "english")
    }
}
