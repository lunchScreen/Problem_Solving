import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
    var board = board
    var stack: [Int] = []
    var count = 0
    for move in moves {
        var x = move - 1
        var y = 0
        while y < board.count && board[y][x] == 0 {
            y += 1
        }
        if y < board.count {
            var kind = board[y][x]
            board[y][x] = 0
            if stack.count > 0 && stack.last! == kind {
                stack.removeLast()
                count += 2
            } else {
                stack.append(kind)
            }
        } 
    }
    return count
}
