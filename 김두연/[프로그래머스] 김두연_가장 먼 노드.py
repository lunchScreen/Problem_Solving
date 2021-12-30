def solution(n, edge):
    graph = [[] for _ in range(n)]
    distance = [0] * n

    for e in edge:
        graph[e[0] - 1].append(e[1] - 1)
        graph[e[1] - 1].append(e[0] - 1)

    queue = [0]
    visited = [False] * n
    visited[0] = True

    while queue:
        node = queue.pop(0)
        d = distance[node]

        for next_node in graph[node]:
            if not visited[next_node]:
                visited[next_node] = True
                distance[next_node] = distance[node] + 1
                queue.append(next_node)

    distance.sort(reverse=True)

    return distance.count(distance[0])