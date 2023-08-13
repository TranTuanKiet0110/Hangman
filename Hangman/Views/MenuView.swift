//
//  MenuView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import SwiftUI

struct MenuView: View {
    @State private var userName = ""
    @State private var isStart = false
    
    var body: some View {
        NavigationView {
            NavigationLink(destination: RegisterView(userName: $userName)) {
                Text("Start")
                    .frame(width: 200, height: 60).background(RoundedRectangle(cornerRadius: 16, style: .continuous).foregroundColor(.red))
            }
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
