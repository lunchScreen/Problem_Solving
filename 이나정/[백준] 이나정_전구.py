N, M = map(int, input().split())
arr = list(map(int, input().split()))

for _ in range(M):
    command, l, r = map(int, input().split())
    if command == 1:
        for _ in range(N):
            arr[l-1] = r
    elif command == 2:
        for x in range(l-1, r):
            arr[x] = 1 if arr[x] == 0 else 0
    elif command == 3:
        for x in range(l-1, r):
            arr[x] = 0
    else:
        for x in range(l-1, r):
            arr[x] = 1

for a in arr:
    print(a, end=" ")
