#1043
import sys
input = sys.stdin.readline

def dfs(p):
    if vl[p] : return
    vl[p] = True
    q.extend(tree[p])

def makeTree() :
    tree = {p: [] for p in range(1, n+1)}
    tree[0] = rn
    for party in pl:
        for p in party :
            tree[p] = list(set(tree[p] + party))
    return tree

def solution() :
    ap = [index for index, v in enumerate(vl) if not v]; del ap[0]
    count = m
    for party in pl:
        for p in party :
            if p not in ap : 
                count -= 1; break
    return count

n, m = map(int, input().split())
rn = list(map(int, input().split())); del rn[0]
pl = [list(map(int, input().split()))[1:] for _ in range(m)]
tree = makeTree()
vl = [False] * (n+1)
q = tree[0]
while len(q) != 0 :
    dfs(q.pop(0))
print(solution())

