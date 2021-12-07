import Foundation

func solution(_ sizes:[[Int]]) -> Int {
    var cardSize: (Int, Int) = (0, 0)
    for elements in sizes {
        let sortedArray = elements.sorted(by: <)
        if sortedArray.last! >= cardSize.1 {
            cardSize.1 = sortedArray.last!
        }
        if sortedArray.first! >= cardSize.0 {
            cardSize.0 = sortedArray.first!
        }
    }
    
    return cardSize.0 * cardSize.1
}

