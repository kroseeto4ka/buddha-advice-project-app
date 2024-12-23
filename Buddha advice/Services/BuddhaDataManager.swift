//
//  BuddhaDataManager.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

class BuddhaDataManager {
    var buddhas: [BuddhaModel] = []
    private var currentIndex = 0
    
    init(buddhas: [BuddhaModel]) {
        let sortedBuddhas = sortBuddhas(buddhas)
        
        for buddha in sortedBuddhas {
            print("\(buddha.number) - \(buddha.imageName)")
        }
        self.buddhas = sortedBuddhas
    }
    
    private func sortBuddhas(_ array: [BuddhaModel]) -> [BuddhaModel] {
        array.sorted(by: <)
    }
}

//MARK: - IBuddha
extension BuddhaDataManager: IBuddha {
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
    
    func getCertainBuddha(name: String?) -> BuddhaModel? {
        for buddha in buddhas {
            if name == buddha.imageName {
                return buddha
            }
        }
        return nil
    }
    
    func getBuddhas() -> [BuddhaModel] {
        buddhas
    }
    
    func getMarkedBuddhas() -> [BuddhaModel] {
            var markedBuddhas: [BuddhaModel] = []
            for buddha in buddhas {
                if buddha.isMark {
                    markedBuddhas.append(buddha)
                }
            }
            return markedBuddhas
        }
    func changeMark(index: Int) {
        buddhas[index].isMark = !buddhas[index].isMark
    }
    
    func removeBuddha(index: Int) {
        buddhas.remove(at: index)
    }
    
    func toggleMarked(_ buddha: BuddhaModel) {
        if let index = buddhas.firstIndex(of: buddha) {
            buddhas[index].isMark.toggle()
        }
    }
}
