def solution(lines):
    answer = 1
    a = []
    for line in lines:
        _, time, spend_time = line.split()
        h, m, s = map(float,time.split(':'))
        time = h*3600 + m*60 + s
        a.append([time-float(spend_time[:-1])+0.001, time])
    for _, net in a:
        count = 0
        for st, et in a:
            if st <= net+1 and net <= et:
                count += 1 
        answer = max(answer,count)
    return answer
