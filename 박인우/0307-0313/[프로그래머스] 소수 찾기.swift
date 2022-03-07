import Foundation

func solution(_ numbers:String) -> Int {
    var allNumbers = Set<Int>()
    
    for n in 1...numbers.count {
        allNumbers = allNumbers.union(permutation(numbers, n).compactMap {
            Int($0)
        })
    }
    
    return allNumbers.filter {
        isPrime($0)
    }.count
}

func permutation(_ str:String, _ n: Int) -> [String] {
    var answer = [String]()
    var sa = Array(str)
    
    func dfs(nowStr: String, used: [Bool]) {
        if nowStr.count == n {
            answer.append(nowStr)
            return
        }
        
        for i in 0..<str.count {
            if used[i] { continue }
            var nowUsed = used
            nowUsed[i] = true
            dfs(nowStr: nowStr + String(sa[i]), used: nowUsed)
        }
    }
    
    dfs(nowStr: "", used: Array(repeating: false, count: str.count))
    
    return Array(answer)
}

func isPrime(_ n: Int) -> Bool {
    if n < 2 {
        return false
    }
    
    for i in 2..<n {
        if n % i == 0 {
            return false
        }
    }
    
    return true
}
