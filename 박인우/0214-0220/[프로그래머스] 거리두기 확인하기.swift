import Foundation

func check(_ place:[String]) -> Int{
    var pa = place.map { str in
        Array(str).map { String($0) } 
    }
    let dx = [1,-1,0,0]
    let dy = [0,0,1,-1]
    
    for y in 0..<pa.count {
        for x in 0..<pa[0].count {
            if pa[y][x] == "P" {
                var visited = Array(repeating: [false,false,false,false,false], count: 5)
                visited[y][x] = true
                
                var lst:[(Int,Int)] = []
                for i in 0...3 {
                    let nx = x + dx[i]
                    let ny = y + dy[i]
                    guard nx < 5 && nx >= 0 && ny < 5 && ny >= 0 else { continue }
                    visited[ny][nx] = true
                    lst.append((nx,ny))
                }
                
                for i in 0..<lst.count {
                    let tx = lst[i].0
                    let ty = lst[i].1
                    
                    if pa[ty][tx] == "P" {
                        return 0
                    } else if pa[ty][tx] == "O" {
                        for j in 0...3 {
                            let nx = tx + dx[j]
                            let ny = ty + dy[j]
                            guard nx < 5 && nx >= 0 && ny < 5 && ny >= 0 else { continue }
                            guard !visited[ny][nx] else { continue }
                            if pa[ny][nx] == "P" {
                                return 0
                            }
                        }
                    }  
                }
            }
        }
    }

    return 1
}

func solution(_ places:[[String]]) -> [Int] {
    return places.map {
        check($0)
    }
}
