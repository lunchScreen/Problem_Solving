import Foundation

func baekjoon12738(_ n: Int) -> Int {
    let a = readLine()!.split(separator: " ").map { Int(String($0))! }
    var array = [Int]()
    
    for i in 0..<a.count {
        if array.isEmpty {
            array.append(a[i])
        } else if array.last! < a[i] {
            array.append(a[i])
        } else {
            var left = 0
            var right = array.count - 1
            
            while left <= right {
                let mid = (left + right) / 2
                if array[mid] < a[i] {
                    left = mid + 1
                } else {
                    right = mid - 1
                }
            }
            array[left] = a[i]
        }
    }
    
    return array.count
}

//let n = Int(readLine()!)!
//print(baekjoon12738(n))
