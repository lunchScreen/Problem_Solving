def solution(n, times):
    times.sort()
    left = 1
    right = times[-1] * n
    answer = right

    while left <= right:
        mid = (left + right) // 2
        total = 0
        for time in times:
            total += mid // time
        if total < n:
            left = mid + 1
        else:
            right = mid - 1
            answer = min(answer, mid)

    return answer
