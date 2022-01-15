from itertools import permutations as pm
from sys import stdin
n = int(stdin.readline())
for step in pm([i for i in range(1, n+1)]) :
    for s in step :
        print(s, end=" ")
    print()
