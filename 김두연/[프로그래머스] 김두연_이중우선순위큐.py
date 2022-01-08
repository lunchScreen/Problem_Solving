import heapq

def solution(operations):
    min_heap = []
    max_heap = []

    for operation in operations:
        if operation == "D 1":
            if not max_heap:
                continue
            heapq.heappop(max_heap)
            if not max_heap or -max_heap[0] < min_heap[0]:
                max_heap = []
                min_heap = []
        elif operation == "D -1":
            if not min_heap:
                continue
            heapq.heappop(min_heap)
            if not min_heap or -max_heap[0] < min_heap[0]:
                max_heap = []
                min_heap = []
        else:
            oper = operation.split(" ")
            heapq.heappush(min_heap, int(oper[1]))
            heapq.heappush(max_heap, -int(oper[1]))

    return [0, 0] if not min_heap else [-max_heap[0], min_heap[0]]