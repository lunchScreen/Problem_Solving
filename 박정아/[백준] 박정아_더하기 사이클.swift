import Foundation

func solution() {
    let n = Int(readLine()!)!
    var current = n
    var cycle = 0
    
    repeat {
        let firstNum = current % 10
        let sum = current / 10 + firstNum
        current = firstNum * 10 + sum % 10
        cycle += 1
    } while n != current
    
    print(cycle)
}

solution()

