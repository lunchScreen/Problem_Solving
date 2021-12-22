def solution(brown, yellow):
    answer = []
    total = brown + yellow
    for i in range(2, int(total**0.5)+1):
        if total % i == 0:
            w = total // i
            h = i
            if 2*w + (h-2)*2 == brown:
                answer = [w, h]
                break
    return answer