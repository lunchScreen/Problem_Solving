def solution(record):
    answer = []
    user = {}
    for str in record:
        split = str.split()
        if split[0] != "Leave":
            user[split[1]] = split[2]
    for str in record:
        split = str.split()
        if split[0] == "Enter":
            answer.append(user[split[1]] + "님이 들어왔습니다.")
        elif split[0] == "Leave":
            answer.append(user[split[1]] + "님이 나갔습니다.")

    return answer