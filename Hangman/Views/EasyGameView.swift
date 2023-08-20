//
//  GameView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct EasyGameView: View {
    
    @Binding var score: Int
    @Binding var played: Bool
    @Binding var isPause: Bool
    @Binding var currentHealth: Int
    
    @AppStorage("pauseIsClicked") private var pauseIsClicked = false
    
    @State var words: Array<EasyWord>
    @State private var hiddenWord = ""
    @State private var wordCount = 0
    @State private var currentWord = "?"
    @State private var currentLetter = ""
    @State private var healthBar = 0
    @State private var word: EasyWord?
    @State private var animatingIcon = false
    @State private var healthReduce = false
    
    @Environment(\.dismiss) var dismiss
    
    let gridItemLayout = Array(repeating: GridItem(.fixed(30), spacing: 20), count: Int(UIScreen.main.bounds.width)/50)
    
    let keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func startGame() {
        animatingIcon = false
        word = nil
        word = words.randomElement()!
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            withAnimation(.easeInOut(duration: 0.3)){
                animatingIcon = true
            }
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
            }
            score += 1
            startGame()
        }
    }
    
    func checkWrongInput(inputItem: String) {
        if !hiddenWord.contains(inputItem) {
            currentHealth -= 1
            healthReduce = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
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
    
    
    var body: some View {
        return VStack {
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
                        .offset(x: 12)
                        
                        HStack {
                            Text("Score: ")
                            Text("\(score)")
                        }
                        .offset(x: -40)
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
            .offset(y: -140)
            
            word?.image
                .resizable()
                .opacity(animatingIcon ? 1 : 0)
                .offset(y: animatingIcon ? 0 : 50)
                .modifier(GameItemImageModifier())
            
            Text(currentWord).offset(y: 90)
            LazyVGrid (columns: gridItemLayout, spacing: 10) {
                ForEach(0..<26) { index in
                    Button ("\(keys[index])") {
                        currentLetter = keys[index]
                        checkWrongInput(inputItem: currentLetter)
                        checkAvailable(inputItem: currentLetter)
                        pauseIsClicked = false
                    }
                    .modifier(KeyboardButtonModifier())
                }
            }
            .padding(.horizontal)
            .offset(y: 140)
        }
        .toolbar(.hidden)
        .onAppear {
            self.startGame()
            healthBar = currentHealth
        }
    }
}

struct EasyGameView_Previews: PreviewProvider {
    static var previews: some View {
        EasyGameView(score: .constant(0), played: .constant(false), isPause: .constant(false), currentHealth: .constant(5), words: words)
    }
}
