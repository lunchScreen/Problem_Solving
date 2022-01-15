import sys
from itertools import combinations as cm
input = sys.stdin.readline

s = list(input().rstrip().split())
while s[0] != '0' :
    s = s[1:]
    [print(' '.join(line)) for line in cm(s, 6)]
    print()
    s = list(input().rstrip().split())
