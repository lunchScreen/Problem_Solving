import Foundation

func calculate(_ numbers: [Int], _ op: String) -> Int {
    var result = numbers[0]
            
    if numbers.count > 1 && op == "+" {
        result = numbers[1...].reduce(result,+)
    } else if numbers.count > 1 && op == "-" {
        result = numbers[1...].reduce(result,-)
    } else if numbers.count > 1 && op == "*" {
        result = numbers[1...].reduce(result,*)
    }

    return result
}

func calculate(_ expression: String, _ op: [String]) -> Int64 {
    let numbers: [Int] = expression.components(separatedBy: op[2]).map { 
        let numbers: [Int] = $0.components(separatedBy: op[1]).map { 
            let numbers: [Int] = $0.components(separatedBy: op[0]).compactMap { Int($0) }
            return calculate(numbers, op[0])
        } 
        return calculate(numbers, op[1])
    }
    return Int64(abs(calculate(numbers, op[2])))
}

func solution(_ expression:String) -> Int64 {
    let cases = [["*","+","-"],["*","-","+"],["+","-","*"],["+","*","-"],["-","*","+"],["-","+","*"]]
    
    return cases.map { calculate(expression, $0) }.max()!
}
