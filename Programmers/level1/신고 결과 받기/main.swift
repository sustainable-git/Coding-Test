import Foundation

func solution(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    var reportDict: Dictionary<String, Set<String>> = [:]
    id_list.forEach{ reportDict.updateValue([], forKey: $0) }
    report.forEach {
        let map = $0.split(separator: " ").map{ String($0) }
        reportDict[map[1]]?.update(with: map[0])
    }
    let criminals = reportDict.filter { $0.value.count >= k }
    var reporters: Dictionary<String, Int> = [:]
    id_list.forEach{ reporters.updateValue(0, forKey: $0) }
    criminals.forEach {
        $0.value.forEach {
            reporters[$0]! += 1
        }
    }

    return id_list.map{ reporters[$0]! }
}

print(solution(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))
