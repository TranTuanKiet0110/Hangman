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
    
    @State var words: Array<EasyWord>
    @State private var hiddenWord = ""
    @State private var wordCount = 0
    @State private var currentWord = "?"
    @State private var currentLetter = ""
    @State private var currentHealth = 5
    @State private var word: EasyWord?
    @State private var animatingIcon = false
    
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
            score += 1
            startGame()
        }
    }
    
    func checkWrongInput(inputItem: String) {
        if !hiddenWord.contains(inputItem) {
            currentHealth -= 1
            playerLose(healthStatus: currentHealth)
        } else {
            if currentHealth < 5 {
                currentHealth += 1
            }
        }
    }
    
    func playerLose(healthStatus: Int) {
        if healthStatus == 0 {
            played.toggle()
            dismiss()
        }
    }
    func replace(myString: String, index: Int, newChar: Character){
        var chars = Array(myString)
        chars[index] = newChar
        let modifiedString = String(chars)
        currentWord = modifiedString
    }
    
    
    var body: some View {
        return ZStack {
            Color(.white).ignoresSafeArea(.all, edges: .all)
            VStack {
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
                }.padding(.horizontal).offset(y: -170)
                
                word?.image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .opacity(animatingIcon ? 1 : 0)
                    .offset(y: animatingIcon ? 0 : 50)
                    .frame(width: 100, height: 100).offset(y: -40)
                
                Text(currentWord).offset(y: 90)
                LazyVGrid (columns: gridItemLayout, spacing: 10) {
                    ForEach(0..<26) { index in
                        Button ("\(keys[index])") {
                            currentLetter = keys[index]
                            checkWrongInput(inputItem: currentLetter)
                            checkAvailable(inputItem: currentLetter)
                        } .frame(width: 40, height: 40).background(.gray).opacity(0.5)
                    }
                }.offset(y: 140)
            }
        }.toolbar(.hidden)
        .onAppear {
            self.startGame()
        }
        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height).background(.white)
    }
}

struct EasyGameView_Previews: PreviewProvider {
    static var previews: some View {
        EasyGameView(score: .constant(0), played: .constant(false), words: words)
    }
}
