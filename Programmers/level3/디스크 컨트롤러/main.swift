// 평균을 이용하기 때문에 대기시간을 고려하지 않고 작업 시간이 짧은 것을 무조건 우선으로 사용하면 된다
// 함정은 jobs가 순서대로 들어오지 않는 것이다. 정렬을 하거나 순서를 변경해야 한다
// 소요시간을 줄이려면 array.removeFirst에서 한 칸씩 재정렬되는 문제를 해결해야 한다

import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    var scheduler = Scheduler(jobs.sorted(by: {$0[0] < $1[0]} ))
    scheduler.operate()
    
    return scheduler.averageTime
}

struct Scheduler{
    private var jobs: [[Int]]
    private(set) var queue: PriorityQueue = PriorityQueue()
    private(set) var time: Int = 0
    lazy var averageTime: Int = self.queue.totalWaitingTime/self.queue.totalJobs
    
    init(_ jobs: [[Int]]) {
        self.jobs = jobs
    }
    
    mutating func operate() {
        while self.jobs.count != 0 || self.queue.jobs.count != 0 || self.queue.workTime != 0 {
            while let job = self.jobs.first, job[0] <= self.time {
                self.jobs.removeFirst()
                self.queue.push(job[1])
            }
            self.queue.operate()
            self.time += 1
        }
    }
}

struct PriorityQueue {
    private(set) var jobs: [(Int, Int)] = []
    private(set) var workTime: Int = 0
    private(set) var totalJobs: Int = 0
    private(set) var totalWaitingTime: Int = 0
    
    mutating func push(_ job: Int) {
        self.jobs.append((job, 0))
        self.totalJobs += 1
    }
    
    mutating func operate() {
        defer { self.jobs = self.jobs.map { ($0.0, $0.1+1) } }
        if self.workTime > 0 {
            self.workTime -= 1
            return
        }
        
        if self.jobs.count == 0 {
            return
        } else {
            self.jobs.sort(by: { $0.0 < $1.0 })
            let job = jobs.removeFirst()
            self.workTime = job.0 - 1
            self.totalWaitingTime += job.0 + job.1
        }
    }
}
