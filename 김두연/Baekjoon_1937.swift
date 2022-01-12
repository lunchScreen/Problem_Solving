import Foundation

func baekjoon1937() -> Int {
    let n = Int(readLine()!)!
    var map = [[Int]]()

    let dx = [1, 0, -1 ,0]
    let dy = [0, 1, 0, -1]

    for _ in 0..<n {
        map.append(readLine()!.split(separator: " ").map { Int(String($0))! })
    }

    var dp = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)

    func dfs(currentX: Int, currentY: Int) -> Int {
        guard dp[currentX][currentY] == 0 else { return dp[currentX][currentY] }
        dp[currentX][currentY] = 1
        for i in 0..<4 where 0..<n ~= currentX + dx[i] && 0..<n ~= currentY + dy[i] {
            let nextX = currentX + dx[i]
            let nextY = currentY + dy[i]
            
            guard map[nextX][nextY] > map[currentX][currentY] else { continue }
            dp[currentX][currentY] = max(dp[currentX][currentY], dfs(currentX: nextX, currentY: nextY) + 1)
        }
        
        return dp[currentX][currentY]
    }

    var result: Int = 0
    for x in 0..<n {
        for y in 0..<n {
            result = max(result, dfs(currentX: x, currentY: y))
        }
    }

    return result
}

//print(baekjoon1937())
