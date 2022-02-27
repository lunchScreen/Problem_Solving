import heapq, sys
input = sys.stdin.readline

def dijkstra(graph, s) :
    dists = {i: float('inf') for i in graph}
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

t = int(input().strip())
for _ in range(t) :
    n, m = map(int, input().strip().split())
    graph = {r: [] for r in range(1, n+1)}
    for _ in range(m) :
        a, b, c = map(int, input().strip().split())
        graph[a] = graph[a] + [(b, c)]
        graph[b] = graph[b] + [(a, c)]
    k = int(input().strip())
    rs = list(map(int, input().strip().split()))
    result = 0
    minDist = float('inf')
    for s in range(1, n+1) :
        dists = dijkstra(graph, s)
        dist = 0
        for r in rs : dist += dists[r]
        if dist < minDist : 
            minDist = dist
            result = s
    print(result)
