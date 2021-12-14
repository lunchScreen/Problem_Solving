def solution(name):
    idx = 0
    answer = 0
    _name = list(name)
    while True:
        answer += min((ord(name[idx]) - ord('A')), (ord('Z') - ord(name[idx]) + 1))
        _name[idx] = 'A'
        name = ''.join(_name)
        right_cnt = 0
        left_cnt = 0
        for i in range(idx + 1, len(name)):
            if name[i] != 'A':
                right_cnt = i - idx
                break
        for i in range(1, len(name)):
            if name[idx - i] != 'A':
                left_cnt = i
                break
        if right_cnt == 0 and left_cnt == 0:
            break
        elif right_cnt == 0:
            answer += left_cnt
            if idx - left_cnt < 0:
                idx = len(name) + idx - left_cnt
            else:
                idx = idx - left_cnt
        elif left_cnt == 0:
            answer += right_cnt
            idx += right_cnt

        elif right_cnt <= left_cnt:
            answer += right_cnt
            idx += right_cnt
        else:
            answer += left_cnt
            if idx - left_cnt < 0:
                idx = len(name) + idx - left_cnt
            else:
                idx = idx - left_cnt

    return answer