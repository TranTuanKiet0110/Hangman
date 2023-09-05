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

var mediumWords = decodeMediumWordJsonFile(jsonFileName: "mediumWords.json")

func decodeMediumWordJsonFile(jsonFileName: String) -> [MediumWord] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([MediumWord].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [] as [MediumWord]
}
