//
//  HardWord.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 25/08/2023.
//

import Foundation
import SwiftUI

struct HardWord: Identifiable, Codable {
    var id: Int
    var word: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}
