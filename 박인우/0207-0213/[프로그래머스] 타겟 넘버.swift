import Foundation

// solution1

func solution(_ numbers:[Int], _ target:Int) -> Int {
    var answer = 0
    var bfs = [numbers[0],-numbers[0]]
    
    for i in 1..<numbers.count {
        for _ in 1...bfs.count {
            var now = bfs.removeFirst()
            bfs.append(now + numbers[i])
            bfs.append(now - numbers[i])
            if i == numbers.count-1 && now+numbers[i] == target {
                answer += 1
            } 
            if i == numbers.count-1 && now-numbers[i] == target {
                answer += 1
            }
        }
    }
    
    return answer
}

// solution2

func caculation(numbers: [Int], target: Int, index: Int, sum: Int) -> Int {
    if index == numbers.count {
        return sum == target ? 1 : 0
    }

    return caculation(numbers: numbers, target: target, index: index + 1, sum: sum + numbers[index]) + caculation(numbers: numbers, target: target, index: index + 1, sum: sum - numbers[index])

}

func solution(_ numbers: [Int], _ target: Int) -> Int {
    return caculation(numbers: numbers, target: target, index: 0, sum: 0)
}
