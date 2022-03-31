import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    let baseTime = fees[0]
    let baseRate = fees[1]
    let unitTime = fees[2]
    let unitRate = fees[3]
    
    var check: [String:Float] = [:]
    var result: [String:Float] = [:]
    
    for record in records {
        let a = record.components(separatedBy: " ")    
        let time = a[0].components(separatedBy: ":") 
        let number = a[1]
        let state = a[2]
        
        let totalTime = Float(time[0])!*60 + Float(time[1])!
        
        if state == "IN" {
            check[number] = totalTime
            continue
        }
        
        if check[number]! > totalTime {
            result[number, default: 0] += totalTime + (24*60) - check[number]!
        } else {
            result[number, default: 0] += totalTime - check[number]!
        }
        check[number] = nil
    }
    
    for (key,value) in check {
        result[key, default: 0] += 23*60 + 59 - value
    }
    
    let answer:[(Int,Int)] = result.map { number, time in
        if time < Float(baseTime) {
            return (Int(number)!, baseRate)
        }
                                         
        var overCount = (time - Float(baseTime))/Float(unitTime)
        if overCount > Float(Int(overCount)) {
            overCount += 1
        }
                                         
        return (Int(number)!,Int(overCount)*unitRate + baseRate)
    }
    
    return answer.sorted {
        $0.0 < $1.0
    }.map {
        $0.1
    }
}
