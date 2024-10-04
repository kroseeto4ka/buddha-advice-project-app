//
//  BuddhaManager.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

import Foundation

class BuddhaManager {
    func getData() -> [BuddhaModel] {
        return [
            BuddhaModel(imageName: "buddhaDesert", quote: "Три вещи нельзя скрыть: солнце, луну и истину."),
            BuddhaModel(imageName: "buddhaCity", quote: "Отпусти то, что не принадлежит тебе. Освободившись, ты надолго обретёшь счастье и благо."),
            BuddhaModel(imageName: "buddhaMountains", quote: "Счастье не придёт к тем, кто не умеет ценить того, что уже имеет."),
            BuddhaModel(imageName: "buddhaWinter", quote: "В этом мире ненависть никогда не искоренить с помощью ненависти. Победить ненависть сможет только любовь. Это вечный закон."),
            BuddhaModel(imageName: "buddhaOcean", quote: "Учитель приходит, когда ученик готов."),
            BuddhaModel(imageName: "buddhaRainforest", quote: "Ты будешь наказан не за свой гнев; ты будешь наказан своим гневом")
        ]
    }
}
