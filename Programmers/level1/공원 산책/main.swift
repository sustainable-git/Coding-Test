import Foundation

func solution(_ park:[String], _ routes:[String]) -> [Int] {
    let parkMatrix = park.map { $0.map { String($0) } }
    var currentLocation: (Int, Int) = (0, 0)
    for row in 0..<parkMatrix.count {
        for col in 0..<parkMatrix[0].count {
            if parkMatrix[row][col] == "S" {
                currentLocation = (row, col)
            }
        }
    }
    routes.forEach { route in
        let routeValues = route.split(separator: " ").map { String($0) }
        guard routeValues.count == 2 else { fatalError() }
        let (direction, distance) = (routeValues[0], Int(routeValues[1])!)
        var isPossible = true
        
        switch direction {
        case "N":
            guard 0..<parkMatrix.count ~= currentLocation.0 - distance else { return }
            let (start, end) = (currentLocation.0 - distance, currentLocation.0)
            for row in start...end {
                if parkMatrix[row][currentLocation.1] == "X" { isPossible = false }
            }
            if isPossible { currentLocation.0 = start }
        case "E":
            guard 0..<parkMatrix[0].count ~= currentLocation.1 + distance else { return }
            let (start, end) = (currentLocation.1, currentLocation.1 + distance)
            for col in start...end {
                if parkMatrix[currentLocation.0][col] == "X" { isPossible = false }
            }
            if isPossible { currentLocation.1 = end; }
        case "S":
            guard 0..<parkMatrix.count ~= currentLocation.0 + distance else {
                return
            }
            let (start, end) = (currentLocation.0, currentLocation.0 + distance)
            for row in start...end {
                if parkMatrix[row][currentLocation.1] == "X" { isPossible = false }
            }
            if isPossible { currentLocation.0 = end }
        case "W":
            guard 0..<parkMatrix[0].count ~= currentLocation.1 - distance else { return }
            let (start, end) = (currentLocation.1 - distance, currentLocation.1)
            for col in start...end {
                if parkMatrix[currentLocation.0][col] == "X" { isPossible = false }
            }
            if isPossible { currentLocation.1 = start }
        default:
            fatalError()
        }
    }
    
    return [currentLocation.0, currentLocation.1]
}
