import Foundation

func baekjoon1707() {
    let k = Int(readLine()!)!
    
    for _ in 0..<k {
        let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
        let v = temp[0], e = temp[1]
        var edges = Array(repeating: [Int](), count: v)
        var nodes = Array(repeating: -1, count: v)
        var result = true
        
        for _ in 0..<e {
            let edge = readLine()!.split(separator: " ").map { Int(String($0))! }
            edges[edge[0]-1].append(edge[1]-1)
            edges[edge[1]-1].append(edge[0]-1)
        }
        
        for i in 0..<v {
            guard result else { break }
            if nodes[i] != -1 { continue }
            var queue = [i]
            nodes[i] = 0
            
            while !queue.isEmpty {
                let now = queue.removeFirst()
                for nextNode in edges[now] {
                    if nodes[nextNode] == -1 {
                        nodes[nextNode] = nodes[now]^1
                        queue.append(nextNode)
                    } else if nodes[nextNode] == nodes[now] {
                        result = false
                        break
                    }
                }
            }
        }
        print(result ? "YES" : "NO")
    }
    
}

//baekjoon1707()
