//
//  LeaderboardRow.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 29/08/2023.
//

import SwiftUI

struct LeaderboardRow: View {
    
    @State private var isTop1 = false
    @State private var isTop2 = false
    @State private var isTop3 = false
    var order: Int
    var record: UserRecord
    
    func checkOrder() {
        if order == 1 {
            isTop1 = true
            isTop2 = false
            isTop3 = false
        } else if order == 2 {
            isTop1 = false
            isTop2 = true
            isTop3 = false
        } else if order == 3 {
            isTop1 = false
            isTop2 = false
            isTop3 = true
        } else {
            isTop1 = false
            isTop2 = false
            isTop3 = false
        }
    }
    var body: some View {
        VStack {
            if isTop1 {
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
            } else if isTop2 {
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
            } else if isTop3 {
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
            } else {
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
            }
        }
        
        .onAppear {
            checkOrder()
        }
    }
}

struct LeaderboardRow_Previews: PreviewProvider {
    static var previews: some View {
        LeaderboardRow(order: 1, record: UserRecord(id: UUID(), userName: "Kiet", score: 10))
    }
}
