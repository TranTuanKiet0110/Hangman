//
//  Word.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import Foundation
import SwiftUI

struct EasyWord: Identifiable, Codable {
    var id: Int
    var word: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
    var hint: String
}
