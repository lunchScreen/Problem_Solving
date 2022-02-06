import Foundation

var answer = Set<Int>()

func solution(_ numbers:String) -> Int {
    let numbers = numbers.map{ String($0) }
    
    for i in 1...numbers.count {
        dfs(0, numbers, "", i)
    }
    
    return answer.count
}

func dfs(_ depth: Int, _ numbers: [String], _ number: String, _ maxDepth: Int) {
    if depth == maxDepth {
        prime(number)
        return
    }
    
    for i in 0..<numbers.count {
        var numbers = numbers
        let newNumber = number + numbers.remove(at: i)
        dfs(depth + 1, numbers, newNumber, maxDepth)
    }
}

func prime(_ number: String) {
    guard let number = Int(number) else { return }
    let sqrt = Int(Double(number).squareRoot())
    
    if number == 2 || number == 3 {
        answer.insert(number)
        return
    }
    
    if 1 < number {
        for i in 2...sqrt {
            if number % i == 0 {
                return
            }
        }
        answer.insert(number)
    }
}
