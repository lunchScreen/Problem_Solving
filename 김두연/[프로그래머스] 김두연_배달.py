import heapq

def solution(N, road, K):
    INF = float('inf')
    dis = [INF] * (N + 1)
    dis[1] = 0
    adj = [[] for _ in range(N + 1)]
    for r in road:
        src, dest, d = r
        adj[src].append([d, dest])
        adj[dest].append([d, src])
    dijkstra(dis, adj)
    return len([x for x in dis if x <= K])


def dijkstra(dis, adj):
    queue = []
    heapq.heappush(queue, [0, 1])

    while queue:
        cur_d, node = heapq.heappop(queue)
        for distance, adj_node in adj[node]:
            if cur_d + distance < dis[adj_node]:
                dis[adj_node] = cur_d + distance
                heapq.heappush(queue, [cur_d + distance, adj_node])