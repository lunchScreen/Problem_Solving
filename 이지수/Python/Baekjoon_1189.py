import sys
input = sys.stdin.readline

def backtraking(cl, s):
    global count
    if not map[cl] : return
    if len(s)+1 == k : 
        if cl == c-1 : count += 1
        return
    if cl+1 not in s and cl%c < c-1 : 
        backtraking(cl+1, s+[cl])
    if cl+c not in s and cl//c < r-1 :
        backtraking(cl+c, s+[cl])
    if cl-1 not in s and cl%c > 0 :
        backtraking(cl-1, s+[cl])
    if cl-c not in s and cl > c-1 :
        backtraking(cl-c, s+[cl])

r, c, k = map(int,input().split())
map = []
for i in range(r):
    map.append([c=='.' for c in list(input().rstrip())])
map = sum(map, [])
count = 0
backtraking(c*(r-1), [])
print(count)
