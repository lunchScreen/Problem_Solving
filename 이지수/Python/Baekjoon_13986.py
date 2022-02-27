import sys
input = sys.stdin.readline

n, m = map(int, input().strip().split())
grid = [list(input().strip()) for _ in range(n)]

def move(x, y) :
    for a in range(x+1, n) :
        if grid[a][y] != '.' : 
            grid[x][y] = '.'
            grid[a-1][y] = 'o'
            return
    grid[x][y] = '.'
    grid[n-1][y] = 'o'

for i in range(n-1, -1, -1) :
    for j in range(m) :
        if grid[i][j] == 'o' : move(i, j)
[print(''.join(grid[i])) for i in range(n)]
