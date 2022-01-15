from sys import stdin
imput = stdin.readline
n, m = map(int, input().rstrip().split())
dnas = [input().rstrip() for _ in range(n)]
result = ''
atgc = ['A', 'C', 'G', 'T']
dist = 0
for i in range(m): 
    cnt = [0, 0, 0, 0]
    for dna in dnas :
        if dna[i] == 'A' : cnt[0] += 1
        elif dna[i] == 'C' : cnt[1] += 1
        elif dna[i] == 'G' : cnt[2] += 1
        elif dna[i] == 'T' : cnt[3] += 1
    maxV = max(cnt)
    result += atgc[cnt.index(maxV)]
    dist += sum(cnt) - maxV

print(result)
print(dist) 
