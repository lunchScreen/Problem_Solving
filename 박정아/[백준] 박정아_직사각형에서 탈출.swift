import Foundation

func solution() {
    let input = readLine()!.split(separator: " ").map{ Int($0)! }
    let a = min(input[0], input[2] - input[0])
    let b = min(input[1], input[3] - input[1])
    print(min(a, b))
}

solution()
