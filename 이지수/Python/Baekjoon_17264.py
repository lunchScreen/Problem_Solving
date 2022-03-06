import sys
input = sys.stdin.readline

n, p = map(int, input().strip().split())
w, l, g = map(int, input().strip().split())
kp = {}
for _ in range(p) :
    name, case = map(str, input().strip().split())
    if case == 'W' : kp[name] = True
def isIronman() : 
    score = 0
    result = True
    for _ in range(n) :
        name = input().strip()
        if name in kp : score += w
        else : score = max(0, score-l)
        if score >= g : result = False
    return result
print("I AM IRONMAN!!" if isIronman() else "I AM NOT IRONMAN!!")
