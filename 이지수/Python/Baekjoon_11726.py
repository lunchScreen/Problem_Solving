import sys
n = int(sys.stdin.readline())
l = [1, 1]
for i in range(2, n+1) :
    l.append(l[i-2]+l[i-1])
print(l[n]%10007)
