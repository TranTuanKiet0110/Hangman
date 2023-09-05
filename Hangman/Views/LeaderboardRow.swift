/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Tran Tuan Kiet
  ID: 3879300
  Created  date: 29/08/2023
  Last modified: 05/09/2023
  Acknowledgement: 
*/

import SwiftUI

struct LeaderboardRow: View {
    
    @Binding var openAchievement: Bool
    
    @State private var isTop1 = false
    @State private var isTop2 = false
    @State private var isTop3 = false
    @State private var isNormal = false
    
    var order: Int
    var record: UserRecord
    
    func checkOrder() { //check for order in the leaderboard
        if order == 1 {
            isTop1 = true
            isTop2 = false
            isTop3 = false
            isNormal = false
        } else if order == 2 {
            isTop1 = false
            isTop2 = true
            isTop3 = false
            isNormal = false
        } else if order == 3 {
            isTop1 = false
            isTop2 = false
            isTop3 = true
            isNormal = false
        } else {
            isNormal = true
            isTop1 = false
            isTop2 = false
            isTop3 = false
        }
    }
    
    var body: some View {
        VStack {
            //check condition for order, different order have different achievements
            if isTop1 {
                VStack {
                    HStack {
                        
                        Spacer()
                            .frame(width: 20)
                        Text("\(order).")
                            .modifier(RecordOrder())
                        Text(record.userName)
                            .modifier(RecordDetail())
                        
                        Spacer()
                        Text("\(record.score)")
                            .modifier(RecordDetail())
                        Spacer()
                            .frame(width: 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.yellow))
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 10)
                        Text("Achievements")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(height: 50)
                        
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image("gold-medal")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Gold medal")
                                    .modifier(AchievementName())
                                Text("Obtain by getting Top 1.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image("trophy")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Top of the world!")
                                    .modifier(AchievementName())
                                Text("Obtain by standing at the Top of the leaderboard.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image(record.score >= 50 ? "veteran" : "newbie")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .modifier(AchievementName())
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: openAchievement ? 500 : 0, alignment: .top)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.5))
                    .clipped()
                }
            } else if isTop2 {
                VStack {
                    
                    HStack {
                        
                        Spacer()
                            .frame(width: 20)
                        Text("\(order).")
                            .modifier(RecordOrder())
                        Text(record.userName)
                            .modifier(RecordDetail())
                        
                        Spacer()
                        Text("\(record.score)")
                            .modifier(RecordDetail())
                        Spacer()
                            .frame(width: 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.gray).brightness(0.2))
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 10)
                        Text("Achievements")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(height: 50)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image("silver-medal")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Silver medal")
                                    .modifier(AchievementName())
                                Text("Obtain by getting Top 2.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image("blessing")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Blessing from the Dev!")
                                    .modifier(AchievementName())
                                Text("The dev feels sorry for you. Obtain by getting Top 2.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image(record.score >= 50 ? "veteran" : "newbie")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .modifier(AchievementName())
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: openAchievement ? 500 : 0, alignment: .top)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.5))
                    .clipped()
                }
            } else if isTop3 {
                VStack {
                    HStack {
                        
                        Spacer()
                            .frame(width: 20)
                        Text("\(order).")
                            .modifier(RecordOrder())
                        Text(record.userName)
                            .modifier(RecordDetail())
                        
                        Spacer()
                        Text("\(record.score)")
                            .modifier(RecordDetail())
                        Spacer()
                            .frame(width: 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.brown))
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 10)
                        Text("Achievements")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(height: 50)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image("bronze-medal")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Bronze medal")
                                    .modifier(AchievementName())
                                Text("Obtain by getting Top 3.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image("gift")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Surprise gift!")
                                    .modifier(AchievementName())
                                Text("Gift from the dev. Obtain by getting Top 3.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                        
                        Spacer()
                            .frame(height: 30)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image(record.score >= 50 ? "veteran" : "newbie")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .modifier(AchievementName())
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: openAchievement ? 500 : 0, alignment: .top)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.5))
                    .clipped()
                }
            } else if isNormal {
                VStack {
                    HStack {
                        
                        Spacer()
                            .frame(width: 20)
                        Text("\(order).")
                            .modifier(RecordOrder())
                        Text(record.userName)
                            .modifier(RecordDetail())
                        
                        Spacer()
                        Text("\(record.score)")
                            .modifier(RecordDetail())
                        Spacer()
                            .frame(width: 20)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: 70)
                    .background(RoundedRectangle(cornerRadius: 50).foregroundColor(.gray).opacity(0.5))
                    
                    VStack {
                        
                        Spacer()
                            .frame(height: 10)
                        Text("Achievements")
                            .font(.system(size: 20))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                            .frame(height: 50)
                        HStack {
                            
                            Spacer()
                                .frame(width: 20)
                            Image(record.score >= 50 ? "veteran" : "newbie")
                                .resizable()
                                .modifier(AchievementImage())
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .modifier(AchievementName())
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .modifier(AchievementDescription())
                            }
                            
                            Spacer()
                                .frame(width: 20)
                        }
                        .frame(width: UIScreen.main.bounds.width - 30, height: 100)
                    }
                    .frame(width: UIScreen.main.bounds.width - 30, height: openAchievement ? 250 : 0, alignment: .top)
                    .background(RoundedRectangle(cornerRadius: 15).foregroundColor(.gray).opacity(0.5))
                    .clipped()
                }
            }
        }
        
        .onAppear {
            checkOrder()
        }
    }
}

struct LeaderboardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardRow(openAchievement: .constant(false), order: 1, record: UserRecord(id: UUID(), userName: "Kiet", score: 10))
    }
}
