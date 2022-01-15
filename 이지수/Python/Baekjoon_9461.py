import sys
input = sys.stdin.readline
l = [1, 1, 1]
for _ in range(int(input())) :
    n = int(input())
    while len(l) < n : l.append(l[-3]+l[-2])
    print(l[n-1])
