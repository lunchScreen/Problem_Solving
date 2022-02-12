import sys
from collections import deque
input = sys.stdin.readline

for _ in range(int(input().strip())):
    r = False
    p = input().strip()
    arr = []
    if int(input().strip()) > 0 : arr = list(map(int, input().strip()[1:-1].split(",")))
    else : _ = input().strip()
    arr = deque(arr)
    error = False
    for f in p :
        if f == "R" : r = not r
        else : 
            if arr : 
                if r : arr.pop()
                else : arr.popleft()
            else : error = True; break
    if error : print("error")
    else : 
        if r : arr.reverse()
        print("[", end = "")
        for i in range(len(arr)) :
            if i != len(arr)-1 : print(arr[i], end=",")
            else : print(arr[i], end="")
        print("]")
