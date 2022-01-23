import Foundation

func solution(_ n:Int, _ k:Int) -> Int {
    if k < 2 { return 0 }
    let nums = String(n, radix: k).split(separator: "0").filter{ $0 != "" }.map{ Int($0)! }
    return nums.filter{ isPrime(num: $0) }.count
}

func isPrime(num: Int) -> Bool {
    if num == 1 { return false }
    if num == 2 || num == 3 { return true }

    let sqrt = Int(Double(num).squareRoot())
    
    for i in 2...sqrt {
        if num % i == 0 {
            return false
        }
    }
    
    return true
}
