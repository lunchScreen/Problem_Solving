// 1: dfs로 접근
// 시간초과 발생

import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var answer = 0
    var possible = Array(repeating: false, count: N+1)
    
    func dfs(now: Int, time: Int) {
        if time <= k {
            possible[now] = true
        } else {
            return
        }

        for info in road {
            let a = info[0]
            let b = info[1]
            let t = info[2]
            
            if a == now {
                dfs(now: b, time: time + t)
            }
            
            if b == now {
                dfs(now: a, time: time + t)
            }
        }
    }
    
    dfs(now: 1, time: 0)
    
    return possible.filter { $0 }.count
}

// 2: 플로이드워셜
// 해결

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var distance = [[Int]](repeating: [Int](repeating: 99999999, count: N), count: N)

    for i in 0..<N {
        distance[i][i] = 0
    }

    for i in road {
        distance[i[0]-1][i[1]-1] = min(i[2], distance[i[0]-1][i[1]-1])
        distance[i[1]-1][i[0]-1] = min(i[2], distance[i[1]-1][i[0]-1])
    }

    for k in 0..<N {
        for i in 0..<N {
            for j in 0..<N {
                distance[i][j] = min(distance[i][j], distance[i][k] + distance[k][j])
            }
        }
    }

    return distance.first!.filter{$0<=k}.count
}
