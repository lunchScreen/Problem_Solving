def solution(n, m):
    a, b = (n, m) if n > m else (m, n)
    while a % b != 0:
        a, b = b, a % b

    return [b, int(n*m/b)]
