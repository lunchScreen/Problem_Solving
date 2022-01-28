import Foundation

let input = readLine()!.split(separator: " ").map(){Int($0)!}
var sqs = Array<[Int]>()
for _ in 0..<input[0] {
    var sq = [Int]()
    for c in readLine()! {
        sq.append(Int(String(c))!)
    }
    sqs.append(sq)
}

var result = 1
for i in 0..<input[0]-1 {
    for j in 0..<input[1]-1 {
        for k in j+1..<input[1] {
            if i+k-j >= input[0] { break }
            if sqs[i][j] == sqs[i][k] && sqs[i][j] == sqs[i+k-j][j] && sqs[i][j] == sqs[i+k-j][k] {
                result = max(k-j+1, result)
            }
        }
    }
}

print(result*result)
