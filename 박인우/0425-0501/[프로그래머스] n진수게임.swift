import Foundation

func solution(_ n:Int, _ t:Int, _ m:Int, _ p:Int) -> String {
    var totalLength = 0
    var charge = 1
    var number = 0
    var turn = 0
    var result = ""
    
    while turn < t {
        totalLength += charge
        
        while p + m*turn <= totalLength && turn < t {
            let offset = p + m*turn - (totalLength - charge) - 1
            let now = String(number, radix: n).uppercased()
            result += String(now[now.index(now.startIndex, offsetBy: offset)])
            turn += 1
        }
        
        number += 1
        if Double(number) == pow(Double(n), Double(charge)) { charge += 1 }
    }
    
    return result
}
