import Foundation

func solution(_ clothes:[[String]]) -> Int {
    var dic: [String:[String]] = [:]
    
    for cloth in clothes {
        dic[cloth[1], default: [String]()].append(cloth[0])
    }
    
    var answer = 1
    
    for i in dic {
        answer *= (i.value.count+1)
    }
    
    return answer-1
}
