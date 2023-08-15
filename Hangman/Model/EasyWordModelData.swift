//
//  ModelData.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 12/08/2023.
//

import Foundation

var words = decodeJsonFile(jsonFileName: "easyWords.json")

func decodeJsonFile(jsonFileName: String) -> [EasyWord] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([EasyWord].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [] as [EasyWord]
}
