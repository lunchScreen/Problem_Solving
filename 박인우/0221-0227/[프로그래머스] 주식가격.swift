func solution(_ prices: [Int]) -> [Int] {
    var answer = Array(repeating: 0, count: prices.count)
    var stack = [(Int,Int)]()
    
    for i in 0..<prices.count {
        if stack.isEmpty {
            stack.append((i,prices[i]))
            continue
        }
        
        while stack.count > 0 && stack[stack.count-1].1 > prices[i] {
            let now = stack.removeLast()
            answer[now.0] = i - now.0
        }
        
        stack.append((i,prices[i]))
    }
    
    while stack.count > 0 {
        let now = stack.removeLast()
        answer[now.0] = prices.count - now.0 - 1
    }
    
    return answer
}
