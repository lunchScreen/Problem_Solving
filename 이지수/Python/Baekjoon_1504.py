import sys, heapq
input = sys.stdin.readline

def dijkstra(s, graph, N) :
    dists = [float('inf')] * (N+1)
    dists[s] = 0
    queue = [[dists[s], s]]
    heapq.heapify(queue)
    while queue:
        c = heapq.heappop(queue)
        c_dist = c[0]
        c_dest = c[1]
        if dists[c_dest] < c_dist : continue
        for n_dest in graph[c_dest].keys() :
            dist = c_dist + graph[c_dest][n_dest]
            if dist < dists[n_dest] :
                dists[n_dest] = dist
                heapq.heappush(queue, [dist, n_dest])
    return dists

N, E = map(int, input().strip().split())
graph = {i:{} for i in range(1, N+1)}
for _ in range(E) :
    a, b, c = map(int, input().strip().split())
    graph[a][b] = c
    graph[b][a] = c
v1, v2 = map(int, input().strip().split())
dist = [[float('inf')] * 4 for _ in range(3)]
dists = dijkstra(v1, graph, N)
dist[0][1] = dists[1]
dist[1][0] = dists[1]
dist[1][2] = dists[v2]
dist[2][1] = dists[v2]
dist[1][3] = dists[N]
dists = dijkstra(v2, graph, N)
dist[0][2] = dists[1]
dist[2][0] = dists[1]
dist[2][3] = dists[N]
minDist = min(dist[0][1] + dist[1][2] + dist[2][3], dist[0][2] + dist[2][1] + dist[1][3])
print(minDist if minDist < float('inf') else -1)
