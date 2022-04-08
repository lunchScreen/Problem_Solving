import Foundation

func solution(_ board:[[Int]]) -> Int
{
    var board = board
    var answer = 0
    
    for i in 0..<board.count {
        for j in 0..<board[0].count {
            if board[i][j] == 1 && i > 0 && j > 0 {
                board[i][j] = min(min(board[i-1][j-1], board[i-1][j]), board[i][j-1]) + 1
            }
            answer = max(answer, board[i][j]*board[i][j])
        }
    }

    return answer
}
