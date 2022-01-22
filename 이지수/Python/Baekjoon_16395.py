import sys
n, k = map(int, sys.stdin.readline().split())
l = [[1], [1, 1]]
for i in range(2, n) :
    line = [1]
    for j in range(1, i) :
        line.append(l[i-1][j-1]+l[i-1][j])
    line.append(1)
    l.append(line)
print(l[n-1][k-1])
