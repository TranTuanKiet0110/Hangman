/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Tran Tuan Kiet
  ID: 3879300
  Created  date: 13/08/2023
  Last modified: 05/09/2023
  Acknowledgement: 
*/

import SwiftUI

struct LeaderboardView: View {
    
    @State private var userRecord: [UserRecord] = []
    @State private var animatingListRow = false
    @State var gameLanguage: String
    @State private var order = 1
    @State private var openAchievement = false
    
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
    } //load json file to get player's results
    
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
                        LeaderboardRow(openAchievement: $openAchievement, order: record.offset + 1, record: record.element)
                    }
                }
                .navigationBarBackButtonHidden(true) //hide back button
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
        .toolbar { //modify toolbar with custom button
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarLeading) {
                Button {
                    dismiss()
                } label: {
                    HStack {
                        Image(systemName: "arrow.uturn.left")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                        Text(gameLanguage == "english" ? "Return" : "Quay lại")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                    }
                    .foregroundColor(.white)
                }
            }
            
            ToolbarItem(placement: ToolbarItemPlacement.navigationBarTrailing) {
                Button {
                    openAchievement.toggle()
                } label: {
                    HStack {
                        Text(gameLanguage == "english" ? "Achievement" : "Thành tích")
                            .font(.system(size: 15))
                            .fontWeight(.bold)
                        Image(systemName: "medal.fill")
                            .font(.system(size: 15))
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
