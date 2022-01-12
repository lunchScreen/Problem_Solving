def solution(lines):
    start_time = []
    end_time = []

    for line in lines:
        line_split = line.split(' ')
        end = caltime(line_split[1])
        dur = float(line_split[2][:-1])
        start = float(end) - dur
        start += float(0.001)
        start_time.append(start)
        end_time.append(end)

    answer = 0

    for i in range(len(lines)):
        cnt = 0
        end = end_time[i]
        for j in range(i, len(lines)):
            if end > start_time[j] - 1:
                cnt += 1
        answer = max(answer, cnt)

    return answer


def caltime(time):
    time_split = time.split(':')
    result = float(int(time_split[0]) * 3600)
    result += float(int(time_split[1]) * 60)
    result += float(time_split[2])

    return result