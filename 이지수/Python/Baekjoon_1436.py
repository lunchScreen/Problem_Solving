import sys
cnt = 0
num = 666
n = int(sys.stdin.readline())
while True :
    if '666' in str(num) : cnt += 1
    if cnt == n : 
        print(num); exit()
    num += 1
