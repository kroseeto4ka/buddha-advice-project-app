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
            BuddhaModel(imageName: "buddhaDesert", quote: "Три вещи нельзя скрыть: солнце, луну и истину.", number: "Совет №1"),
            BuddhaModel(imageName: "buddhaCity", quote: "Отпусти то, что не принадлежит тебе. Освободившись, ты надолго обретёшь счастье и благо.", number: "Совет №2"),
            BuddhaModel(imageName: "buddhaMountains", quote: "Счастье не придёт к тем, кто не умеет ценить того, что уже имеет.", number: "Совет №3"),
            BuddhaModel(imageName: "buddhaWinter", quote: "В этом мире ненависть никогда не искоренить с помощью ненависти. Победить ненависть сможет только любовь. Это вечный закон.", number: "Совет №4"),
            BuddhaModel(imageName: "buddhaOcean", quote: "Учитель приходит, когда ученик готов.", number: "Совет №5"),
            BuddhaModel(imageName: "buddhaRainforest", quote: "Ты будешь наказан не за свой гнев; ты будешь наказан своим гневом", number: "Совет №6"),
            BuddhaModel(imageName: "buddhaFuji", quote: "Прежде чем выпрямлять горбатого, сделай нечто более трудное — расправь свои плечи.", number: "Совет №7")
        ]
    }
}
