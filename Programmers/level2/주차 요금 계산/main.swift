import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    var timeDict: Dictionary<String, Int> = [:]
    var parkingLot: Dictionary<String, String> = [:]
    records.forEach {
        let map = $0.split(separator: " ").map{ String($0) }
        if parkingLot[map[1]] == nil {
            parkingLot.updateValue(map[0], forKey: map[1])
        } else {
            timeDict[map[1], default: 0] += parkTime(in: parkingLot[map[1]]!, out: map[0])
            parkingLot[map[1]] = nil
        }
    }
    print(parkingLot, timeDict)
    parkingLot.forEach {
        timeDict[$0.key, default: 0] += parkTime(in: $0.value, out: "23:59")
    }
    var cars: [String] = []
    records.forEach {
        let carNumber = $0.split(separator: " ").map{ String($0) }[1]
        if !cars.contains(carNumber) { cars.append(carNumber) }
    }

    return cars.sorted(by: <).map {
        return fee(time: timeDict[$0]!, fees: fees)
    }
}

private func parkTime(in entrance: String, out exit: String) -> Int {
    let inTime = entrance.split(separator: ":").map{ String($0) }.reduce(0){ $0 * 60 + Int($1)! }
    let outTime = exit.split(separator: ":").map{ String($0) }.reduce(0){ $0 * 60 + Int($1)! }
    return outTime - inTime
}

private func fee(time: Int, fees: [Int]) -> Int {
    return time <= fees[0] ? fees[1] : fees[1] + Int(ceil(Double(time - fees[0])/Double(fees[2])) * Double(fees[3]))
}
