import heapq
from collections import deque

def solution(jobs):
    job_list = deque(sorted([(job[1], job[0]) for job in jobs], key=lambda x: (x[1], x[0])))
    queue = []
    heapq.heappush(queue, job_list.popleft())
    current_time, total_time = 0, 0

    while queue:
        dur_time, req_time = heapq.heappop(queue)
        current_time = max(current_time, req_time) + dur_time
        total_time += current_time - req_time

        while job_list and job_list[0][1] <= current_time:
            heapq.heappush(queue, job_list.popleft())
        if job_list and not queue:
            heapq.heappush(queue, job_list.popleft())

    return total_time // len(jobs)