import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    
    var infoDictionaryList = info.map {
        $0.components(separatedBy: " ").reduce(into: [String:Int]()) {
            if let n = Int($1) {
                $0["score"] = n
            } else {
                $0[$1] = 1 
            }
        }
    }
    
    let queryLists = query.map {
        $0.replacingOccurrences(of: " and ", with: " ").components(separatedBy: " ")
    }
    
    var result = queryLists.map { queryList in
        infoDictionaryList.reduce(0) { total, infoDictionary in
            for q in queryList {
                if q == "-" {
                    continue
                }

                if let n = Int(q) {
                    if n > infoDictionary["score"]! {
                        return total                        
                    }
                    continue
                }

                guard let n = infoDictionary[q] else { return total }
            }  
            return total + 1
        }
    }
    
    return result
}

// 효율성 
