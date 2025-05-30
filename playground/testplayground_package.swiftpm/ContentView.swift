import SwiftUI
import PlayingCard
import DeckOfPlayingCards


struct ContentView: View {
    func hand() -> [PlayingCard] {
        var deck = Deck.standard52CardDeck()
        
        deck.shuffle()
        
        return (0..<3).compactMap { _ in deck.deal() }
    }
    
    var body: some View {
        VStack {
            ForEach(hand(), id: \.self) { card in
                CardView(card: PlayingCard(rank: .ace, suit: .spades))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
