import Foundation

func solution(_ lottos:[Int], _ win_nums:[Int]) -> [Int] {
    let zeroCount = lottos.filter { $0 == 0 }.count
    let winCount = win_nums.filter { lottos.contains($0) }.count

    return [min(7-winCount-zeroCount,6), min(7-winCount,6)]
}