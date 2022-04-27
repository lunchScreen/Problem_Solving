import Foundation

func solution(_ n:Int, _ wires:[[Int]]) -> Int {
    var connect = Array(repeating: Array(repeating: false, count: n+1), count:n+1)

    wires.forEach {
        connect[$0[0]][$0[1]] = true
        connect[$0[1]][$0[0]] = true
    }
    
    var minCount = Int.max

    wires.forEach {
        connect[$0[0]][$0[1]] = false
        connect[$0[1]][$0[0]] = false
        let result1 = count(startFrom: $0[0])
        let result2 = count(startFrom: $0[1])
        connect[$0[0]][$0[1]] = true
        connect[$0[1]][$0[0]] = true
        minCount = min(minCount,abs(result1-result2))
    }
    
    func count(startFrom startIndex: Int) -> Int {
        var visited = Array(repeating: false, count: n+1)
        visited[startIndex] = true
        var stack = [startIndex]
        var count = 1
        while stack.count > 0 {
            let now = stack.removeLast()
            for (index, connected) in connect[now].enumerated() {
                if connected && !visited[index] {
                    visited[index] = true
                    stack.append(index)
                    count += 1
                }
            }
        }
        return count
    }
    
    return minCount
}
