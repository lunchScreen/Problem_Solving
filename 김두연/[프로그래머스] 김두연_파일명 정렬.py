import re

def solution(files):
    answer = []

    for file in files:
        split = re.split('(\d+)', file)
        answer.append((split[0], split[1], str(''.join(split[2:]))))

    answer.sort(key=lambda x: (x[0].lower(), int(x[1])))

    return [''.join(x) for x in answer]