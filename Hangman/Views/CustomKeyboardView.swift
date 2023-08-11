//
//  CustomKeyboardView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 11/08/2023.
//

import SwiftUI

struct CustomKeyboardView: View {
    
    @Binding var hiddenWord: String
    @Binding var currentWord: String
    @State private var currentLetter = ""
    let gridItemLayout = Array(repeating: GridItem(.fixed(30), spacing: 20), count: Int(UIScreen.main.bounds.width)/50)
    
    let keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    func checkAvailable(inputItem: String){
        var index = 0
        for char in hiddenWord {
            if String(char) == inputItem {
                replace(myString: currentWord, index: index, newChar: char)
                print(index)
            }
            index += 2
            print(currentWord)
        }
        print("True")
    }
    
    func replace(myString: String, index: Int, newChar: Character){
        var chars = Array(myString)
        chars[index] = newChar
        let modifiedString = String(chars)
        currentWord = modifiedString
    }
    
    var body: some View {
        return VStack {
            Text(currentWord)
            LazyVGrid (columns: gridItemLayout, spacing: 10) {
                ForEach(0..<26) { index in
                    Button ("\(keys[index])") {
                        currentLetter = keys[index]
                        checkAvailable(inputItem: currentLetter)
                    } .frame(width: 40, height: 40).background(.gray)
                }
            }
        }
    }
}

struct CustomKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardView(hiddenWord: .constant("A"), currentWord: .constant("_ _ _ _ A"))
    }
}
