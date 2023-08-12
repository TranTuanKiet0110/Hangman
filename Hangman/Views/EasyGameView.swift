//
//  GameView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct EasyGameView: View {
    
    let words = ["APPLE", "CHERRY", "BANANA"]
    
    @State private var hiddenWord = ""
    @State private var score = 0
    @State private var wordCount = 0
    @State private var currentWord = "?"
    @State private var currentLetter = ""
    @State private var currentHealth = 5
    let gridItemLayout = Array(repeating: GridItem(.fixed(30), spacing: 20), count: Int(UIScreen.main.bounds.width)/50)
    
    let keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func startGame() {
        hiddenWord = words.randomElement()!
        wordCount = hiddenWord.count
        currentWord = hiddenWord.replacingOccurrences(of: "[^\\s]", with: "_ ", options: .regularExpression, range: hiddenWord.startIndex..<hiddenWord.endIndex)
        print(hiddenWord)
        print(currentWord)
        print(wordCount)
    }
    
    func checkAvailable(inputItem: String) {
        var index = 0
        for char in hiddenWord {
            if String(char) == inputItem {
                replace(myString: currentWord, index: index, newChar: char)
                checkWinning()
                print(index)
            }
            index += 2
            print(currentWord)
        }
    }
    
    func checkWinning() {
        if currentWord.replacingOccurrences(of: " ", with: "") == hiddenWord {
            score += 1
            startGame()
        }
    }
    
    func checkWrongInput(inputItem: String) {
        if !hiddenWord.contains(inputItem) {
            currentHealth -= 1
        } else {
            if currentHealth < 5 {
                currentHealth += 1
            }
        }
    }
    
    func replace(myString: String, index: Int, newChar: Character){
        var chars = Array(myString)
        chars[index] = newChar
        let modifiedString = String(chars)
        currentWord = modifiedString
    }
    
    
    var body: some View {
        return VStack {
            HStack {
                HStack {
                    Text("HP: ")
                    HealthBarView(currentHealth: $currentHealth)
                }
                Spacer()
                HStack {
                    Text("Score: ")
                    Text("\(score)")
                }
            }.padding(.horizontal).offset(y: -220)
            
            Text(currentWord).offset(y: 150)
            LazyVGrid (columns: gridItemLayout, spacing: 10) {
                ForEach(0..<26) { index in
                    Button ("\(keys[index])") {
                        currentLetter = keys[index]
                        checkAvailable(inputItem: currentLetter)
                        checkWrongInput(inputItem: currentLetter)
                    } .frame(width: 40, height: 40).background(.gray).opacity(0.5)
                }
            }.offset(y: 200)
        }.onAppear { self.startGame() }
    }
}

struct EasyGameView_Previews: PreviewProvider {
    static var previews: some View {
        EasyGameView()
    }
}
