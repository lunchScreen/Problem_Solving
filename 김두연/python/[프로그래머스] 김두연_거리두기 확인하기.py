from collections import deque

def solution(places):
    answer = []

    for place in places:
        result = True

        for i in range(5):
            for j in range(5):
                if place[i][j] == 'P':
                    if not bfs(place, [i, j, 0]):
                        result = False
                        break
            if not result:
                break
        if result:
            answer.append(1)
        else:
            answer.append(0)
    return answer


def bfs(place, idx):
    dq = deque([idx])
    visited = [[False] * 5 for _ in range(5)]
    dx = [1, 0, -1, 0]
    dy = [0, 1, 0, -1]
    visited[idx[0]][idx[1]] = True

    while dq:
        x, y, d = dq.popleft()

        if d >= 3:
            break
        if d > 0 and place[x][y] == 'P':
            return False

        for i in range(4):
            nx = x + dx[i]
            ny = y + dy[i]
            nd = d + 1

            if 0 <= nx < 5 and 0 <= ny < 5:
                if place[nx][ny] != 'X' and not visited[nx][ny]:
                    dq.append([nx, ny, nd])
                    visited[nx][ny] = True
    return True