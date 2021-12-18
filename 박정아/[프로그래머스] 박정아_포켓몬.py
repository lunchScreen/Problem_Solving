def solution(nums):
    half = int(len(nums) / 2)
    setCount = len(set(nums))
    return min(half, setCount)
