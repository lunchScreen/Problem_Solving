# 1034
import sys
input = sys.stdin.readline

def getNum(line) :
	return int("0b" + "".join(line), 2)

def orders(lines) :
	order = {}	
	for line in lines :
		num = getNum(line) 
		if num in order : order[num] = (order[num][0]+1, line)
		else : order[num] = (1, line)
	return order

def isAvailable(line, isEnum) :
	count = line.count("0")
	return count <= k and count % 2 == isEnum 

def maxLineCount(orders) :
	for _, order in sorted(orders.items(), key=lambda item: item[1][0], reverse=True):
		if isAvailable(order[1], k % 2) : return order[0]
	return 0

n, m = map(int, input().split())
lines = [list(input().rstrip()) for _ in range(n)]
k = int(input())
print(maxLineCount(orders(lines)))
