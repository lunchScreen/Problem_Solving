import Foundation

func solution() {
    let input = (readLine()!).split(separator: " ").map{ Int(String($0.reversed()))! }
    print(input.max()!)
}

solution()

