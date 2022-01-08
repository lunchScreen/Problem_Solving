import sys
input = sys.stdin.readline
l = [0]*10001
for _ in range(int(input())) : l[int(input())]+=1 
for i in range(len(l)) :
    for _ in range(l[i]) : sys.stdout.write(str(i)+"\n")
