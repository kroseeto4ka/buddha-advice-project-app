//
//  BuddhaManager.swift
//  Buddha advice
//
//  Created by Никита Сорочинский on 03.10.2024.
//

struct BuddhaManager {
    func getData() -> [BuddhaModel] {
        return [
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
                        number: Advices.advice11),
            BuddhaModel(imageName: Images.image12,
                        quote: Quotes.quote12,
                        number: Advices.advice12),
            BuddhaModel(imageName: Images.image13,
                        quote: Quotes.quote13,
                        number: Advices.advice13),
            BuddhaModel(imageName: Images.image14,
                        quote: Quotes.quote14,
                        number: Advices.advice14),
            BuddhaModel(imageName: Images.image15,
                        quote: Quotes.quote15,
                        number: Advices.advice15),
            BuddhaModel(imageName: Images.image16,
                        quote: Quotes.quote16,
                        number: Advices.advice16),
            BuddhaModel(imageName: Images.image17,
                        quote: Quotes.quote17,
                        number: Advices.advice17),
            BuddhaModel(imageName: Images.image18,
                        quote: Quotes.quote18,
                        number: Advices.advice18),
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
                        number: Advices.advice7)
        ]
    }
}

// MARK: - Constants
extension BuddhaManager {
    enum Advices {
        static let advice1 = 1
        static let advice2 = 2
        static let advice3 = 3
        static let advice4 = 4
        static let advice5 = 5
        static let advice6 = 6
        static let advice7 = 7
        static let advice8 = 8
        static let advice9 = 9
        static let advice10 = 10
        static let advice11 = 11
        static let advice12 = 12
        static let advice13 = 13
        static let advice14 = 14
        static let advice15 = 15
        static let advice16 = 16
        static let advice17 = 17
        static let advice18 = 18
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
