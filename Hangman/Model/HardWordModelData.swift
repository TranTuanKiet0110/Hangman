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

var hardWords = decodeHardWordJsonFile(jsonFileName: "hardWords.json")

func decodeHardWordJsonFile(jsonFileName: String) -> [HardWord] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([HardWord].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [] as [HardWord]
}
