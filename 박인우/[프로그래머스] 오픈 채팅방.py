def solution(record):
    answer = []
    nickname = {}
    for info in record:
        info = info.split()
        if info[0] == "Enter":
            nickname[info[1]] = info[2]
            answer.append((info[1], "님이 들어왔습니다."))
        if info[0] == "Leave":
            answer.append((info[1], "님이 나갔습니다."))
        if info[0] == "Change":
            nickname[info[1]] = info[2]
    return [nickname[i[0]]+i[1] for i in answer]
