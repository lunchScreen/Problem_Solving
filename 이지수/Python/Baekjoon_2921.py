import sys, itertools

n = int(sys.stdin.readline())
l = list(itertools.combinations(range(n+1), 2))
[l.append((r,r)) for r in range(n+1)]
print(sum([a+b for a, b in l]))
