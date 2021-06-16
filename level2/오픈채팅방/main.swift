import Foundation

func solution(_ record:[String]) -> [String] {
    var command = [String]()
    var userId = [String]()
    var dic = [String : String]()
    var resultArr = [String]()

    for i in record {
        let arr = i.split(separator: " ").map{String($0)}
        command.append(arr[0])
        userId.append(arr[1])

        if arr[0] == "Enter" || arr[0] == "Change" {
            dic.updateValue(arr[2], forKey: arr[1])
        }
    }

    for (index, value) in command.enumerated() {
        switch value {
            case "Enter" :
                resultArr.append("\( dic[userId[index]]! )님이 들어왔습니다.")
                break
            case "Leave" :
                resultArr.append("\( dic[userId[index]]! )님이 나갔습니다.")
                break
            default : break
        }
    }
    
    return resultArr
}
