import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    let infoArr = info.map{$0.split(separator: " ").map{String($0)}}
    let queryArr = query.map{$0.split(separator: " ").map{String($0)}}
    var personHashMap = PersonHashMap()
    
    infoArr.forEach {
        personHashMap.append($0)
    }
    
    personHashMap.sortDB()
    
    let result = queryArr.map {
        personHashMap.numberOfSatisfiedWith($0[0], $0[2], $0[4], $0[6], Int($0[7])!)
    }
    
    return result
}

struct PersonHashMap {
    var db: [String:[Int]] = [:]
    
    mutating func append(_ person: [String]) {
        let language = ["-", person[0]]
        let jobGroup = ["-", person[1]]
        let career = ["-", person[2]]
        let soulFood = ["-", person[3]]
        
        for lang in language {
            for job in jobGroup {
                for car in career {
                    for soul in soulFood {
                        let hashString = "\(lang)\(job)\(car)\(soul)"
                        
                        if db[hashString] != nil {
                            db[hashString]!.append(Int(person[4])!)
                        } else {
                            db[hashString] = [Int(person[4])!]
                        }
                    }
                }
            }
        }
    }
    
    func numberOfSatisfiedWith(_ language: String, _ jobGroup: String, _ career: String, _ soulFood: String, _ score: Int) -> Int {
        let hashString = "\(language)\(jobGroup)\(career)\(soulFood)"
        let numberSet: [Int] = db[hashString] ?? []
        
        return numberOfGreaterNumbers(in: numberSet, standard: score)
    }
    
    mutating func sortDB() {
        for datum in db {
            db[datum.key] = datum.value.sorted()
        }
    }
    
    private func numberOfGreaterNumbers(in array : [Int], standard: Int) -> Int {
        var low = 0
        var mid = 0
        var high = array.count - 1
        
        while low <= high {
            mid = (low + high) / 2
            if array[mid] < standard {
                low = mid + 1
            } else {
                high = mid - 1
            }
        }
        return array.count - low
    }
}
