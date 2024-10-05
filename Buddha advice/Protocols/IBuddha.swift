

protocol IBuddha {
    func getCurrentBuddha() -> BuddhaModel
    func getNextBuddha() -> BuddhaModel
    func getPreviousBuddha() -> BuddhaModel
    func getFirstBuddha() -> BuddhaModel
}
