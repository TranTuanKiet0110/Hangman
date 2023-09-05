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

import Foundation
import SwiftUI

struct UserRecord: Identifiable, Codable {
    var id: UUID
    var userName: String
    var score: Int
}
