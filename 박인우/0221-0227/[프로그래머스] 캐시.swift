func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var queue:[String] = []
    var result = 0
    
    for c in cities {
        var city = c.uppercased()
        if let idx = queue.firstIndex(of: city) {
            queue.remove(at: idx)
            result += 1
        } else {
            result += 5
        }
        
        if queue.count > 0 && queue.count >= cacheSize {
            queue.removeFirst()
        } 
        
        if cacheSize > 0 {
            queue.append(city)
        }
    }
    
    return result
}
