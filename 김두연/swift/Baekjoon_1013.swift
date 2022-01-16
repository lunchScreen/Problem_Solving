import Foundation

func baekjoon1013() {
    let regex = "^(100+1+|01)+$"
    
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let str = readLine()!
        
        guard let _ = str.range(of: regex, options: .regularExpression) else {
            print("NO")
            continue
        }
        print("YES")
    }
}

//baekjoon1013()
