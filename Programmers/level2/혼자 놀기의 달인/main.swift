import Foundation

func solution(_ cards:[Int]) -> Int {
    var maxScore = 0
    
    for firstSelectedCard in cards {
        var selectedCards: Set<Int> = []
        var unselectedCards: Set<Int> = Set(cards)
        var currentCard = firstSelectedCard
        
        while !selectedCards.contains(currentCard) {
            defer { currentCard = cards[currentCard - 1] }
            selectedCards.update(with: currentCard)
            unselectedCards.remove(currentCard)
        }
        
        var numberOfCardsInGroupOne = selectedCards.count
        
        for secondSelectedCard in unselectedCards {
            selectedCards = []
            currentCard = secondSelectedCard
            
            while !selectedCards.contains(currentCard) {
                defer { currentCard = cards[currentCard - 1] }
                selectedCards.update(with: currentCard)
            }
            
            var numberOfCardsInGroupTwo = selectedCards.count
            maxScore = max(maxScore, numberOfCardsInGroupOne * numberOfCardsInGroupTwo)
        }
    }
    
    return maxScore
}
