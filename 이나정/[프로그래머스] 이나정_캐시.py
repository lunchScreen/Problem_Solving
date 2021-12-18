def solution(cacheSize, cities):
    cache = []
    answer = 0
    
    for city in cities:
        city = city.lower()
        if city in cache:
            cache.remove(city)
            cache.append(city)
            answer += 1
        else:
            cache.append(city)
            if len(cache) > cacheSize:
                cache.pop(0)
            answer += 5
    return answer
