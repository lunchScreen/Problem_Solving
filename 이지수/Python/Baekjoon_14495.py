import sys
n = int(sys.stdin.readline())
l = [0,1,1,1]
for i in range(4, n+1):
    l.append(l[i-3]+l[i-1])
print(l[n])
