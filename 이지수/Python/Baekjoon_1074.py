import sys

input = sys.stdin.readline
N, r, c = map(int, input().strip().split())
idx = 0
while N >= 0 :
    if r >= 2**N :
        idx += (2**N)**2*2
        r -= 2**N
    if c >= 2**N : 
        idx += (2**N)**2
        c -= 2**N
    N -= 1
print(idx)
