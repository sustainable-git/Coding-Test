import Foundation

func solution(_ players:[String], _ callings:[String]) -> [String] {
    var playerToPosition: [String: Int] = Dictionary(uniqueKeysWithValues: zip(players, (0..<players.count)))
    var positionToPlayer: [Int: String] = Dictionary(uniqueKeysWithValues: zip((0..<players.count), players))

    for winner in callings {
        let currentPosition = playerToPosition[winner]!
        let loser = positionToPlayer[currentPosition - 1]!

        playerToPosition[winner] = currentPosition - 1
        playerToPosition[loser] = currentPosition
        positionToPlayer[currentPosition - 1] = winner
        positionToPlayer[currentPosition] = loser
    }

    return (0..<players.count).map { positionToPlayer[$0]! }
}
