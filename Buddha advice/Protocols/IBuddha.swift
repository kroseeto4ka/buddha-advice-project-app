

protocol IBuddha {
    func getCurrentBuddha() -> BuddhaModel
    func getNextBuddha() -> BuddhaModel
    func getPreviousBuddha() -> BuddhaModel
    func getFirstBuddha() -> BuddhaModel
    func getRandomBuddha() -> BuddhaModel
    func getCertainBuddha(name: String?) -> BuddhaModel?
    func getBuddhas() -> [BuddhaModel]
    func changeMark(index: Int)
    func removeBuddha(index: Int)
}
