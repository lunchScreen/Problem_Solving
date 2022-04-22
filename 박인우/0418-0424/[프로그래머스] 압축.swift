func solution(_ msg:String) -> [Int] {
    var answer: [Int] = []
    
    var dic: [String:Int] = [:]
    var sa = msg.map { String($0) }
    var checkNumber = 1
    
    while checkNumber < 27 {
        dic[String(UnicodeScalar(UInt8(65+checkNumber-1)))] = checkNumber
        checkNumber += 1
    }
    
    var startIndex = 0    
    while startIndex < sa.count {
        var output = 0
        var endIndex = startIndex
        while endIndex < sa.count {
            let now = sa[startIndex...endIndex].joined()
            guard let number = dic[now] else { 
                dic[now] = checkNumber
                checkNumber += 1
                break 
            } 
            output = number
            endIndex += 1
        }
        answer.append(output)
        startIndex = endIndex
    }
    
    return answer
}
