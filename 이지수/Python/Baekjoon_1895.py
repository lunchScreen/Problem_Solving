import sys
input = sys.stdin.readline
r, c = map(int, input().rstrip().split())
image = [list(map(int, input().rstrip().split())) for _ in range(r)]
t = int(input().rstrip())
cnt = 0
for i in range(0, r-2):
    for j in range(0, c-2):
        if sorted(sum([image[k][j:j+3] for k in range(i, i+3)], []))[4] >= t : cnt+=1
print(cnt)
