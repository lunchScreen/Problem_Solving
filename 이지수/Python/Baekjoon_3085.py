import sys
input = sys.stdin.readline

n = int(input().rstrip())
m = [list(input().rstrip()) for _ in range(n)]

def swap(a, b) :
    tmp = m[a//n][a%n]
    m[a//n][a%n] = m[b//n][b%n]
    m[b//n][b%n] = tmp

def check(a) :
    row = a//n
    col = a%n
    cnt = 1
    c = m[row][0]
    maxcnt = 1
    for i in range(1, n) :
        if m[row][i] == c : cnt += 1
        else :
            c = m[row][i]
            maxcnt = max(maxcnt, cnt)
            cnt = 1
    maxcnt = max(maxcnt, cnt)
    c = m[0][col]
    cnt = 1
    for i in range(1, n) :
        if m[i][col] == c : cnt += 1
        else :
            c = m[i][col]
            maxcnt = max(maxcnt, cnt)
            cnt = 1
    maxcnt = max(maxcnt, cnt)
    return maxcnt

mcnt = 1
for f in range(n) :
    if mcnt == n : break
    mcnt = max(check(f), mcnt)
for f in range(n**2) :
    if mcnt == n : break
    if f//n > 0 :
        swap(f, f-n)
        mcnt = max(check(f), mcnt, check(f-n))
        swap(f, f-n)
    if f//n < n-1 :
        swap(f, f+n)
        mcnt = max(check(f), mcnt, check(f+n))
        swap(f, f+n)
    if f%n > 0:
        swap(f, f-1)
        mcnt = max(check(f), mcnt, check(f-1))
        swap(f, f-1)
    if f%n < n-1:
        swap(f, f+1)
        mcnt = max(check(f), mcnt, check(f+1))
        swap(f, f+1)
print(mcnt)
