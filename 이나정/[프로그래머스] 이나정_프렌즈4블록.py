remove_block = []
totalMap = []

def fallBlock(n):
    global remove_block, totalMap
    for block in remove_block:
        totalMap[block[0]][block[1]] = ""
    for i in range(n):
        count = totalMap[i].count("")
        totalMap[i] = [x for x in totalMap[i] if x != ""]
        totalMap[i] += ["" for _ in range(count)]

def removable(m, n):
    global remove_block, totalMap
    remove_block.clear()
    for x in range(m-1):
        for y in range(n-1):
            if totalMap[x][y] != "" and totalMap[x][y] == totalMap[x][y+1] == totalMap[x+1][y] == totalMap[x+1][y+1]:
                for pair in [[x, y], [x+1, y], [x, y+1], [x+1, y+1]]:
                    if pair not in remove_block:
                        remove_block.append(pair)
    return True if remove_block else False
                        
def solution(m, n, board):
    global totalMap
    for x in range(n):
        temp = []
        for y in range(m):
            temp.append(board[m-y-1][x])
        totalMap.append(temp)
        
    answer = 0
    while(removable(n, m)):
        removable(n, m)
        answer += len(remove_block)
        fallBlock(n)
    return answer
