def solution(prices):
    answer = [0] * len(prices)
    stack = []
    for i in range(len(prices)):
        if not stack:
            stack.append(i)
        else:
            while stack and prices[stack[-1]] > prices[i]:
                time = stack.pop()
                answer[time] = i - time

            stack.append(i)

    while stack:
        time = stack.pop()
        answer[time] = len(prices) - time - 1

    return answer