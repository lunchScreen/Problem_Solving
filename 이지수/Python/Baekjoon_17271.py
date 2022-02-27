import sys
input = sys.stdin.readline
N, M = map(int, input().strip().split())
result = 0
m = 0
facs = [1]
val = 1
for i in range(1, N+1) :
    val *= i
    facs.append(val)
for i in range(N, -1, -M) :
    result += int(facs[i+(N-i)//M]//(facs[i]*facs[(N-i)//M]))
print(result%1000000007)
