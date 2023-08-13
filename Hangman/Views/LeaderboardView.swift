//
//  LeaderboardView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    
    @State var userRecord: Array<UserRecord>
//    @State var currentUserName: String
//    @State var userRecord: [UserRecord] = []
    
    var body: some View {
        VStack {
            List(userRecord) { record in
                HStack {
                    Text("\(record.userName)")
                    Spacer()
                    Text("\(record.score)")
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
