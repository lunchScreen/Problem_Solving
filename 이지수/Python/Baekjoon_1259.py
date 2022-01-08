import sys
input = sys.stdin.readline

n = input().rstrip()
[print(n[i]) for i in range(len(n)//2) if n[i] != n[len(n)-1-i]]
while(n != '0') :
    print('no' if len([True for i in range(len(n)//2) if n[i] != n[len(n)-1-i]]) else 'yes')
    n = input().rstrip()
