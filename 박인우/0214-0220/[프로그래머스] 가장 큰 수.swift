import Foundation

func solution(_ numbers:[Int]) -> String {
    var result = numbers.sorted(by: {
        return Int("\($0)\($1)")! > Int("\($1)\($0)")!
    }).map { String($0) }.joined()
    
    return result.first! == "0" ? "0" : result
}

func solution(_ numbers:[Int]) -> String {
    let result = numbers.map { String($0) }.sorted(by: {
        let one = $0+$0+$0
        let two = $1+$1+$1
        return one > two
    }).joined()
    
    return result.first! == "0" ? "0" : result
}
