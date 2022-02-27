import heapq, sys
input = sys.stdin.readline

def dijkstra(s, e) :
    dists = {i: float('inf') for i in range(min(100001, 2*max(e, s)+1))}
    dists[s] = 0
    queue = [(dists[s], s)]
    heapq.heapify(queue)
    while queue:
        c_dist, c_dest = heapq.heappop(queue)
        if dists[c_dest] < c_dist : continue
        for n_dist, n_dest in [(0, 2*c_dest), (1, c_dest-1), (1, c_dest+1)] :
            if not (0 <= n_dest < len(dists)) : continue
            dist = c_dist + n_dist
            if dist < dists[n_dest] :
                dists[n_dest] = dist
                heapq.heappush(queue, [dist, n_dest])
    return dists

n, k = map(int, input().strip().split())
print(dijkstra(n, k)[k])
