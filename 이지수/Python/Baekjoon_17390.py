import sys
input = sys.stdin.readline

N, Q = map(int, input().strip().split())
B = sorted(list(map(int, input().strip().split())))
bl = 0; br = N-1
sums = [0]
for i in range(N) :
    sums.append(sums[i]+B[i])

for _ in range(Q) :
    L, R = map(int, input().strip().split())
    print(sums[R]-sums[L-1])
