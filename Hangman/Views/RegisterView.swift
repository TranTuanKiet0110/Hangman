//
//  RegisterView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct RegisterView: View {
    
    @Binding var userName: String
    @State private var userInput = ""
    
    func setUserName() {
        userName = userInput
    }
    var body: some View {
        VStack {
            TextField("Username", text: $userInput)
            NavigationLink(destination: EasyGameView(words: words).onAppear {
                self.setUserName()
            }) {
                Text("Submit")
                    .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.gray).opacity(0.5))
            }
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView(userName: .constant("Kiet"))
    }
}
