import heapq, sys
input = sys.stdin.readline

N = int(input().strip())
def dijkstra(graph) :
    dists = [[float('inf')] * N for _ in range(N)]
    dists[0][0] = graph[0][0]
    queue = [[dists[0][0], 0, 0]]
    heapq.heapify(queue)
    while queue:
        c = heapq.heappop(queue)
        c_dist = c[0]
        c_dest = (c[1], c[2])
        if dists[c_dest[0]][c_dest[1]] < c_dist : continue
        for n_dest_x, n_dest_y in [(c_dest[0]-1, c_dest[1]), (c_dest[0]+1, c_dest[1]), (c_dest[0], c_dest[1]-1), (c_dest[0], c_dest[1]+1)] :
            if not (0 <= n_dest_x < N and 0 <= n_dest_y < N) : continue
            dist = c_dist + graph[n_dest_x][n_dest_y]
            if dist < dists[n_dest_x][n_dest_y] :
                dists[n_dest_x][n_dest_y] = dist
                heapq.heappush(queue, [dist, n_dest_x, n_dest_y])
    return dists[N-1][N-1]

idx = 0
while N != 0 :
    idx += 1
    graph = [list(map(int, input().strip().split())) for _ in range(N)]
    print('Problem %d: %d' % (idx, dijkstra(graph)))
    N = int(input().strip())
