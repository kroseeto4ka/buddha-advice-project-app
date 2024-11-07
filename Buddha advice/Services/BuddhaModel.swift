//
//  BuddhaModel.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

struct BuddhaModel {
    let imageName: String
    let quote: String
    let number: Int
    var isMark = false
}

// MARK: - Comparable
extension BuddhaModel: Comparable {
    static func < (lhs: BuddhaModel, rhs: BuddhaModel) -> Bool {
        lhs.number < rhs.number
    }
    
    static func > (lhs: BuddhaModel, rhs: BuddhaModel) -> Bool {
        lhs.number > rhs.number
    }
    
    static func <= (lhs: BuddhaModel, rhs: BuddhaModel) -> Bool {
        lhs.number <= rhs.number
    }
    
    static func >= (lhs: BuddhaModel, rhs: BuddhaModel) -> Bool {
        lhs.number >= rhs.number
    }
}

// MARK: - CustomStringConvertible
extension BuddhaModel: CustomStringConvertible {
    var description: String {
        "Порядок: \(number), Название картинки: \(imageName)"
    }
}
