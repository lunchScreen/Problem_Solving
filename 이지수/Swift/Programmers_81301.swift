import Foundation

func solution(_ s:String) -> Int {
    var answer = 0
    var pass = 0
    for (i, c) in s.enumerated() {
        guard pass < 1 else { pass -= 1; continue }
        let num: Int
        switch Int(c.unicodeScalars.first!.value) {
        case 48...57 : num = Int(String(c))!
        default: 
            let arrayS = Array(s)
            switch (c, arrayS[i+1]) {
            case ("z", _) : pass = 3; num = 0
            case ("o", _) : pass = 2; num = 1
            case ("t", "w") : pass = 2; num = 2
            case ("t", _) : pass = 4; num = 3
            case ("f", "o") : pass = 3; num = 4
            case ("f", _) : pass = 3; num = 5
            case ("s", "i") : pass = 2; num = 6
            case ("s", _) : pass = 4; num = 7
            case ("e", _) : pass = 4; num = 8
            case ("n", _) : pass = 3; num = 9
            default: num = 0
            }
        }
        answer = answer*10+num
    }
    return answer
}
