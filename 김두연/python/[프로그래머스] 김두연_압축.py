def solution(msg):
    answer = []
    next_idx = 27
    d = dict()

    for i in range(26):
        num = ord('A')
        w = chr(num + i)
        d[w] = i + 1

    idx = 0

    while idx < len(msg):
        left = len(msg) - idx
        for i in range(1, left + 1):
            if not msg[idx: idx + i] in d:
                answer.append(d[msg[idx: idx + i - 1]])
                d[msg[idx:idx + i]] = next_idx
                next_idx += 1
                idx = idx + i - 1
                break
        if msg[idx:] in d:
            answer.append(d[msg[idx:]])
            break
    return answer

solution('KAKAO')