def solution(s):
    s = "".join(list(s)[2:-2])
    ss = s.split("},{")
    tuple = []
    for item in sorted(ss, key=lambda x: len(x)) :
        [tuple.append(num) for num in list(map(int, item.split(","))) if num not in tuple]
    return tuple
