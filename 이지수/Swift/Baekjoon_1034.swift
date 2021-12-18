// 1034
import Foundation

@inline(__always)
func startWith(n: Int, m: Int) -> Void {
    var lines: [[Character]] = []
    for _ in 0..<n { lines.append(Array(readLine()!)) }
    let k: Int = Int(readLine()!)!
    print(solutionWith(orders: orders(by: lines), k: k))
}

@inline(__always)
func solutionWith(orders: [(Int, [Character])], k: Int) -> Int {
    for order in orders where isAvailable(line: order.1, k: k) { return order.0 }
    return 0
}

@inline(__always)
func num(line: [Character]) -> Int {
    return Int(line.reduce("") {"\($0)\($1)"}, radix:2)!
}

@inline(__always)
func orders(by lines: [[Character]]) -> [(Int, [Character])] {
    var orders: [Int: (Int, [Character])] = [:]
    for line in lines {
        let num: Int = num(line: line)
        orders[num] = ((orders[num]?.0 ?? 0) + 1, line)
    }
    return orders.values.sorted(by: {$0.0 > $1.0})
}

@inline(__always)
func isAvailable(line: [Character], k: Int) -> Bool {
    let count = line.filter{$0=="0"}.count
    return count <= k && count % 2 == k % 2
}

let input: [Int] = readLine()!.components(separatedBy: " ").map(){ Int($0)! }
startWith(n: input[0], m: input[1])
