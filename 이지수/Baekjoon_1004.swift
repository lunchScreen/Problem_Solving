import Foundation

let t: Int = Int(readLine()!)!
for _ in (0..<t) {
    let di: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
    let n: Int = Int(readLine()!)!
    var count: Int = 0
    for _ in (0..<n) {
        let input: [Int] = readLine()!.components(separatedBy: " ").map{ Int($0)! }
        let sin: Bool = pow(Double(input[0]-di[0]),2) + pow(Double(input[1]-di[1]),2) < pow(Double(input[2]), 2)
        let ein: Bool = pow(Double(input[0]-di[2]),2) + pow(Double(input[1]-di[3]),2) < pow(Double(input[2]), 2)
        if sin && ein { continue }
        else if sin || ein { count += 1 }
    }
    print(count)
}
