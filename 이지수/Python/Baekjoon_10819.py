from itertools import permutations as pm
import sys
input = sys.stdin.readline

n = int(input().rstrip())
a = list(map(int, input().rstrip().split()))
result = 0
for nums in pm(a):
    c = 0
    for i in range(n-1) :
        c += abs(nums[i] - nums[i+1])
    result = max(c, result)
print(result)
