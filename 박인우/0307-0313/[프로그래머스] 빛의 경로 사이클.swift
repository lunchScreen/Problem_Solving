import Foundation

func solution(_ grid:[String]) -> [Int] {
    var answer = [Int]()
    var ga = grid.map { Array($0).map { String($0) } }
    var visited = grid.map { Array($0).map { _ in return [false,false,false,false] } }
    
    func dfs(x: Int, y: Int, dx: Int, dy: Int, length: Int) {
        let direction = (dx == 0 ? 0 : (dx == 1 ? 0 : 1)) + (dy == 0 ? 0 : (dy == 1 ? 2 : 3))
        
        if visited[y][x][direction] {
            answer.append(length)
            return
        }
        
        visited[y][x][direction] = true
        var nx = x + dx
        var ny = y + dy
        
        if nx == -1 {
            nx = ga[0].count - 1
        } else if nx == ga[0].count {
            nx = 0
        }
        
        if ny == -1 {
            ny = ga.count - 1
        } else if ny == ga.count {
            ny = 0
        }
        
        if ga[ny][nx] == "S" {
            dfs(x: nx, y: ny, dx: dx, dy: dy, length: length + 1)
        } else if ga[ny][nx] == "L" {
            dfs(x: nx, y: ny, dx: dy, dy: -dx, length: length + 1)            
        } else if ga[ny][nx] == "R" {
            dfs(x: nx, y: ny, dx: -dy, dy: dx, length: length + 1)            
        }        
    }
    
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    for y in 0..<ga.count {
        for x in 0..<ga[0].count {
            for i in 0...3 {
                if !visited[y][x][i] {
                    dfs(x: x, y: y, dx: dx[i], dy: dy[i], length: 0)
                }
            }
        }
    }
    
    return answer.sorted()
}
