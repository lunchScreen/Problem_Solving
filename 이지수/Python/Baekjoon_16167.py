import sys, heapq
input = sys.stdin.readline
N, R = map(int, input().strip().split())
graph = {i: [] for i in range(1, N+1)}

for _ in range(R) :
    a, b, c, d, e = map(int, input().strip().split())
    graph[a].append((b, c+max(0,(e-10))*d))

def dijkstra() :
    dists = {i: float('inf') for i in range(1, N+1)}
    counts = {i: float('inf') for i in range(1, N+1)}
    dists[1] = 0
    counts[1] = 1
    queue = [(dists[1], counts[1], 1)]
    heapq.heapify(queue)
    while queue:
        c_dist, c_count, c_loc = heapq.heappop(queue)
        for n_loc, n_dist in graph[c_loc] :
            dist = c_dist+n_dist
            count = c_count+1
            if dist < dists[n_loc] or (dist == dists[n_loc] and count < counts[n_loc]):
                dists[n_loc] = dist
                counts[n_loc] = count
                heapq.heappush(queue, (dist, count, n_loc))
    return dists[N], counts[N]

result = dijkstra()
if result[0] != float('inf') : print("%d %d" %(result[0], result[1]))
else : print('It is not a great way.')
