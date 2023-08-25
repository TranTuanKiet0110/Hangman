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
    
    @Environment(\.dismiss) var dismiss
    
    func load() -> [UserRecord]{
        do {
            let url = try FileManager.default.url(for: .desktopDirectory, in: .userDomainMask, appropriateFor: nil, create: true).appendingPathComponent("test2.json")
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
        VStack {
            List(userRecord) { record in
                HStack {
                    HStack {
                        Text(gameLanguage == "english" ? "Player:" : "Tên:")
                        Spacer()
                        Text("\(record.userName)")
                            .opacity(animatingListRow ? 1 : 0)
                            .offset(y: animatingListRow ? 0 : 50)
                            .animation(.easeOut(duration: 1), value: animatingListRow)
                    }.frame(width: UIScreen.main.bounds.width/2 - 40)
                    Divider()
                    HStack {
                        Text(gameLanguage == "english" ? "Score:" : "Điểm:")
                        Spacer()
                        Text("\(record.score)")
                            .opacity(animatingListRow ? 1 : 0)
                            .offset(y: animatingListRow ? 0 : 50)
                            .animation(.easeOut(duration: 1), value: animatingListRow)
                    }.frame(width: UIScreen.main.bounds.width/2 - 40)
                }.navigationBarBackButtonHidden(true)
                    .onAppear {
                        self.animatingListRow = true
                    }
                    .navigationTitle(gameLanguage == "english" ? "Leaderboard" : "Bảng xếp hạng")
            }.toolbar {
                ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.uturn.left").font(.system(size: 15)).fontWeight(.bold)
                            Text("Return")
                                .fontWeight(.bold)
                        }
                    }
                }
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
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(gameLanguage: "english")
    }
}
