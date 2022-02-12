import sys, heapq
input = sys.stdin.readline

def calculate(arr) :
    num = 0
    while len(arr) > 1 :
        ch1 = heapq.heappop(arr)
        ch2 = heapq.heappop(arr)
        num += ch1+ch2
        heapq.heappush(arr, ch1+ch2)
    return num

for _ in range(int(input().strip())) :
    k = int(input().strip())
    chs = list(map(int, input().strip().split()))
    heapq.heapify(chs)
    print(calculate(chs))
