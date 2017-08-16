struct Hand: CustomStringConvertible {
    private(set) var cards: [Card]
    
    var description: String {
        var string = ""
        cards.forEach { (card) in
            string += card.description
        }
        return string
    }
    var suit: [Suit] {
        var suit: [Suit] = []
        for i in 0..<cards.count{
            suit.append(cards[i].suit)
        }
        return suit
    }
    func play(index: Int) -> [Card]? {
        var playCard: [Card] = []
        playCard.append(cards[index])
        return playCard
    }
    mutating func discard(index: Int) {
        cards.remove(at: index)
    }
    mutating func sort() {
        self.cards = self.cards.sorted()
    }
}
