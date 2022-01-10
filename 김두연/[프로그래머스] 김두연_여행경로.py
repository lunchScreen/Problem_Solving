from collections import defaultdict

def solution(tickets):
    answer = []
    graph = defaultdict(list)

    for ticket in tickets:
        graph[ticket[0]].append(ticket[1])

    for key in graph.keys():
        graph[key].sort()

    stack = ['ICN']

    while stack:
        tmp = stack[-1]
        if not graph[tmp]:
            answer.append(stack.pop())
        else:
            stack.append(graph[tmp].pop(0))
    answer.reverse()
    return answer