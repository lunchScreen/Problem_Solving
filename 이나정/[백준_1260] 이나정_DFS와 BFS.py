def dfs(start):
    visited.append(start)
    print(start, end = " ")
    arr[start].sort()
    for i in arr[start]:
        if i not in visited:
            dfs(i)

def bfs(start):
    next = [start]
    visited.append(start)
    while next:
        tmp = next[0]
        print(tmp, end = " ")
        next = next[1:]
        arr[tmp].sort()
        for i in arr[tmp]:
            if i not in visited:
                next.append(i)
                visited.append(i)
    
N, M, S = map(int, input().split())
arr = [[] for _ in range(N + 1)]

for m in range(M):
    a, b = map(int, input().split())
    arr[a].append(b)
    arr[b].append(a)
    
visited = []
dfs(S)
print()
visited = []
bfs(S)   

