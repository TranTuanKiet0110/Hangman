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
    
//    func load() -> [UserRecord]{
//        let url = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent("test1.json")
//        if let url = url, let data = try? Data(contentsOf: url) {
//            let decoder = JSONDecoder()
//            if let loadedRecord = try? decoder.decode([UserRecord].self, from: data) {
//                return loadedRecord
//            }
//        }
//        return []
//    }
    
    func load(jsonFileName: String) {
        if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
            if let data = try? Data(contentsOf: file) {
                do {
                    let decoder = JSONDecoder()
                    let decoded = try decoder.decode([UserRecord].self, from: data)
                    userRecord = decoded
                } catch let error {
                    fatalError("Failed to decode JSON: \(error)")
                }
            }
        } else {
            fatalError("Couldn't load \(jsonFileName) file")
        }
    }
    
    var body: some View {
        VStack {
            List(userRecords) { record in
                HStack {
                    HStack {
                        Text("Player:")
                        Spacer()
                        Text("\(record.userName)")
                            .opacity(animatingListRow ? 1 : 0)
                                .offset(y: animatingListRow ? 0 : 50)
                                .animation(.easeOut(duration: 1), value: animatingListRow)
                    }.frame(width: UIScreen.main.bounds.width/2 - 40)
                    Divider()
                    HStack {
                        Text("Score:")
                        Spacer()
                        Text("\(record.score)")
                            .opacity(animatingListRow ? 1 : 0)
                                .offset(y: animatingListRow ? 0 : 50)
                                .animation(.easeOut(duration: 1), value: animatingListRow)
                    }.frame(width: UIScreen.main.bounds.width/2 - 40)
                }
                .onAppear{
                    load(jsonFileName: "userRecord.json")             
                    self.animatingListRow = true
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView()
    }
}
