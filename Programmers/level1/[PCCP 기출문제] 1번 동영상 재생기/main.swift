import Foundation

func solution(_ video_len:String, _ pos:String, _ op_start:String, _ op_end:String, _ commands:[String]) -> String {
    var video = Video(video_len: video_len, pos: pos, op_start: op_start, op_end: op_end)
    commands.forEach {
        video.input(operation: $0)
    }
    return video.currentTimeString
}

struct Video {
    private var totalPlayTime: Int
    private var openingStartTime: Int
    private var openingEndTime: Int
    private var currentTime: Int
    var currentTimeString: String {
        let minutes = currentTime / 60
        let seconds = currentTime % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
    
    init(video_len: String, pos: String, op_start: String, op_end: String) {
        totalPlayTime = video_len.split(separator: ":").map { Int(String($0))! }.reduce(0) { $0 * 60 + $1 }
        currentTime = pos.split(separator: ":").map { Int(String($0))! }.reduce(0) { $0 * 60 + $1 }
        openingStartTime = op_start.split(separator: ":").map { Int(String($0))! }.reduce(0) { $0 * 60 + $1 }
        openingEndTime = op_end.split(separator: ":").map { Int(String($0))! }.reduce(0) { $0 * 60 + $1 }
        openingSkipIfNeeded()
    }
    
    mutating func input(operation: String) {
        switch operation {
        case "prev": tenSecondsGoPast()
        case "next": tenSecondsGoFuture()
        default: break
        }
        openingSkipIfNeeded()
    }
    
    mutating private func tenSecondsGoPast() {
        currentTime -= 10
        if currentTime < 0 {
            currentTime = 0
        }
    }
    
    mutating private func tenSecondsGoFuture() {
        currentTime += 10
        if currentTime > totalPlayTime {
            currentTime = totalPlayTime
        }
    }
    
    mutating private func openingSkipIfNeeded() {
        if openingStartTime...openingEndTime ~= currentTime {
            currentTime = openingEndTime
        }
    }
}
