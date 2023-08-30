//
//  GuideView.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 29/08/2023.
//

import SwiftUI

struct GuideView: View {
    
    @State var gameLanguage: String
    @State private var lockScroll = true
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack {
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .blur(radius: 9)
                .edgesIgnoringSafeArea(.vertical)
            ScrollViewReader { value in
                ScrollView(.horizontal, showsIndicators: false){
                    HStack {
                        
                        Spacer()
                            .frame(width: 10)
                        VStack {
                            Text(gameLanguage == "english" ?"Game's menu" : "Menu game")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("menu")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text(gameLanguage == "english" ? "- Start game: Tap \"Start!\" button.\n- Open leaderboard: Tap \"🏆\" button.\n- Open game's settings: Tap gear button in the upper-right corner." : "- Nhấn nút \"Bắt đầu\" để vào trò chơi.\n- Nhấn nút \"🏆\" để mở bảng xếp hạng.\n- Nhấn nút \"Răng cưa\" để mở cài đặt game.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                            HStack {
                                
                                Spacer()
                                Button {
                                    value.scrollTo(2)
                                } label: {
                                    HStack {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 40)
                            }
                        }
                        .id(1)
                        .frame(width: UIScreen.main.bounds.width)
                        
                        VStack {
                            Text(gameLanguage == "english" ?"Game's settings" : "Cài đặt")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("setting")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text(gameLanguage == "english" ? "- Change game's difficulty: Tap on the difficulty indicator.\n- Change light/dark mode: Toggle the dark mode button.\n- Change language: Tap on the languages indicator." : "- Chọn độ khó trên thanh độ khó của game.\n- Bật chế độ tối bằng cách nhấn vào nút chế độ tối.\n- Thay đổi ngôn ngữ bằng cách chọn trên thanh ngôn ngữ")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                            
                            HStack {
                                
                                Spacer()
                                    .frame(width: 40)
                                Button {
                                    value.scrollTo(1)
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Text("Previous")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                Button {
                                    value.scrollTo(3)
                                } label: {
                                    HStack {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 40)
                            }
                        }
                        .id(2)
                        .frame(width: UIScreen.main.bounds.width + 17)
                        
                        VStack {
                            Text(gameLanguage == "english" ? "Register page" : "Điền thông tin")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("register")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text(gameLanguage == "english" ? "- Enter your name in the text field.\n- Press play button to play." : "- Điền tên của bạn.\n- Nhấn nút chơi để bắt đầu.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                            
                            HStack {
                                
                                Spacer()
                                    .frame(width: 40)
                                Button {
                                    value.scrollTo(2)
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Text("Previous")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                Button {
                                    value.scrollTo(4)
                                } label: {
                                    HStack {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 40)
                            }
                        }
                        .id(3)
                        .frame(width: UIScreen.main.bounds.width + 17)
                        
                        VStack {
                            Text(gameLanguage == "english" ? "Gameplay" : "Lối chơi")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("game")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text(gameLanguage == "english" ? "- Guess the word base on the picture given.\n- If succeed: score + 1.\n- Choose a wrong letter: HP - 1.\n- No ending until HP = 0, Win if get \"Highscore\"." : "- Đoán chữ dựa trên hình được cho.\n- Hoàn thành: +1 điểm.\n- Đoán sai chữ cái: -1 HP.\n- Không có kết thúc cho đến khi HP = 0, bạn sẽ thắng nếu như bạn được \"Kỷ lục mới\"")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                            
                            HStack {
                                
                                Spacer()
                                    .frame(width: 40)
                                Button {
                                    value.scrollTo(3)
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Text("Previous")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                Button {
                                    value.scrollTo(5)
                                } label: {
                                    HStack {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 40)
                            }
                        }
                        .id(4)
                        .frame(width: UIScreen.main.bounds.width + 17)
                        
                        VStack {
                            Text(gameLanguage == "english" ? "Pause" : "Tạm dừng trò chơi")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("pause")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text(gameLanguage == "english" ? "- Continue: Tap \"Play\" button.\n- Quit: Tap \"Door\" button.\n- Reset character: Tap \"Reset\" button." : "- Để tiếp tục: Nhấn nút chơi.\n- Nhấn nút thoát để trở về màn hình chính.\n- Nhấn nút đặt lại để xoá dữ liệu.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                            
                            HStack {
                                
                                Spacer()
                                    .frame(width: 40)
                                Button {
                                    value.scrollTo(4)
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Text("Previous")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                Button {
                                    value.scrollTo(6)
                                } label: {
                                    HStack {
                                        Text("Next")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Image(systemName: "arrow.right")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                    .frame(width: 40)
                            }
                        }
                        .id(5)
                        .frame(width: UIScreen.main.bounds.width + 17)
                        
                        VStack {
                            Text(gameLanguage == "english" ? "Game's Result" : "Màn hình kết thúc")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .fontWeight(.bold)
                            Image("result")
                                .resizable()
                                .frame(width: 200,height: 400)
                            Text(gameLanguage == "english" ? "- Save result: Tap \"Save\" button.\n- Quit: Tap \"Reset\" or \"Door\" button.\n- Saved result will be recorded into leaderboard." : "- Nhấn nút \"lưu\" để lưu kết quả vào bảng xếp hạng.\n- Nhấn nút \"Đặt lại\" hoặc \"Thoát\" để trở lại màn hình chính.")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .padding(.horizontal)
                                .frame(width: UIScreen.main.bounds.width - 20, height: 200, alignment: .leading)
                                .background(RoundedRectangle(cornerRadius: 16).foregroundColor(.gray).opacity(0.5))
                            
                            HStack {
                                
                                Spacer()
                                    .frame(width: 40)
                                Button {
                                    value.scrollTo(5)
                                } label: {
                                    HStack {
                                        Image(systemName: "arrow.left")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                        Text("Previous")
                                            .foregroundColor(.white)
                                            .font(.system(size: 15))
                                            .fontWeight(.bold)
                                    }
                                }
                                
                                Spacer()
                                
                            }
                        }
                        .id(6)
                        .frame(width: UIScreen.main.bounds.width + 17)
                        
                        Spacer()
                            .frame(width: 10)
                    }
                    .navigationTitle(gameLanguage == "english" ? "Game's guide" : "Hướng dẫn")
                    .navigationBarBackButtonHidden(true)
                }
//                .onTapGesture {
//                    value.scrollTo(6)
//                }
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
}

struct GuideView_Previews: PreviewProvider {
    static var previews: some View {
        GuideView(gameLanguage: "english")
    }
}
