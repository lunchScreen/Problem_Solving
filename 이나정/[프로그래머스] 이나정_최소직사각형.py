def solution(sizes):
    answer = 0
    width = []
    height = []
    for s in sizes:
        width.append(max(s[0], s[1]))
        height.append(min(s[0], s[1]))
    return max(width) * max(height)
