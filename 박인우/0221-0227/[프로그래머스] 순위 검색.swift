import Foundation

// 효율성 테스트 실패
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

// 효율성 테스트 3까지 성공
import Foundation

func solution(_ info:[String], _ query:[String]) -> [Int] {
    var dic = [String:[Int]]()
    
    info.forEach {    
        var dfs = [(0,$0.components(separatedBy: " "))]
        
        while dfs.count > 0 {
            var now = dfs.removeLast()
            let idx = now.0
            var lst = now.1
            
            if idx == 4 {
                let key = lst[0...3].joined()
                dic[key, default: [Int]()].append(Int(lst[4])!)
                continue
            }
            
            dfs.append((idx+1,lst))
            lst[idx] = "-"
            dfs.append((idx+1,lst))
        }
    }
    
    for key in dic.keys {
        dic[key] = dic[key]!.sorted(by: >)
    }
    
    let result: [Int] = query.map { str in
        let lst = str.components(separatedBy: " ")
        let key = lst[0] + lst[2] + lst[4] + lst[6]
        let limitScore = Int(lst[7])!
        if let candidates = dic[key] {
            var passed = 0
            while passed < candidates.count {
                if candidates[passed] < limitScore {
                    break
                }
                passed += 1
            }
            return passed
        } else {
            return 0
        }
    }
    
    return result
}
