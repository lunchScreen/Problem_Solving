K = int(input())
arr = []

for _ in range(K):
    num = int(input())
    if num == 0:
        arr.pop(-1)
    else:
        arr.append(num)
        
print(sum(arr))
