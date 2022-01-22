import sys
input = sys.stdin.readline

cs = input().rstrip()
cnt = 0
for _ in range(int(input().rstrip())) :
    c = input().rstrip()
    if cs in c+c :
        cnt += 1
print(cnt)
