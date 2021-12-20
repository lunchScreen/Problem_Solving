Dir = [[-1, 0], [1, 0], [0, 1], [0, -1]]
        
def getPosition(N, M, arr):
    for i in range(M):
        for j in range(N):
            if arr[i][j] == 1:
                return [i, j]
    return [-1, -1]

def giveWorm(N, M, arr):
    [x, y] = getPosition(N, M, arr)
    arr[x][y] = 0
    near = [[x, y]]
    while(len(near) > 0):
        x, y = near[0][0], near[0][1]
        near.pop(0)
        for d in Dir:
            nx = x + d[0]
            ny = y + d[1]
            if 0 <= nx < M and 0 <= ny < N and arr[nx][ny] == 1:
                near.append([nx, ny])
                arr[nx][ny] = 0
            
    return arr
    
if __name__ == "__main__":
    T = int(input())
    
    for _ in range(T):
        answer = 0
        M, N, K = map(int, input().split())
        arr = [[0 for _ in range(N)] for _ in range(M)]
        for _ in range(K):
            x, y = map(int, input().split())
            arr[x][y] = 1
            
        while(getPosition(N, M, arr)[0] != -1):
            arr = giveWorm(N, M, arr)
            answer += 1
        print(answer)
