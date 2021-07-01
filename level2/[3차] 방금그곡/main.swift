func minuteCalculator(_ start : String, _ end : String) -> Int {
    let startTime = start.split(separator: ":").map{Int(String($0))!}
    let endTime = end.split(separator: ":").map{Int(String($0))!}

    if endTime[0] >= startTime[0] { return (endTime[0] - startTime[0]) * 60 + (endTime[1] - startTime[1]) }
    else { return (endTime[0] - startTime[0] + 24) * 60 + (endTime[1] - startTime[1]) }
}

func melodyArrMaker(_ arr : inout [String]) {
    while arr.contains("#"){
        let indexOfSharp = arr.firstIndex(of: "#")!
        arr[indexOfSharp-1] += arr.remove(at: indexOfSharp)
    }
}

func solution(_ m:String, _ musicinfos:[String]) -> String {
    var mArr = m.map{String($0)} // what Neo heard
    melodyArrMaker(&mArr)
    var resultTupleArr = [(Int, String)]()

    for eachMusic in musicinfos {
        let infoArr = eachMusic.split(separator: ",").map{String($0)}
        let time = minuteCalculator(infoArr[0], infoArr[1])
        let musicName = infoArr[2]
        var melody = infoArr[3].map{String($0)} // whole music info
        melodyArrMaker(&melody)
        let melodyRepeatingIndex = melody.count
        while melody.count > time { melody.removeLast() }
        while melody.count < time { melody.append(melody[melody.count % melodyRepeatingIndex]) }

        guard melody.count >= mArr.count else { continue } // melody should longer than mArr
        var isSub = false // check
        for melodyStartIndex in 0...melody.count - mArr.count {
            guard !isSub else { break }
            for index in mArr.indices {
                if mArr[index] == melody[index + melodyStartIndex] { isSub = true }
                else { isSub = false ; break }
            }
        }
        guard isSub == true else { continue } // if mArr is not in melody, continue
        resultTupleArr.append((time, musicName))
    }

    return resultTupleArr.count == 0 ? "(None)" : resultTupleArr.filter{$0.0 == resultTupleArr.map{$0.0}.max()!}[0].1
}

//String의 subString을 찾기 위해서 위해서 아래의 긴 코드를 사용했다.
//guard melody.count >= mArr.count else { continue } // melody should longer than mArr
//var isSub = false // check
//for melodyStartIndex in 0...melody.count - mArr.count {
//    guard !isSub else { break }
//    for index in mArr.indices {
//        if mArr[index] == melody[index + melodyStartIndex] { isSub = true }
//        else { isSub = false ; break }
//    }
//}
//guard isSub == true else { continue } // if mArr is not in melody, continue
//
//하지만 contains로 간단하게 확인이 가능하다.
//if melody.joined().contains(mArr.joined()) { resultTupleArr.append((time, musicName))}
//그러나 contains로 하면 ABC가 ABC#의 subString으로 인식되기 때문에, #이 붙어있는 것은 다른 문자로 바꿔주어야 정확한 문제풀이가 가능하다.
//이 때는 melodyArrMaker에서 replacingOccurrence를 활용해야 한다
