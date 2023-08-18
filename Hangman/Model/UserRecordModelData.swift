//
//  UserRecordModelData.swift
//  Hangman
//
//  Created by Kiet Tran Tuan on 18/08/2023.
//

import Foundation

var userRecords = load(jsonFileName: "userRecord.json")

func load(jsonFileName: String) -> [UserRecord] {
    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
        if let data = try? Data(contentsOf: file) {
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode([UserRecord].self, from: data)
                return decoded
            } catch let error {
                fatalError("Failed to decode JSON: \(error)")
            }
        }
    } else {
        fatalError("Couldn't load \(jsonFileName) file")
    }
    return [] as [UserRecord]
}

//func save(userRecord: UserRecord, jsonFileName: String) {
//    if let file = Bundle.main.url(forResource: jsonFileName, withExtension: nil) {
//        do {
//            let encoder = JSONEncoder()
//            let encoded = try encoder.encode(userRecord)
//            try encoded.write(to: file)
//        } catch let error {
//            fatalError("Failed to encode data: \(error)")
//        }
//    } else {
//        fatalError("Couldn't find \(jsonFileName) file")
//    }
//}

