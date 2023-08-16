//
//  UserRecord.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 13/08/2023.
//

import Foundation
import SwiftUI

struct UserRecord: Identifiable, Codable {
    var id: UUID
    var userName: String
    var score: Int
}
