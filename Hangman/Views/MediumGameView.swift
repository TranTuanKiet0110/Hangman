//
//  GameView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct MediumGameView: View {
    
    @Binding var score: Int
    @Binding var played: Bool
    @Binding var isPause: Bool
    @Binding var currentHealth: Int
    
    @AppStorage("pauseIsClicked") private var pauseIsClicked = false
    
    @State var words: Array<MediumWord>
    @State private var hiddenWord = ""
    @State private var wordCount = 0
    @State private var currentWord = "?"
    @State private var currentLetter = ""
    @State private var healthBar = 0
    @State private var word: MediumWord?
    @State private var animatingIcon = false
    @State private var healthReduce = false
    @State var gameLanguage: String
    @State var keys = [
        Key(id: 0, name: "A", isClick: false),
        Key(id: 1, name: "B", isClick: false),
        Key(id: 2, name: "C", isClick: false),
        Key(id: 3, name: "D", isClick: false),
        Key(id: 4, name: "E", isClick: false),
        Key(id: 5, name: "F", isClick: false),
        Key(id: 6, name: "G", isClick: false),
        Key(id: 7, name: "H", isClick: false),
        Key(id: 8, name: "I", isClick: false),
        Key(id: 9, name: "J", isClick: false),
        Key(id: 10, name: "K", isClick: false),
        Key(id: 11, name: "L", isClick: false),
        Key(id: 12, name: "M", isClick: false),
        Key(id: 13, name: "N", isClick: false),
        Key(id: 14, name: "O", isClick: false),
        Key(id: 15, name: "P", isClick: false),
        Key(id: 16, name: "Q", isClick: false),
        Key(id: 17, name: "R", isClick: false),
        Key(id: 18, name: "S", isClick: false),
        Key(id: 19, name: "T", isClick: false),
        Key(id: 20, name: "U", isClick: false),
        Key(id: 21, name: "V", isClick: false),
        Key(id: 22, name: "U", isClick: false),
        Key(id: 23, name: "X", isClick: false),
        Key(id: 24, name: "Y", isClick: false),
        Key(id: 25, name: "Z", isClick: false)
    ]

    @Environment(\.dismiss) var dismiss
    
    let gridItemLayout = Array(repeating: GridItem(.fixed(30), spacing: 20), count: 8)
    
    func startGame() {
        animatingIcon = false
        word = nil
        word = mediumWords.randomElement()!
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeInOut(duration: 0.3)){
                animatingIcon = true
            }
            resetKeys()
        }
        
        if word != nil {
            hiddenWord = word!.word
            print(hiddenWord)
        } else {
            print("Cannot get data!")
        }
        wordCount = hiddenWord.count
        currentWord = hiddenWord.replacingOccurrences(of: "[^\\s]", with: "_ ", options: .regularExpression, range: hiddenWord.startIndex..<hiddenWord.endIndex)
    }
    
    func checkAvailable(inputItem: String) {
        var index = 0
        for char in hiddenWord {
            if String(char) == inputItem {
                replace(myString: currentWord, index: index, newChar: char)
                checkWinning()
            }
            index += 2
        }
    }
    
    func checkWinning() {
        if currentWord.replacingOccurrences(of: " ", with: "") == hiddenWord {
            if currentHealth < 5 {
                currentHealth += 1
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    playSound(sound: "health-increase", type: "mp3", numOfLoop: 0)
                }
            }
            score += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                playSound(sound: "new", type: "mp3", numOfLoop: 0)
                startGame()
            }
        }
    }
    
    func checkWrongInput(inputItem: String) {
        if !hiddenWord.contains(inputItem) {
            currentHealth -= 1
            healthReduce = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                playSound(sound: "health-reduce", type: "mp3", numOfLoop: 0)
                healthReduce = false
            }
            playerLose(healthStatus: currentHealth)
        }
    }
    
    func playerLose(healthStatus: Int) {
        if healthStatus == 0 {
            played = true
            dismiss()
        }
    }
    
    func replace(myString: String, index: Int, newChar: Character){
        var chars = Array(myString)
        chars[index] = newChar
        let modifiedString = String(chars)
        currentWord = modifiedString
    }
    
    func checkIsPause() {
        if pauseIsClicked == true {
            isPause = true
        } else {
            isPause = false
        }
    }
    
    func checkIsClick(id: Int) {
        var index = 0
        for key in keys {
            if key.id == id {
                keys[index].isClick = true
            }
            index += 1
        }
        
    }
    
    func resetKeys() {
        var index = 0
        for key in keys {
            if key.isClick == true {
                keys[index].isClick = false
            }
            index += 1
        }
    }
    
    var body: some View {
        return VStack {
            
            Spacer()
                .frame(height: 30)
            VStack {
                HStack {
                    VStack {
                        HStack {
                            Text("HP: ")
                            HealthBarView(currentHealth: $currentHealth)
                                .opacity(healthReduce ? 0.7 : 1)
                                .offset(x: healthReduce ? 10 : 0)
                                .animation(Animation.spring(response: 0.2, dampingFraction: 0.2, blendDuration: 0.2), value: healthReduce)
                        }
                        .padding(.bottom, 3.0)
                        
                        HStack {
                            Text(gameLanguage == "english" ? "Score: " : "Điểm: ")
                            Text("\(score)")
                        }
                        .offset(x: -53)
                    }
                    
                    Spacer()
                    Button {
                        pauseIsClicked = true
                        checkIsPause()
                        print(pauseIsClicked)
                        dismiss()
                    } label: {
                        Image(systemName: "pause.fill")
                            .font(.system(size: 30))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing)
                }
                Divider()
            }
            .padding(.horizontal, 30.0)
            
            Spacer()
                .frame(height: 200)
            word?.image
                .resizable()
                .opacity(animatingIcon ? 1 : 0)
                .offset(y: animatingIcon ? -50 : 0)
                .modifier(GameItemImageModifier())
            
            Spacer()
                .frame(height: 50)
            Text(currentWord)
            
            Spacer()
                .frame(height: 100)
            LazyVGrid (columns: gridItemLayout, spacing: 10) {
                ForEach(keys) { key in
                    Button {
                        currentLetter = key.name
                        checkWrongInput(inputItem: currentLetter)
                        checkAvailable(inputItem: currentLetter)
                        pauseIsClicked = false
                        checkIsClick(id: key.id)
                        playSound(sound: "key-press", type: "mp3", numOfLoop: 0)
                    } label: {
                        Text("\(key.name)")
                            .modifier(KeyboardButtonModifier())
                            .opacity(key.isClick ? 0 : 1)
                            .offset(y: key.isClick ? 100 : 0)
                            .animation(.easeOut(duration: 0.3), value: key.isClick)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .toolbar(.hidden)
        .onAppear {
            self.startGame()
            healthBar = currentHealth
        }
    }
}

struct MediumGameView_Previews: PreviewProvider {
    static var previews: some View {
        MediumGameView(score: .constant(0), played: .constant(false), isPause: .constant(false), currentHealth: .constant(5), words: mediumWords, gameLanguage: "english")
    }
}
