import sys
from collections import deque
input = sys.stdin.readline

n = int(input().strip())
k = int(input().strip())
cs = {i: [] for i in range(1, n+1)}
for _ in range(k) :
    i, j = map(int, input().strip().split())
    cs[i] = cs[i]+[j]
    cs[j] = cs[j]+[i]
def bfs() :
    q = deque([1])
    v = [False for _ in range(n+1)]
    count = 0
    while q :
        node = q.popleft()
        if v[node] : continue
        v[node] = True
        count += 1
        [q.append(nn) for nn in cs[node] if not v[nn]]
    return count
print(bfs()-1)
