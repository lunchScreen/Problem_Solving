n = input()
cnt = 0
while int(n) >= 10 :
    num = 0
    for c in n :
        num += int(c)
    n = str(num)
    cnt += 1
print(cnt)
print("NO" if int(n) % 3 else "YES")
