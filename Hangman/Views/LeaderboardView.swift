//
//  LeaderboardView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    
    @State private var userRecord: [UserRecord] = []
    @State private var animatingListRow = false
    @State var gameLanguage: String
    @State private var order = 1
    
    @Environment(\.dismiss) var dismiss
    
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
    
    func resetArray() {
        userRecord.removeAll()
    }
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 5)
                .edgesIgnoringSafeArea(.vertical)
            
            ScrollView (showsIndicators: false) {
                VStack {
                    Text(gameLanguage == "english" ? "Leaderboard" : "Bảng xếp hạng")
                        .font(.system(size: 40))
                        .fontWeight(.heavy)
                        .multilineTextAlignment(.leading)
                        .foregroundColor(.white)
                    ForEach(Array(userRecord.enumerated()), id: \.offset) { record in
                        LeaderboardRow(order: record.offset + 1, record: record.element)
                    }
                }
                .navigationBarBackButtonHidden(true)
            }
        }
        .onAppear {
            self.userRecord = load().sorted {
                $0.score > $1.score
            }
            print(userRecord)
        }
        .onDisappear {
            resetArray()
        }
        .toolbar {
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.uturn.left").font(.system(size: 15)).fontWeight(.bold)
                        Text(gameLanguage == "english" ? "Return" : "Quay lại")
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(gameLanguage: "english")
    }
}
