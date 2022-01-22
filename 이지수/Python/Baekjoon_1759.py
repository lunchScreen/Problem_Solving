import sys, itertools
input = sys.stdin.readline
l, c = map(int, input().rstrip().split())
cs = sorted(list(input().rstrip().split()))
for c in itertools.combinations(cs, l):
    cnt = 0
    for i in c : 
        if i in 'aeiou' : cnt += 1
    if cnt < 1 or l-cnt < 2 : continue
    print(''.join(c))
