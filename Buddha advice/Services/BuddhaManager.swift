//
//  BuddhaManager.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

class BuddhaManager: IBuddhaManager {
    func getData() -> [BuddhaModel] {
        return [
            BuddhaModel(imageName: Images.image8,
                        quote: Quotes.quote8,
                        number: 8,
                        isMark: true),
            BuddhaModel(imageName: Images.image9,
                        quote: Quotes.quote9,
                        number: 9),
            BuddhaModel(imageName: Images.image10,
                        quote: Quotes.quote10,
                        number: 10),
            BuddhaModel(imageName: Images.image11,
                        quote: Quotes.quote11,
                        number: 11),
            BuddhaModel(imageName: Images.image12,
                        quote: Quotes.quote12,
                        number: 12),
            BuddhaModel(imageName: Images.image13,
                        quote: Quotes.quote13,
                        number: 13),
            BuddhaModel(imageName: Images.image14,
                        quote: Quotes.quote14,
                        number: 14),
            BuddhaModel(imageName: Images.image15,
                        quote: Quotes.quote15,
                        number: 15),
            BuddhaModel(imageName: Images.image16,
                        quote: Quotes.quote16,
                        number: 16),
            BuddhaModel(imageName: Images.image17,
                        quote: Quotes.quote17,
                        number: 17),
            BuddhaModel(imageName: Images.image18,
                        quote: Quotes.quote18,
                        number: 18),
            BuddhaModel(imageName: Images.image1,
                        quote: Quotes.quote1,
                        number: 1),
            BuddhaModel(imageName: Images.image2,
                        quote: Quotes.quote2,
                        number: 2),
            BuddhaModel(imageName: Images.image3,
                        quote: Quotes.quote3,
                        number: 3),
            BuddhaModel(imageName: Images.image4,
                        quote: Quotes.quote4,
                        number: 4),
            BuddhaModel(imageName: Images.image5,
                        quote: Quotes.quote5,
                        number: 5),
            BuddhaModel(imageName: Images.image6,
                        quote: Quotes.quote6,
                        number: 6),
            BuddhaModel(imageName: Images.image7,
                        quote: Quotes.quote7,
                        number: 7)
        ]
    }
}

// MARK: - Constants
extension BuddhaManager {
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
        static let quote12 = "Счастье — это не удачное сочетание внешних обстоятельств. Это просто состояние вашего ума."
        static let quote13 = "Тот может, кто думает, что может."
        static let quote14 = "Терпение — это противоядие от гнева."
        static let quote15 = "Тот, кто сидит в одиночестве, спит в одиночестве, бродит в одиночестве, тот, кто деятелен и сдерживает себя сам, пусть радуется в лесной чаще."
        static let quote16 = "Ни на земле, ни на небе, ни в океане, ни в горах не отыскать места, где бы человека не смогла победить смерть."
        static let quote17 = "Даже ливень из золотых монет не принесет удовлетворения страстям. Мудр тот, кто знает: страсти болезненны и мало от них радости."
        static let quote18 = "Приятно смотреть на благородных; быть в их обществе — благо. Да будет всегда счастлив тот, кто не видит глупцов."
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
        static let image12 = "buddhaOasis"
        static let image13 = "buddhaSavanna"
        static let image14 = "buddhaRockyBeach"
        static let image15 = "buddhaRiver"
        static let image16 = "buddhaPines"
        static let image17 = "buddhaField"
        static let image18 = "buddhaCorals"
    }
}
