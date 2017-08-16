import Foundation

var con = true
while(con){
    
    print()
    print("Hello, world!")
    print()
    
    var deck = Deck()
    deck.shuffle()
    
    var earn = 0
    
    var trump = deck.draw(count: 1)!
    
    var hand = Hand(cards: deck.draw(count: 9)!)
    hand.sort()
    
    var bid_elements = ["0","1","2","3","4","5","6","7","8","9"]
    var elements = ["1","2","3","4","5","6","7","8","9"]
    
    let n_of_hands=hand.cards.count
    print("hands:")
    for j in 0..<n_of_hands {
        print(j+1, ":", hand.cards[j].description)
    }
    print()
    print("Trump:", trump[0].description)
    print()
    print("bid: ", terminator: "")
    var bid = readLine(strippingNewline: true)!
    while(!bid_elements.contains(bid)){
        bid = readLine(strippingNewline: true)!
    }
    
    print()
    
    for i in 1..<9 {
        print("Trump:", trump[0].description)
        print()
        
        print("hands:")
        let n_of_hands=hand.cards.count
        for j in 0..<n_of_hands {
            print(j+1, ":", hand.cards[j].description)
        }
        
        var lead = deck.draw(count: 1)!
        print()
        print("lead:", lead[0].description)
        print()
        print("choose: ", terminator: "")
        var flag = true
        var put: [Card] = []
        var input = ""
        while(flag){
            input = readLine(strippingNewline: true)!
            if (elements.contains(input)){
                put = hand.play(index: Int(input)!-1)!
                if( (!hand.suit.contains(lead[0].suit) && lead[0].suit != .Joker) || (put[0].suit == lead[0].suit)||(lead[0].suit == .Joker && put[0].suit == trump[0].suit) || (lead[0].suit == .Joker && !hand.suit.contains(trump[0].suit)) ) {
                    flag = false
                }
            }
        }
        hand.discard(index:Int(input)!-1)
        print()
        print("play:", put[0].description)
        print()
        
        if(lead[0].suit == put[0].suit){
            if(lead[0].rank < put[0].rank){
                earn = earn+1
                print("tricks taken", earn)
                print()
            }
        }else if((put[0].suit==trump[0].suit && lead[0].suit != .Joker) || put[0].suit == .Joker){
            earn = earn+1
            print("tricks taken", earn)
            print()
        }
        elements.removeLast()
    }
    
    var lead = deck.draw(count: 1)!
    var put = hand.play(index: 0)!
    
    print("lead:", lead[0].description)
    print("play:", put[0].description)
    print()
    
    if(lead[0].suit == put[0].suit){
        if(lead[0].rank < put[0].rank){
            earn = earn+1
            print("tricks taken", earn)
            print()
        }
    }else if((put[0].suit==trump[0].suit && lead[0].suit != .Joker) || put[0].suit == .Joker){
        earn = earn+1
        print("tricks taken", earn)
        print()
    }
    
    var points = 0
    var bidnum = Int(bid)!
    
    if(bidnum == 0 && earn == 0){
        points = 10
    }
    
    if(bidnum >= earn){
        points = -bidnum
    }
    
    if(earn >= bidnum){
        points = bidnum - (earn-bidnum)
    }
    
    print("bid:",bid)
    print("taken:",earn)
    print("score:",points)
    print()
    print("continue? press y")
    if(readLine(strippingNewline: true)!=="y"){
        con = true
    }else{
        con = false
    }
    
}
