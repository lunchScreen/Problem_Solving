import Foundation
func solution(_ m: Int, _ n: Int) {
    for num in m...n where isPrime(num) { print(num) }
}
func isPrime(_ num: Int) -> Bool {
    guard num > 2 else { return num == 2 }
    for i in 2...Int(sqrt(Double(num)))+1 where num % i == 0 { return false }
    return true
}
let input = readLine()!.split(separator: " ").map(){Int($0)!}
solution(input[0], input[1])
