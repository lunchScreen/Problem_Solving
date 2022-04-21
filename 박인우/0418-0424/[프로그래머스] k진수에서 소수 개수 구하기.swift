import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    func isPrime(_ n: Int) -> Bool {
        if n <= 1 { return false }
        else if n <= 3 { return true }
        
        for i in 2...Int(sqrt(Double(n))) {
            if n % i == 0 {
                return false
            }
        }
        
        return true
    }
    
    return String(n, radix:k).components(separatedBy: "0").flatMap {
        Int($0)
    }.filter {
        isPrime($0)
    }.count
}
