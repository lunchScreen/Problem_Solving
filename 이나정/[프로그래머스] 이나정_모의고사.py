student = [[1, 2, 3, 4, 5], [2, 1, 2, 3, 2, 4, 2, 5], [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]]

def solution(answers):
    ret = []
    result = [0, 0, 0]
    for i in range(len(answers)):
        for j in range(3):
            if answers[i] == student[j][i % len(student[j])]:
                result[j] += 1
    for j in range(3):
        if result[j] == max(result):
            ret.append(j+1)
    return (ret)
