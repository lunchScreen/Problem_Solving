def solution(rows, columns, queries):
    answer = []
    board = [[i + (j) * columns for i in range(1, columns + 1)] for j in range(rows)]
    for a, b, c, d in queries:
        x1, y1, x2, y2 = a - 1, b - 1, c - 1, d - 1
        m = rows * columns + 1
        tmp = board[x1 + 1][y1]
        for y in range(y1, y2):
            board[x1][y], tmp = tmp, board[x1][y]
            m = min(m, tmp)

        for x in range(x1, x2):
            board[x][y2], tmp = tmp, board[x][y2]
            m = min(m, tmp)

        for y in range(y2, y1, -1):
            board[x2][y], tmp = tmp, board[x2][y]
            m = min(m, tmp)
        for x in range(x2, x1, -1):
            board[x][y1], tmp = tmp, board[x][y1]
            m = min(m, tmp)
        answer.append(m)

    return answer