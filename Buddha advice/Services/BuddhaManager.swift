//
//  BuddhaManager.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

struct BuddhaManager {
    func getData() -> [BuddhaModel] {
        return [
            BuddhaModel(imageName: Images.image1,
                        quote: Quotes.quote1,
                        number: Advices.advice1),
            BuddhaModel(imageName: Images.image2,
                        quote: Quotes.quote2,
                        number: Advices.advice2),
            BuddhaModel(imageName: Images.image3,
                        quote: Quotes.quote3,
                        number: Advices.advice3),
            BuddhaModel(imageName: Images.image4,
                        quote: Quotes.quote4, number:
                            Advices.advice4),
            BuddhaModel(imageName: Images.image5,
                        quote: Quotes.quote5,
                        number: Advices.advice5),
            BuddhaModel(imageName: Images.image6,
                        quote: Quotes.quote6,
                        number: Advices.advice6),
            BuddhaModel(imageName: Images.image7,
                        quote: Quotes.quote7,
                        number: Advices.advice7),
            BuddhaModel(imageName: Images.image8,
                        quote: Quotes.quote8,
                        number: Advices.advice8),
            BuddhaModel(imageName: Images.image9,
                        quote: Quotes.quote9,
                        number: Advices.advice9),
            BuddhaModel(imageName: Images.image10,
                        quote: Quotes.quote10,
                        number: Advices.advice10),
            BuddhaModel(imageName: Images.image11,
                        quote: Quotes.quote11,
                        number: Advices.advice11)
        ]
    }
}

// MARK: - Constants
extension BuddhaManager {
    enum Advices {
        static let advice1 = "Совет №1"
        static let advice2 = "Совет №2"
        static let advice3 = "Совет №3"
        static let advice4 = "Совет №4"
        static let advice5 = "Совет №5"
        static let advice6 = "Совет №6"
        static let advice7 = "Совет №7"
        static let advice8 = "Совет №8"
        static let advice9 = "Совет №9"
        static let advice10 = "Совет №10"
        static let advice11 = "Совет №11"
    }
    
    enum Quotes {
        static let quote1 = "Отпусти то, что не принадлежит тебе. Освободившись, ты надолго обретёшь счастье и благо."
        static let quote2 = "Победи себя и выиграешь тысячи битв."
        static let quote3 = "Счастье не придёт к тем, кто не умеет ценить того, что уже имеет."
        static let quote4 = "В этом мире ненависть никогда не искоренить с помощью ненависти. Победить ненависть сможет только любовь. Это вечный закон."
        static let quote5 = "Учитель приходит, когда ученик готов."
        static let quote6 = "Ты будешь наказан не за свой гнев; ты будешь наказан своим гневом."
        static let quote7 = "Прежде чем выпрямлять горбатого, сделай нечто более трудное — расправь свои плечи."
        static let quote8 = "Ваши страдания вызваны вашим сопротивлением тому, что есть."
        static let quote9 = "Большая гордость приведёт к падению, а смирение — к победе."
        static let quote10 = "Всё, чем мы являемся, — это результат того, о чём мы думаем. Разум — это всё. Мысли материальны."
        static let quote11 = "Цепляться за чувство гнева — это как пить яд и ожидать, что вместо вас умрёт другой человек."
    }
    
    enum Images {
        static let image1 = "buddhaDesert"
        static let image2 = "buddhaCity"
        static let image3 = "buddhaMountains"
        static let image4 = "buddhaWinter"
        static let image5 = "buddhaOcean"
        static let image6 = "buddhaRainforest"
        static let image7 = "buddhaFuji"
        static let image8 = "buddhaFactory"
        static let image9 = "buddhaSwamp"
        static let image10 = "buddhaUnderwater"
        static let image11 = "buddhaCave"
    }
}
