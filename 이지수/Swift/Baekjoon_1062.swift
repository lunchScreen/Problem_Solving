import Foundation

@inline(__always)
func combination(_ nums:[Int], _ target: Int) -> [[Int]] {
    guard target > 0 else { return [[]] }
    @inline(__always)
    func combination(_ index: Int,_ current:[Int]) {
        guard current.count < target else { return result.append(current) }
        Array((index+1)..<(nums.count-target+current.count+1)).forEach() {combination($0, current + [nums[$0]])}
    }
    var result = [[Int]]()
    for i in 0...nums.count-target { combination(i, [nums[i]]) }
    return result
}

@inline(__always)
func start() -> Int {
    let input = readLine()!.split(separator: " ").map(){Int(String($0))!}
    var words = [[Int]]()
    for _ in 0..<input[0] {
        let word = Array(readLine()!)
        words.append(Array(Set(word)).map() {Int($0.unicodeScalars.first!.value - 97)}.filter() { ![0, 8, 13, 19, 2].contains($0) })
    }
    guard input[1] > 4 else { return 0 }
    let needs = Array(Set<Int>(words.flatMap(){$0}))
    return solution(words, combination(needs, min(input[1]-5, needs.count)))
}

@inline(__always)
func solution(_ words: [[Int]], _ nums: [[Int]]) -> Int {
    nums.reduce(0) {max($0, check(words, $1))}
}

@inline(__always)
func check(_ words: [[Int]], _ num: [Int]) -> Int {
    words.filter(){word in 
        for i in word where !num.contains(i) { return false }
        return true
    }.count
}

print(start())
