import Foundation

func solution() {
    let n = Int(readLine()!)!
    let m = (readLine()!).map{ Int(String($0))! }
    var answer = 0
    
    for i in (0..<m.count).reversed() {
        let tmp = n * m[i]
        print(tmp)
        answer += tmp * Int(pow(10, m.count - i - 1) as NSNumber)
    }
    
    print(answer)
}

solution()

 
