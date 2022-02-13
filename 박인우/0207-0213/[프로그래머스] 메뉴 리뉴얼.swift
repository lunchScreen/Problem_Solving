import Foundation

func solution(_ orders:[String], _ course:[Int]) -> [String] {
    var result = [String]()
    
    course.forEach { n in
        var temp = [String:Int]()
        orders.forEach { order in
            combination(order, n).forEach { temp[$0, default: 0] += 1 }
        }
        if temp.count > 0 {
            var limit = temp.sorted(by: { $0.value > $1.value })[0].value
            if limit > 1 {
                temp.filter { $0.value == limit }.forEach {
                    result.append($0.key)
                }
            }
        }
    }
    
    return result.sorted()
}

func combination(_ str: String, _ n: Int) -> [String] {
    var result = [String]()
    
    if str.count < n {
        return result
    }
    
    var sa = Array(str).map { String($0) }
    var stack = [(String, Int)]()
    
    for i in 0..<str.count {
        stack.append((sa[i],i))
    }
    
    while stack.count > 0 {
        var now = stack.removeLast()
        
        var nowString = now.0
        var nowIdx = now.1
        
        if nowString.count == n {
            result.append(String(nowString.sorted()))
            continue
        }
        
        guard nowIdx+1 <= sa.count-1 else { continue }
        
        for i in nowIdx+1...sa.count-1 {
            stack.append((nowString + sa[i], i))
        }
    }
    
    return result
}
