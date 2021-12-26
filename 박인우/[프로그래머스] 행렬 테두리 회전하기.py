def solution(rows, columns, queries):
    answer = []
    matrix = [[i*columns + j
               for j in range(1, columns+1)]for i in range(0, rows)]
    for querie in queries:
        minNum = 10001
        fx, fy, tx, ty = map(lambda x: x-1, querie)
        lt = matrix[fx][fy]
        rt = matrix[fx][ty]
        lb = matrix[tx][fy]
        rb = matrix[tx][ty]
        minNum = min(minNum, lt)
        minNum = min(minNum, rt)
        minNum = min(minNum, lb)
        minNum = min(minNum, rb)
        for i in range(ty-1, fy, -1):
            minNum = min(minNum, matrix[fx][i])
            matrix[fx][i+1] = matrix[fx][i]
        for i in range(tx-1, fx, -1):
            minNum = min(minNum, matrix[i][ty])
            matrix[i+1][ty] = matrix[i][ty]
        for i in range(fy+1, ty, 1):
            minNum = min(minNum, matrix[tx][i])
            matrix[tx][i-1] = matrix[tx][i]
        for i in range(fx+1, tx, 1):
            minNum = min(minNum, matrix[i][fy])
            matrix[i-1][fy] = matrix[i][fy]
        matrix[fx][fy+1] = lt
        matrix[fx+1][ty] = rt
        matrix[tx-1][fy] = lb
        matrix[tx][ty-1] = rb
        answer.append(minNum)
    return answer
