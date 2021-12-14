import sys
input = sys.stdin.readline

def exponent2(value) :
    count = 0
    num = 1
    while value >= num :
        num *= 2
        count += 1
    return count - 1

def exponents2(value) :
    vs = []
    while (value > 1) :
        vs.append(int(exponent2(value)))
        value -= (2 ** vs[-1])
    if value == 1 :
        vs.append(0)
    return vs

def makefill(vs, k):
    count = 0
    while len(vs) > k :
        add = 2**vs[-2] - (2**vs[-1])
        vs.append(vs[-2]+1)
        count += add
        del vs[-3:-1]
    return count

n, k = map(int, input().split())
print(makefill(exponents2(n), k))
