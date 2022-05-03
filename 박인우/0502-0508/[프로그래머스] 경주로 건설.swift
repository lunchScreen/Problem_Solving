import Foundation

// 시간 초과
func solution(_ board:[[Int]]) -> Int {
    var board = board
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    func dfs(x: Int, y: Int, money: Int, horizontal: Bool?, board: [[Int]]) -> Int {
        var board = board
        let n = board.count
        board[y][x] = 1
        
        if y == n-1 && x == n-1 {
            return money
        }
        
        var minMoney = Int.max
        
        for i in 0..<4 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            if nx >= 0 && nx < n && ny >= 0 && ny < n && 
            board[ny][nx] == 0 {
                var mmoney = money
                if let horizontal = horizontal {
                    mmoney = (i < 2) == horizontal ? money + 100 : money + 600  
                } else {
                    mmoney = money + 100
                }
                minMoney = min(dfs(x: nx, y: ny, money: mmoney, horizontal: i < 2, 
                                   board: board), minMoney)
            }
        }
        
        return minMoney
    }
    
    return dfs(x: 0, y: 0, money: 0, horizontal: nil, board: board)
}

// 통과
import Foundation

func solution(_ board:[[Int]]) -> Int {
    let n = board.count
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    var distance = Array(repeating: Array(repeating: [Int.max, Int.max], count: n), count: n)
    distance[0][0] = [0,0]
    
    var stack = [(x:0,y:0,d:0)]
    
    while stack.count > 0 {
        let now = stack.removeLast()
        
        let x = now.x
        let y = now.y
        let d = now.d
        
        for i in 0...3 {
            let nx = x + dx[i]
            let ny = y + dy[i]
            let nd = i < 2 ? 0 : 1
            var value = d == nd ? distance[y][x][d] + 100 : distance[y][x][d] + 600
            if y == 0 && x == 0 { value = 100 }
            if nx >= 0 && nx < n && ny >= 0 && ny < n && 
            distance[ny][nx][nd] > value && 
            board[ny][nx] == 0 {
                distance[ny][nx][nd] = value
                stack.append((x:nx, y:ny, d: nd))
            }
        }
    }
    
    return min(distance[n-1][n-1][0],distance[n-1][n-1][1])
}
