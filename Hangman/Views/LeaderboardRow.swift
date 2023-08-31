//
//  LeaderboardRow.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 29/08/2023.
//

import SwiftUI

struct LeaderboardRow: View {
    
    @Binding var openAchievement: Bool
    
    @State private var isTop1 = false
    @State private var isTop2 = false
    @State private var isTop3 = false
    @State private var isNormal = false
    
    var order: Int
    var record: UserRecord
    
    func checkOrder() {
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
            if isTop1 {
                VStack {
                    HStack {
                        
                        Spacer()
                            .frame(width: 20)
                        Text("\(order).")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(record.userName)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        Text("\(record.score)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Gold medal")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Obtain by getting Top 1.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Top of the world!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Obtain by standing at the Top of the leaderboard.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(record.userName)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        Text("\(record.score)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Silver medal")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Obtain by getting Top 2.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Blessing from the Dev!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("The dev feels sorry for you. Obtain by getting Top 2.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(record.userName)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        Text("\(record.score)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Bronze medal")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Obtain by getting Top 3.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text("Surprise gift!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text("Gift from the dev. Obtain by getting Top 3.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text(record.userName)
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        Text("\(record.score)")
                            .font(.system(size: 25))
                            .fontWeight(.bold)
                            .foregroundColor(.white)
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
                                .frame(width: 50, height: 50)
                            
                            Spacer()
                                .frame(width: 10)
                            VStack {
                                Text(record.score >= 50 ? "Veteran!" : "Newbie!")
                                    .font(.system(size: 15))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                Text(record.score >= 50 ? "Obtain by getting score above or equal to 50." : "Obtain by getting score below 50.")
                                    .font(.system(size: 15))
                                    .foregroundColor(.white)
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
