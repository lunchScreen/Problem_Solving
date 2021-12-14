dx = [1, 0, -1, 0]
dy = [0, -1, 0, 1]


# 0:위, 1: 왼, 2:아, 3:오
def solution(grid):
    global visited, n, m
    answer = []
    n = len(grid)
    m = len(grid[0])
    visited = [[[False] * 4 for _ in range(m)] for _ in range(n)]
    for i in range(n):
        for j in range(m):
            for d in range(4):
                if not visited[i][j][d]:
                    result = simul(grid, i, j, d)
                    if result != 0:
                        answer.append(result)
    answer.sort()
    return answer


def simul(grid, x, y, d):
    global visited
    cur_x, cur_y, cur_d = x, y, d
    result = 0
    visited[cur_x][cur_y][cur_d] = True

    while True:
        cur_x = (cur_x + dx[cur_d]) % n
        cur_y = (cur_y + dy[cur_d]) % m
        result += 1

        if grid[cur_x][cur_y] == 'L':
            cur_d = (cur_d + 1) % 4
        elif grid[cur_x][cur_y] == 'R':
            cur_d = (cur_d - 1) % 4
        if visited[cur_x][cur_y][cur_d]:
            if (cur_x, cur_y, cur_d) == (x, y, d):
                return result
            else:
                return 0
        visited[cur_x][cur_y][cur_d] = True