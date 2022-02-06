import Foundation

func baekjoon11758() -> Int {
    let p1 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let p2 = readLine()!.split(separator: " ").map { Int(String($0))! }
    let p3 = readLine()!.split(separator: " ").map { Int(String($0))! }
    
    let a = p1[0]*p2[1] + p2[0]*p3[1] + p3[0]*p1[1]
    let b = p2[0]*p1[1] + p3[0]*p2[1] + p1[0]*p3[1]
    
    if a - b > 0 { return 1 }
    else if a == b { return 0 }
    return -1
}

//print(baekjoon11758())
