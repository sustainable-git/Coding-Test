func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache = [String]()
    var time = 0
    for element in cities {
        let city = element.uppercased()
        while cacheSize < cache.count { cache.removeFirst() }
        
        if cache.contains(city) { time += 1 // cache hit
            let index = cache.firstIndex(of : city)!
            cache.remove(at: index)
            cache.append(city)
        } else { time += 5 // cache miss
            cache.append(city)
        }
    }
    
    return time
}
