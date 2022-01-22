import sys
input = sys.stdin.readline
n = input().rstrip()
m = int(input().rstrip())
r = [True for _ in range(10)]
if m :
    for i in list(map(int,input().rstrip().split())): r[i] = False

result = abs(int(n)-100)

def check(j):
    global result
    success = True
    for c in str(int(n)+j) :
        if not r[int(c)]: success = False; break
    if success :
        result = min(len(str(int(n)+j))+abs(j),result)
    return success

for i in range(int(n)+101) :
    if int(n) >= i and check(-i): print(result); exit()
    elif check(i) : print(result); exit()
print(result)
