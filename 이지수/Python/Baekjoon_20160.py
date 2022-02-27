import sys, heapq
input = sys.stdin.readline

V, E = map(int, input().strip().split())
graph = {i: [] for i in range(1, V+1)}
for _ in range(E) :
    u, v, w = map(int, input().strip().split())
    graph[u].append((v, w))
    graph[v].append((u, w))
vs = list(map(int, input().strip().split()))
c = int(input().strip())

def dijkstra(s) :
    dists = [float('inf')] * (V+1)
    dists[s] = 0
    queue = [(dists[s], s)]
    heapq.heapify(queue)
    while queue:
        c_dist, c_dest = heapq.heappop(queue)
        if dists[c_dest] < c_dist : continue
        for n_dest, n_dist in graph[c_dest] :
            dist = c_dist + n_dist
            if dist < dists[n_dest] :
                dists[n_dest] = dist
                heapq.heappush(queue, [dist, n_dest])
    return dists

me = dijkstra(c)
seller = vs[0]
result = float('inf')
curtime = 0
if c == vs[0] : result = vs[0]
for v in vs :
    time = dijkstra(seller)[v]
    if time == float('inf') : continue
    seller = v
    curtime += time
    if me[v] <= curtime : result = min(result, v)

if result != float('inf') : print(result)
else : print(-1)
