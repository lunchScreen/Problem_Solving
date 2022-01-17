import Foundation

func baekjoon9963(_ n: Int) -> Int {
    var result = 0
    var arr = [Int](repeating: -1, count: n)
    
    func isPossibile(x: Int, y: Int) -> Bool {
        for i in 0..<x {
            if arr[i] == y || abs(x - i) == abs(y - arr[i]) {
                return false
            }
        }
        
        return true
    }
    
    func dfs(depth: Int) {
        if depth == n {
            result += 1
            return
        }
        
        for i in 0..<n {
            if isPossibile(x: depth, y: i) {
                arr[depth] = i
                dfs(depth: depth + 1)
                arr[depth] = -1
             }
        }
    }
    
    dfs(depth: 0)
    
    return result
}

//let n = Int(readLine()!)!

//print(baekjoon9963(n))
