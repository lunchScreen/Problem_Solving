import Foundation

func solution(_ numbers:[Int]) -> String {
    return numbers.sorted(by: {
        return Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }).map { String($0) }.joined()
}
