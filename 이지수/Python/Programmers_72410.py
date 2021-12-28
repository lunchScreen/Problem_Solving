import re
def solution(new_id):
    answer = re.sub(pattern="[^a-z0-9-_.]", repl="", string=new_id.lower())
    answer = re.sub(pattern="[.]+", repl=".", string=answer)
    if len(answer) > 0 and answer[0] == "." : answer = answer[1:]
    if len(answer) > 0 and answer[-1] == "." : answer = answer[:-1]
    if answer == "" : answer = "a"
    if len(answer) > 15 : answer = answer[:15 if answer[14] != "." else 14]
    if len(answer) < 3 : answer += answer[-1]*(3-len(answer))
