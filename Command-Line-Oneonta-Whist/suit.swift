public enum Suit: Int, Comparable {
    case Clubs, Diamonds, Hearts, Spades, Joker
    
    static var allCases: [Suit] {
        var value = 0
        var cases: [Suit] = []
        while let suit = Suit(rawValue: value) {
            cases.append(suit)
            value += 1
        }
        return cases
    }
    
    public var description: String {
        switch self {
        case .Clubs:
            return "Club"
        case .Diamonds:
            return "Diamond"
        case .Hearts:
            return "Heart"
        case .Spades:
            return "Spade"
        case .Joker:
            return "Joker"
        }
    }
}

// MARK: - Comparable
public func ==(x: Suit, y: Suit) -> Bool {
    return x.rawValue == y.rawValue
}

public func <(x: Suit, y: Suit) -> Bool {
    return x.rawValue < y.rawValue
}