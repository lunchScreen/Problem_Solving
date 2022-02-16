import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var idx = location
    var queue = priorities
    var count = 1
    
    while queue.count > 0 {
        var now = queue.removeFirst()
        
        if queue.count > 1 && queue.max()! > now {
            queue.append(now)
        } else {
            if idx == 0 {
                break
            } else {
                count += 1
            }
        }
        
        if idx == 0 {
            idx = queue.count-1
        } else {
            idx -= 1
        }
    }
    
    return count
}

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var idx = location
    var queue = priorities
    
    while queue.count > 0 {
        if queue.contains(where: { $0 > queue[0] }) {
            var now = queue.removeFirst()
            queue.append(now)
            idx = idx - 1 < 0 ? queue.count - 1 : idx - 1
        } else {
            queue.removeFirst()
            if idx == 0 {
                return priorities.count - queue.count
            }
            idx = idx - 1 < 0 ? queue.count - 1 : idx - 1
        } 
    }
    
    return 0
}
