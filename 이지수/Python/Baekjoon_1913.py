import sys
input = sys.stdin.readline

n = int(input())
num = int(input())
rx, ry = 0, 0
for i in range(-(n//2), n//2+1) :
    for j in range(-(n//2), n//2+1) :
        ci = max(abs(i), abs(j))
        cn = ci*2-1
        cr = 0
        if i == 0 and j == 0 : cr=1
        elif j == -ci : cr=(cn+2)**2-ci-i
        elif j == ci : cr=cn**2+j+2*ci+i
        elif i < 0: cr=cn**2+j+ci
        else : cr=(cn+2)**2-2*ci-i-j
        print(cr, end=' ')
        if cr == num : rx=i+(n//2)+1; ry=j+(n//2)+1
    print('')
print(rx,ry)
