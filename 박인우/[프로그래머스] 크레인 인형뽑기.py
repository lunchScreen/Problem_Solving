def solution(board, moves):
    answer = 0
    stack = []
    for x in moves:
        x = x-1
        for y in range(len(board)):
            now = board[y][x]
            if now > 0:
                board[y][x] = 0
                if len(stack) and stack[-1] == now:
                    stack.pop()
                    answer += 2
                else:
                    stack.append(now)
                break
            else:
                continue
    return answer
