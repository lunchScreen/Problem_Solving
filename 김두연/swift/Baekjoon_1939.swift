import Foundation

func baekjoon1939() {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = temp[0], m = temp[1]
    
    var map = Array(repeating: [(Int, Int)](), count: n)
    var left = 1
    var right = 0
    var answer = 0
    
    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").map { Int(String($0))! }
        map[input[0]-1].append((input[1]-1, input[2]))
        map[input[1]-1].append((input[0]-1, input[2]))
        
        right = max(right, input[2])
    }
    
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    func bfs(weight: Int) -> Bool {
        var visited = Array(repeating: false, count: n)
        var queue = [input[0]-1]
        visited[input[0]-1] = true
        
        while !queue.isEmpty {
            let curNode = queue.removeFirst()
            for (nextNode, distance) in map[curNode] where distance >= weight {
                if nextNode == input[1]-1 {
                    return true
                }
                guard !visited[nextNode] else { continue }
                visited[nextNode] = true
                queue.append(nextNode)
            }
        }
        
        return false
    }
    
    while left <= right {
        let mid = (left + right) / 2
        
        if bfs(weight: mid) {
            answer = mid
            left = mid + 1
        } else {
            right = mid - 1
        }
        
    }
    
    print(answer)
}

//baekjoon1939()
