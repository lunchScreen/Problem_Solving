N = int(input())
arr = list(map(int, input().split()))
answer = []
stack = []

for (idx, num) in enumerate(arr):
    while(stack) and stack[-1][1] < num:
        stack.pop(-1)
    if len(stack) == 0:
        answer.append(0)
    else:
        answer.append(stack[-1][0])
    stack.append([idx + 1, num])
    
for a in answer:
    print(a, end=" ")
