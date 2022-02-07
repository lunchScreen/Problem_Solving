import Foundation

func baekjoon2352() {
    let n = Int(readLine()!)!
    let list = readLine()!.split(separator: " ").map { Int(String($0))! }
    var result = [Int]()
    
    for i in 0..<n {
        if result.isEmpty {
            result.append(list[i])
        } else {
            if result.last! < list[i] {
                result.append(list[i])
            } else {
                var left = 0
                var right = result.count - 1
                
                while left < right {
                    let mid = (left + right) / 2
                    if result[mid] < list[i] {
                        left = mid + 1
                    } else {
                        right = mid
                    }
                }
                
                result[right] = list[i]
            }
        }
    }
    
    print(result.count)
}

//baekjoon2352()
