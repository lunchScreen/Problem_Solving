def solution(s):
    s_split = s.split(' ')
    answer = [w.capitalize() for w in s_split]

    return ' '.join(answer)