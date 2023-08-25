//
//  HardWordModelData.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 25/08/2023.
//

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
