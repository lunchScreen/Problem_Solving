from collections import deque

def solution(begin, target, words):
    visited = [False] * len(words)
    if not target in words:
        return 0
    dq = deque([(begin, 0)])

    while dq:
        current_word, distance = dq.popleft()
        for i in range(len(words)):
            if not visited[i] and sum([x != y for x, y in zip(words[i], current_word)]) == 1:
                if words[i] == target:
                    return distance + 1
                visited[i] = True
                dq.append((words[i], distance + 1))

    return 0