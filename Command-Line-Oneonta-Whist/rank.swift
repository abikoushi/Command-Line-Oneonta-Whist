public enum Rank: Int {
    case Ten=10,Jack, Queen, King, Ace, Small, Large
    
    static var allCases: [Rank] {
        var value = 1
        var cases: [Rank] = []
        while let rank = Rank(rawValue: value) {
            cases.append(rank)
            value += 1
        }
        return cases
    }
    
    public var description: String {
        switch self {
        case .Jack:
            return "J"
        case .Queen:
            return "Q"
        case .King:
            return "K"
        case .Ace:
            return "A"
        case .Small:
            return "S"
        case .Large:
            return "L"
        default:
            return String(self.rawValue)
        }
    }
}


// MARK: - Comparable
public func ==(x: Rank, y: Rank) -> Bool {
    return x.rawValue == y.rawValue
}

public func <(x: Rank, y: Rank) -> Bool {
    return x.rawValue < y.rawValue
}
