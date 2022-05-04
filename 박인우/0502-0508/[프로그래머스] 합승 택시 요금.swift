import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    // 지점 개수 : n
    // 출발 : s
    // 지점사이 택시요금 : fares
    // 아예 합승하지 않는 경우가 더 나으면 합승 안해도됨
    
    // 일단 그래프 짜기
    var graph = Array(repeating: Array(repeating: -1, count: n+1), count: n+1)
    
    for fare in fares {
        let from = fare[0]
        let to = fare[1]
        let distance = fare[2]
        
        graph[from][to] = distance
        graph[to][from] = distance
    }
    
    // 같이타고 간다는 것은 그만큼의 비용을 내고 S를 이동시키는 것    
    // 일단 S에서 각 위치로 가는 비용을 다익스트라로 계산해놓기
    var sdistance = Array(repeating: Int.max, count: n+1)
    var queue = [s]
    var head = 0
    sdistance[s] = 0
    
    while queue.count - head > 0 {
        let now = queue[head]
        head += 1
        
        for i in 1...n {
            let cost = sdistance[now] + graph[now][i]
            if graph[now][i] >= 0 && sdistance[i] > cost {
                sdistance[i] = cost
                queue.append(i)
            }
        }
    }

    // S에서 각각의 목적지를 다익스트라로 탐색 (+ 위의 다익스트라 비용)
    var minCost = Int.max
    for start in 1...n {
        if sdistance[start] == Int.max { continue }
        
        var distance = Array(repeating: Int.max, count: n+1)
        queue = [start]
        head = 0
        distance[start] = 0
        
        while queue.count - head > 0 {
            let now = queue[head]
            head += 1
            
            for i in 1...n {
                let cost = distance[now] + graph[now][i]
                if graph[now][i] >= 0 && distance[i] > cost {
                    distance[i] = cost
                    queue.append(i)
                }
            }
        }
        
        minCost = min(sdistance[start] + distance[a] + distance[b], minCost)
    }
    
    return minCost
}
