import Foundation

func baekjoon5052() {
    let t = Int(readLine()!)!
    
    for _ in 0..<t {
        let n = Int(readLine()!)!
        var phoneBook = [String]()
        
        for _ in 0..<n {
            phoneBook.append(readLine()!)
        }
        
        phoneBook.sort()
        var result = true
        for i in 1..<phoneBook.count {
            if phoneBook[i-1].count == phoneBook[i].count {
                continue
            } else {
                if phoneBook[i].hasPrefix(phoneBook[i-1]) {
                    result = false
                    break
                }
            }
        }
        
        if result {
            print("YES")
        } else {
            print("NO")
        }
    }
}

//baekjoon5052()
