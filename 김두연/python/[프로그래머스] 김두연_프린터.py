from collections import deque

def solution(priorities, location):
    answer = 0
    p_list = deque(priorities)
    while p_list:
        i = p_list.popleft()
        location -= 1
        for j in p_list:
            if i < j:
                p_list.append(i)
                if location == -1:
                    location = len(p_list) - 1
                break
        else:
            answer += 1
            if location == -1: break

    return answer