//
//  Key.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 25/08/2023.
//

import Foundation
import SwiftUI

struct Key: Identifiable, Codable {
    var id: Int
    var name: String
    var isClick: Bool
}

