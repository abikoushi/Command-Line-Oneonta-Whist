public struct Card: Comparable {
    public let suit: Suit
    public let rank: Rank
    

    public var description: String {
        return "\(rank.description) of \(suit.description)"
    }
    
    public init(suit: Suit, rank: Rank) {
        self.suit = suit
        self.rank = rank
    }
}


// MARK: - Comparable
public func ==(x: Card, y: Card) -> Bool {
    return x.rank == y.rank && x.suit == y.suit
}

public func <(x: Card, y: Card) -> Bool {
    if(x.suit != y.suit){
        return x.suit < y.suit
    }else{
        return x.rank < y.rank
    }
}