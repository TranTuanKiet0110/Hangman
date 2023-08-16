//
//  LeaderboardView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import SwiftUI

struct LeaderboardView: View {
    
    @State var userRecord: Array<UserRecord>
    @State private var animatingListRow = false
    
    var body: some View {
        VStack {
            List(userRecord) { record in
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
                .onAppear(perform: {
                    self.animatingListRow = true
                })
            }
        }
    }
}

struct LeaderboardView_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardView(userRecord: [UserRecord(id: UUID(), userName: "Kiet", score: 0)])
    }
}
