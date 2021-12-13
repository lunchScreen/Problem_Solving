# 1004
import sys
input = sys.stdin.readline

t = int(input())
for _ in range(t):
    x1, y1, x2, y2 = map(int, input().split())
    n = int(input())
    xs, ys, rs = [], [], []
    count = 0
    for _ in range(n) :
        x, y, r = map(int, input().split())
        sin = (x1 - x) ** 2 + (y1 - y) ** 2 < (r ** 2)
        ein = (x2 - x) ** 2 + (y2 - y) ** 2 < (r ** 2)
        if sin and ein : continue
        elif sin or ein : count += 1
    print(count)
