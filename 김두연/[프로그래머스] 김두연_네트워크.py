def solution(n, computers):
    answer = 0
    visited = [False] * n
    queue = []

    for i in range(n):
        if not visited[i]:
            answer += 1
            visited[i] = True
            queue.append(i)
            while queue:
                node = queue.pop(0)
                for j in range(n):
                    if not visited[j] and computers[node][j] == 1 and node != j:
                        visited[j] = True
                        queue.append(j)

    return answer