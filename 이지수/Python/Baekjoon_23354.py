import heapq, sys
from itertools import permutations as pm
input = sys.stdin.readline

n = int(input().strip())

def dijkstra(s, graph) :
    dists = [[float('inf')] * n for _ in range(n)]
    dists[s[0]][s[1]] = 0
    queue = [[dists[s[0]][s[1]], s[0], s[1]]]
    heapq.heapify(queue)
    while queue:
        c = heapq.heappop(queue)
        c_dist = c[0]
        c_dest = (c[1], c[2])
        if dists[c_dest[0]][c_dest[1]] < c_dist : continue
        for n_dest_x, n_dest_y in [(c_dest[0]-1, c_dest[1]), (c_dest[0]+1, c_dest[1]), (c_dest[0], c_dest[1]-1), (c_dest[0], c_dest[1]+1)] :
            if not (0 <= n_dest_x < n and 0 <= n_dest_y < n) : continue
            dist = c_dist + graph[n_dest_x][n_dest_y]
            if dist < dists[n_dest_x][n_dest_y] :
                dists[n_dest_x][n_dest_y] = dist
                heapq.heappush(queue, [dist, n_dest_x, n_dest_y])
    return dists

def minDist(unit, graph, deserters) :
    if not deserters : return 0
    minDist = float('inf')
    dists = [[float('inf')] * (len(deserters)+1) for _ in range(len(deserters)+1)]
    dists[0][0] = 0
    for i in range(1, len(deserters)+1) :
        idist = dijkstra(deserters[i-1], graph)
        for j in range(len(deserters)+1) :
            if j == 0 : 
                dists[i][j] = idist[unit[0]][unit[1]]
                dists[j][i] = dists[i][j]
            else :
                dists[i][j] = idist[deserters[j-1][0]][deserters[j-1][1]]
                dists[j][i] = dists[i][j]

    for order in pm(range(1, len(deserters)+1), len(deserters)) :
        dist = 0
        c = 0
        for dest in order :
            dist += dists[c][dest]
            c = dest
        dist += dists[c][0]
        minDist = min(dist, minDist)
    return minDist

graph = [list(map(int, input().strip().split())) for _ in range(n)]
deserters = []
c = ()
for x in range(n) :
    for y in range(n) :
        if graph[x][y] == -1 : 
            graph[x][y] = 0
            c = (x, y)
        elif graph[x][y] == 0 : deserters.append((x, y))
print(minDist(c, graph, deserters))
