//
//  LeaderboardView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    
    @State var userRecord: Array<UserRecord>
    
    var body: some View {
        VStack {
            List(userRecord) { record in
                HStack {
                    HStack {
                        Text("Player:")
                        Spacer()
                        Text("\(record.userName)")
                    }.frame(width: UIScreen.main.bounds.width/2 - 40)
                    Divider()
                    HStack {
                        Text("Score:")
                        Spacer()
                        Text("\(record.score)")
                    }.frame(width: UIScreen.main.bounds.width/2 - 40)
                }
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(userRecord: [UserRecord(id: UUID(), userName: "Kiet", score: 0)])
    }
}
