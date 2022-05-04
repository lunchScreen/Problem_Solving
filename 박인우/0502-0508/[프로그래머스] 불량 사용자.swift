import Foundation

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var bannedList = [[String]]()
    
    for bid in banned_id {
        var temp = [String]()
        var bidarr = Array(bid).map { String($0) }
        
        for uid in user_id {
            var uidarr = Array(uid).map { String($0) }
            
            if bid.count != uid.count { continue } 
            var possible = true
            for i in 0..<bid.count {
                if bidarr[i] == "*" { continue }
                if bidarr[i] != uidarr[i] {
                    possible.toggle()
                    break
                }
            }
            if possible { temp.append(uid) }
        }
        bannedList.append(temp)
    }
    
    var stack = [(idx: Int, idList: [String])]()
    var answer = [[String]]()
    
    for id in bannedList[0] {
        stack.append((0, [id]))
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        if now.idx == banned_id.count-1 {
            answer.append(now.idList)
            continue
        }
        
        let idx = now.idx + 1
        
        for id in bannedList[idx] {
            var idList = now.idList
            if idList.contains(id) { continue }
            idList.append(id)
            stack.append((idx, idList))
        }
    }
    
    return Set(answer.map { $0.sorted() }).count
}
