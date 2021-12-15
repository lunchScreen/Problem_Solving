// 1025
import Foundation

@inline(__always)
func getMap(_ n: Int) -> [[Int]] {
    var map: [[Int]] = []
    for _ in 0..<n {
        map.append(readLine()!.reduce([]) { $0 + [Int(String($1))!] })
    }
    return map
}

@inline(__always)
func getMaxIn(cDist: Int, rDist: Int, _ size: (n: Int, m:Int), _ map: [[Int]]) -> Int {
    var maxValue = -1
    for i in 0..<size.n {
        for j in 0..<size.m {
            maxValue = max(getMaxAt(point: (i, j), dist: (cDist, rDist), size, map), maxValue)
        }
    }
    return maxValue
}

@inline(__always)
func getMaxAt(point target: (x: Int, y: Int), dist: (c: Int, r: Int), _ size: (n: Int, m: Int), _ map: [[Int]]) -> Int {
    guard dist.c != 0 || dist.r != 0 else {
        return sqrt(Double(map[target.x][target.y])).truncatingRemainder(dividingBy: 1) == 0 ? map[target.x][target.y] : -1
    }
    var results: [Int] = []
    let types: [(Int, Int)] = dist.c * dist.r == 0 ? [(-1, -1), (1, 1)] : [(1, 1), (1, -1), (-1, -1), (-1, 1)]
    for type in types {
        var result: [Int] = []
        var current = 0
        if dist.c == 0 {
            let i = target.x
            Array(stride(from: target.y, to: type.1 > 0 ? size.m : -1, by: dist.r * type.1)).forEach { j in
                current *= 10
                current += map[i][j]
                result.append(current)
            }
        }
        else if dist.r == 0 {
            let j = target.y
            Array(stride(from: target.x, to: type.0 > 0 ? size.n : -1, by: dist.c * type.0)).forEach { i in
                current *= 10
                current += map[i][j]
                result.append(current)
            }
        }
        else {
            var (i, j) = target
            while (0..<size.n ~= i && 0..<size.m ~= j) {
                current *= 10
                current += map[i][j]
                result.append(current)
                i += (dist.c * type.0); j += (dist.r * type.1)
            }
        }
        results += result.filter() { sqrt(Double($0)).truncatingRemainder(dividingBy: 1) == 0 }
    }
    return results.max() ?? -1
}

@inline(__always)
func solution(n: Int, m: Int) -> Int {
    let map = getMap(n)
    var maxValue: Int = -1
    Array(0..<n).forEach { i in
        Array(0..<m).forEach { j in
            maxValue = max(maxValue, getMaxIn(cDist: i, rDist: j, (n, m), map))
        }
    }
    return maxValue
}

let inputs = readLine()!.components(separatedBy: " ").map() { Int($0)! }
print(solution(n: inputs[0], m: inputs[1]))
