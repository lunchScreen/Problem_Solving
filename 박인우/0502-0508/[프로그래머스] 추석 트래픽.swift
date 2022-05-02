import Foundation

func solution(_ lines:[String]) -> Int {
    var queue = [(start: Double,end: Double)]()
    var maxCount = 0
    
    for line in lines {
        var data = line.components(separatedBy: " ")
        data[2].removeLast()
        
        let endTime = data[1].components(separatedBy: ":")
        let totalEndSecond = (Double(endTime[0])!*3600) + (Double(endTime[1])!*60) + Double(endTime[2])!
        let totalStartSecond = totalEndSecond - Double(data[2])! + 0.001
        while queue.count > 0 && queue[0].end+0.999 < totalStartSecond {
            queue.removeFirst()
        } 
        queue.append((totalStartSecond,totalEndSecond))
        maxCount = max(queue.count, maxCount)
    }
    
    return maxCount
}

func solution(_ lines:[String]) -> Int {
    var queue = [(start: Double,end: Double)]()
    var maxCount = 0
    
    for line in lines {
        var data = line.components(separatedBy: " ")
        data[2].removeLast()
        
        let endTime = data[1].components(separatedBy: ":")
        let totalEndSecond = (Double(endTime[0])!*3600) + (Double(endTime[1])!*60) + Double(endTime[2])!
        let totalStartSecond = totalEndSecond - Double(data[2])! + 0.001
        while queue.count > 0 && queue[0].end+0.999 < totalStartSecond {
            queue.removeFirst()
        } 
        queue.append((totalStartSecond,totalEndSecond))
        maxCount = max(queue.count, maxCount)
    }
    
    return maxCount
}
