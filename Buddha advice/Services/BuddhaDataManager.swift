//
//  BuddhaDataManager.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

class BuddhaDataManager: IBuddha {
    private var buddhas: [BuddhaModel] = []
    private var currentIndex = 0
    
    init(buddhas: [BuddhaModel]) {
        let sortedBuddhas = sortBuddhas(buddhas)
        
        for buddha in sortedBuddhas {
            print("\(buddha.number) - \(buddha.imageName)")
        }
        self.buddhas = sortedBuddhas
    }
    
    func getCurrentBuddha() -> BuddhaModel {
        buddhas[currentIndex]
    }
    
    func getNextBuddha() -> BuddhaModel {
        if currentIndex == buddhas.count - 1 {
            currentIndex = 0
        } else {
            currentIndex += 1
        }
        return getCurrentBuddha()
    }
    
    func getPreviousBuddha() -> BuddhaModel {
        if currentIndex == 0 {
            currentIndex = buddhas.count - 1
        } else {
            currentIndex -= 1
        }
        return getCurrentBuddha()
    }
    
    func getFirstBuddha() -> BuddhaModel {
        currentIndex = 0
        return getCurrentBuddha()
    }
    
    func getRandomBuddha() -> BuddhaModel {
        let randomIndex = Int.random(in: 0...(buddhas.count - 1))
        currentIndex = randomIndex
        return getCurrentBuddha()
    }
    
    private func sortBuddhas(_ array: [BuddhaModel]) -> [BuddhaModel] {
        array.sorted(by: <)
    }
}

