import sys, heapq
input = sys.stdin.readline

T = int(input().strip())

def dijkstra(s, e, obstacle, H, W, F) :
    dists = [[float('inf')] * W for _ in range(H)]
    dists[s[0]][s[1]] = 0
    queue = [[0, obstacle[s[0]][s[1]], s[0], s[1]]]
    heapq.heapify(queue)
    while queue :
        c = heapq.heappop(queue)
        c_dist, c_height, c_dest = c[0], c[1], (c[2], c[3])
        if dists[c_dest[0]][c_dest[1]] < c_dist : continue
        for n_dest_x, n_dest_y in [(c_dest[0]+1, c_dest[1]), (c_dest[0]-1, c_dest[1]), (c_dest[0], c_dest[1]+1), (c_dest[0], c_dest[1]-1)] :
            if not (0<=n_dest_x<H and 0<=n_dest_y<W) : continue
            elif max(0, obstacle[n_dest_x][n_dest_y]-c_height) > F-c_dist : continue
            if c_dist+1 < dists[n_dest_x][n_dest_y] :
                dists[n_dest_x][n_dest_y] = c_dist+1
                heapq.heappush(queue, [c_dist+1, obstacle[n_dest_x][n_dest_y], n_dest_x, n_dest_y])
    return dists[e[0]][e[1]]

for _ in range(T) :
    H, W, O, F, Xs, Ys, Xe, Ye = map(int, input().strip().split())
    obstacle = [[0] * W for _ in range(H)]
    for _ in range(O) :
        x, y, l = map(int, input().strip().split())
        obstacle[x-1][y-1] = l
    if dijkstra((Xs-1, Ys-1), (Xe-1, Ye-1), obstacle, H, W, F) > F : print("인성 문제있어??")
    else : print("잘했어!!")
