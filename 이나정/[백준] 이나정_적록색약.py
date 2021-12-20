import copy

Dir = [[-1, 0], [1, 0], [0, 1], [0, -1]]

# for Debug
def printAll(N, arr):
    for i in range(N):
        for j in range(len(arr[0])):
            print(arr[i][j], end=" ")
        print()
  
# R 을 G 로 바꾸는 함수
def chandgeColor(N, arr):
    for i in range(N):
        for j in range(len(arr[0])):
            if arr[i][j] == 'R':
                arr[i][j] = 'G'
    return arr

# 모든 원소를 확인했는지 검사하는 함수
def visitedAll(N, arr, visited):
    for i in range(N):
        for j in range(len(arr[0])):
            if visited[i][j] == 0:
                return [i, j]
    return [-1, -1]

# 하나의 구역을 순환하는 함수
def oneBoundary(N, arr, visited):
    [x, y] = visitedAll(N, arr, visited)
    visited[x][y] = 1
    color = arr[x][y]
    near = [[x, y]]
    while(len(near) > 0):
        x, y = near[0][0], near[0][1]
        near.pop(0)
        for d in Dir:
            nx = x + d[0]
            ny = y + d[1]
            if 0 <= nx < len(arr[0]) and 0 <= ny < N and arr[nx][ny] == color and visited[nx][ny] == 0:
                near.append([nx, ny])
                visited[nx][ny] = 1
    return arr, visited
    
# arr 에서 구역의 수를 계산하는 함수
def calBoundary(N, arr):
    visited = [[0 for _  in range(len(arr[0]))] for _ in range(N)]
    answer = 0
    while(visitedAll(N, arr, visited)[0] != -1):
        arr, visited = oneBoundary(N, arr, visited)
        answer += 1
    print(answer, end=" ")

if __name__ == "__main__":
    N = int(input())
    arr = [list(input()) for _ in range(N)]
    arr2 = copy.deepcopy(arr)
    
    calBoundary(N, arr)
    arr2 = chandgeColor(N, arr2)
    calBoundary(N, arr2)
