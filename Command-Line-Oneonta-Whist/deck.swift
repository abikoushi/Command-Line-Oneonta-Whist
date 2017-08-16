import Foundation

struct Deck {
    private(set) var cards: [Card] = []
    
    init() {
        cards = [
            Card(suit: .Clubs, rank: .Ace),
            Card(suit: .Clubs, rank: .King),
            Card(suit: .Clubs, rank: .Queen),
            Card(suit: .Clubs, rank: .Jack),
            Card(suit: .Clubs, rank: .Ten),
            //
            Card(suit: .Diamonds, rank: .Ace),
            Card(suit: .Diamonds, rank: .King),
            Card(suit: .Diamonds, rank: .Queen),
            Card(suit: .Diamonds, rank: .Jack),
            Card(suit: .Diamonds, rank: .Ten),
            //
            Card(suit: .Hearts, rank: .Ace),
            Card(suit: .Hearts, rank: .King),
            Card(suit: .Hearts, rank: .Queen),
            Card(suit: .Hearts, rank: .Jack),
            Card(suit: .Hearts, rank: .Ten),
            //
            Card(suit: .Spades, rank: .Ace),
            Card(suit: .Spades, rank: .King),
            Card(suit: .Spades, rank: .Queen),
            Card(suit: .Spades, rank: .Jack),
            Card(suit: .Spades, rank: .Ten),
            //
            Card(suit: .Joker, rank: .Small),
            Card(suit: .Joker, rank: .Large)
        ]
    }
    
    mutating func shuffle() {
        for _ in 0..<100 {
            let cardsCount = UInt32(cards.count)
            let removeIndex = Int(arc4random_uniform(cardsCount))
            let insertIndex = Int(arc4random_uniform(cardsCount - 1))
            let card = cards.remove(at: removeIndex)
            cards.insert(card, at: insertIndex)
        }
    }
    
    mutating func draw(count: Int) -> [Card]? {
        
        var drawCards: [Card] = []
        for _ in 0..<count {
            drawCards.append(cards.removeFirst())
        }
        return drawCards
    }
}