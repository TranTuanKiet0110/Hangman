/*
  RMIT University Vietnam
  Course: COSC2659 iOS Development
  Semester: 2023B
  Assessment: Assignment 2
  Author: Tran Tuan Kiet
  ID: 3879300
  Created  date: 25/08/2023
  Last modified: 05/09/2023
  Acknowledgement: 
*/

import Foundation
import SwiftUI

struct MediumWord: Identifiable, Codable {
    var id: Int
    var word: String
    var imageName: String
    var image: Image {
        Image(imageName)
    }
}

