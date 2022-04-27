func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    let md = board.map { $0.map { String($0) } }
    let n = board.count
    
    var board: [[String]] = []
    for x in 0..<md[0].count {
        var temp: [String] = []
        for y in (0..<md.count).reversed() {
            temp.append(md[y][x])
        }
        board.append(temp)
    }
    
    func pang() -> Int {
        var list: [(Int,Int)] = []
        for y in 0..<board.count-1 {
            for x in 0..<board[0].count-1 {
                if board[y][x] == board[y+1][x] && 
                board[y][x] == board[y][x+1] && 
                board[y][x] == board[y+1][x+1] {
                    list.append((x,y))
                }
            }
        }
        
        var count = 0
        for (x, y) in list {
            if board[y][x] != "0" { 
                board[y][x] = "0"
                count += 1 
            }
            if board[y+1][x] != "0" { 
                board[y+1][x] = "0"
                count += 1 
            }
            if board[y][x+1] != "0" { 
                board[y][x+1] = "0"
                count += 1 
            }
            if board[y+1][x+1] != "0" { 
                board[y+1][x+1] = "0"
                count += 1 
            }
        }
        for y in 0..<board.count {
            board[y].removeAll(where : {
                $0 == "0"
            })
            while board[y].count < n {
                board[y].append("0")
            }
        }
        return count
    }
    
    var result = 0
    while true {
        let count = pang()
        if count == 0 { break }
        result += count
    }
    
    return result
}
