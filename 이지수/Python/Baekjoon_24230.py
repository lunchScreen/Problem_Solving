import sys
from collections import deque
input = sys.stdin.readline
N = int(input().strip())
color = [0] + list(map(int, input().strip().split()))
count = 0 if color[1] == 0 else 1
node = {i: [] for i in range(1, N+1)}
for i in range(N-1) :
    a, b = map(int, input().strip().split())
    node[b] = node[b] + [a]
    node[a] = node[a] + [b]
def bfs():
    count = 0
    queue = deque([1])
    visited = [False] * (N+1)
    parent = {i : N+1 for i in range(1, N+1)}
    parent[1] = 0 
    while queue :
        n = queue.popleft()
        if visited[n] : continue
        visited[n] = True
        if color[parent[n]] != color[n] : count += 1
        for e in node[n] :
            if not visited[e] :
                queue.append(e)
                if parent[e] > N : parent[e] = n
    return count
print(bfs())
