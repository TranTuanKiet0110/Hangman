//
//  MediumWordModelData.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 25/08/2023.
//

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