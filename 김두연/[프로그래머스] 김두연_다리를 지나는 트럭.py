from collections import deque

def solution(bridge_length, weight, truck_weights):
    answer = 0
    bridge = deque([0] * bridge_length)
    truck_list = deque(truck_weights)
    weigth_sum = 0

    while True:
        weigth_sum -= bridge.popleft()
        if truck_list and weigth_sum + truck_list[0] <= weight:
            w = truck_list.popleft()
            bridge.append(w)
            weigth_sum += w
        else:
            bridge.append(0)
        answer += 1
        if weigth_sum == 0:
            break

    return answer