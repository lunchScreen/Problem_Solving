import Foundation

func solution(_ record:[String]) -> [String] {
    
    var idDict: [String: String] = [:]
    var log: [[String]] = []
    
    for s in record {
        let lst = s.components(separatedBy: " ")
        
        if lst[0] == "Enter" || lst[0] == "Change" {
            idDict[lst[1]] = lst[2]
        }
        
        if !(lst[0] == "Change") {
            log.append([lst[0], lst[1]])
        } 
    }
    
    return log.map {
        if $0[0] == "Enter" {
            return "\(idDict[$0[1]]!)님이 들어왔습니다."
        } else {
            return "\(idDict[$0[1]]!)님이 나갔습니다."
        }
    }
}
