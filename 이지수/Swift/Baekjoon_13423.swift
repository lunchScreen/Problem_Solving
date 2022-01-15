import Foundation
let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let x = readLine()!.split(separator: " ").map(){Int($0)!}
    var d = [Double: Bool]()
    var cnt = 0
    for i in x { d[Double(i)] = true }
    for i in 0..<n {
        for j in i+1..<n where d[Double(x[i]+x[j])/Double(2)] != nil {
            cnt += 1
        }
    }
    print(cnt)
}
