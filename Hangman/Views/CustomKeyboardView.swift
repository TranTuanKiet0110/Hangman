//
//  CustomKeyboardView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 11/08/2023.
//

import SwiftUI

struct CustomKeyboardView: View {
    
    let keys = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    
    var body: some View {
        ForEach(0..<26) { i in
//            Text("\(self.keys[i])")
            Button("\(self.keys[i])") {
                
            }
        }
    }
}

struct CustomKeyboardView_Previews: PreviewProvider {
    static var previews: some View {
        CustomKeyboardView()
    }
}
