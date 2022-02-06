import Foundation

func solution(_ numbers:[Int]) -> [Int] {
    var result = Set<Int>()

    for i in 0 ..< numbers.count {
        for j in i + 1 ..< numbers.count {
            let num = numbers[i] + numbers[j]
            result.insert(num)
        }
    }
    
    return result.sorted()
}
