import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var numberOfNetwork = 0
    var checkedComputer = Array<Bool>(repeating: false, count: computers.count)

    func dfs(_ computerIndex : Int, _ computerLink : [Int]) {
        for (linkIndex, linkValue) in computerLink.enumerated() {
            guard checkedComputer[linkIndex] == false else { continue } // if checked, continue
            if linkValue == 1 {
                checkedComputer[linkIndex] = true
                dfs(linkIndex, computers[linkIndex])
            }
        }
    }

    for computerIndex in computers.indices {
        guard checkedComputer[computerIndex] == false else { continue } // if checked, continue
        checkedComputer[computerIndex] = true // now we are going to seek from this computer
        numberOfNetwork += 1 // all the belows are just one network connected with this computer

        dfs(computerIndex, computers[computerIndex])
    }

    return numberOfNetwork
}
