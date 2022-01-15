import sys
input = sys.stdin.readline

t = int(input().rstrip())
for _ in range(t) :
    n = int(input().rstrip())
    cnt = 0
    x = list(map(int, input().rstrip().split()))
    d = {i:True for i in x}
    for i in range(n):
        for j in range(i+1, n) :
            if (x[i]+x[j])/2 in d : cnt += 1
    print(cnt)
