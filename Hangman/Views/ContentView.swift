//
//  ContentView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 11/08/2023.
//

import SwiftUI

struct ContentView: View {
    
    let words = ["apple", "cherry"]
    
    @State private var hiddenWord = ""
    @State private var score = 0
    @State private var wordCount = 0
    @State private var currentWord = "?"
    
    func startGame() {
        hiddenWord = words.randomElement()!
        wordCount = hiddenWord.count
        currentWord = hiddenWord.replacingOccurrences(of: "[^\\s]", with: "_ ", options: .regularExpression, range: hiddenWord.startIndex..<hiddenWord.endIndex)
        print(hiddenWord)
        print(currentWord)
        print(wordCount)
    }
    
    func checkWinning() {
        if currentWord == hiddenWord {
            playerWin()
        }
    }
    
    func playerWin() {
        score += 1
    }
    
    var body: some View {
        VStack {
//            HStack {
//                ForEach(Array(hiddenWord.enumerated()), id: \.offset) {
//                    char in Text("_")
//                }
//            }
            Text(currentWord)
            Spacer()
            Button(){
                self.startGame()
            } label: {
                Image(systemName: "info.circle.fill")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
