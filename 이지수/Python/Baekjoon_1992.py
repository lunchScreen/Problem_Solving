import sys
input = sys.stdin.readline

N = int(input().strip())
tree = [list(input()) for _ in range(N)]

def printable(rangeX, rangeY) :
    first = tree[rangeX[0]][rangeY[0]]
    for x in range(rangeX[0], rangeX[1]) :
        for y in range(rangeY[0], rangeY[1]) :
            if tree[x][y] != first : return False
    return True

def zip(start, size) :
    if size == 1 : return print(tree[start[0]][start[1]], end='')
    print('(', end='')
    sx, sy, sp = start[0], start[1], size//2
    for rangeX, rangeY in [((sx, sx+sp), (sy, sy+sp)),((sx, sx+sp), (sy+sp, sy+size)), ((sx+sp, sx+size), (sy, sy+sp)), ((sx+sp, sx+size), (sy+sp, sy+size))] :
        if printable(rangeX, rangeY) : print(tree[rangeX[0]][rangeY[0]], end='')
        else : zip((rangeX[0], rangeY[0]), sp)
    print(')', end='')

def solve() :
    if printable((0, N), (0, N)) : print(tree[0][0])
    else : zip((0,0), N)

solve()
