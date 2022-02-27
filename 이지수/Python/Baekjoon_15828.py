import sys
from collections import deque
input = sys.stdin.readline

n = int(input().strip())
q = deque()
info = int(input().strip())
while info != -1 :
    if info == 0 : q.popleft()
    elif len(q) < n : q.append(info)
    info = int(input().strip())
if q : [print(node, end=' ') for node in q]
else : print('empty')
