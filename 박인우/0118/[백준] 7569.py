import sys
from collections import deque
sys.setrecursionlimit(10 ** 5)
input = sys.stdin.readline

m,n,h = map(int,input().split()) 
graph = []
que = deque([])

for z in range(h):
    tmp = []
    for y in range(n):
        tmp.append(list(map(int,input().split())))
    graph.append(tmp)

for z in range(h):
    for y in range(n):
        for x in range(m):
            if graph[z][y][x] == 1:
                que.append([x,y,z])
    
dx = [-1,1,0,0,0,0]
dy = [0,0,1,-1,0,0]
dz = [0,0,0,0,1,-1]

while(que):
    x,y,z = que.popleft()
    
    for i in range(6):
        nx = x + dx[i]
        ny = y + dy[i]
        nz = z + dz[i]
        if 0 <= nz < h and 0 <= ny < n and 0 <= nx < m and graph[nz][ny][nx] == 0:
            que.append([nx,ny,nz])
            graph[nz][ny][nx] = graph[z][y][x] + 1
            
day = 0
for zs in graph:
    for ys in zs:
        for x in ys:
            if x == 0:
                print(-1)
                exit(0)
        day = max(day,max(ys))
      
print(day-1)
