def solution(w, h):
    if w == h:
        return w*h - w
    a, b = (w, h) if w > h else (h, w)
    while a % b != 0:
        a, b = b, a % b
    return w*h - (w+h-b)
