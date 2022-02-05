import Foundation

func baekjoon3020() {
    let temp = readLine()!.split(separator: " ").map { Int(String($0))! }
    let n = temp[0], h = temp[1]
    
    var bottom = Array(repeating: 0, count: h+1)
    var top = Array(repeating: 0, count: h+1)
    
    for i in 0..<n {
        let height = Int(readLine()!)!
        
        if i % 2 == 0 {
            bottom[height] += 1
        } else {
            top[height] += 1
        }
    }
    
    for i in (1..<h-1).reversed() {
        bottom[i] += bottom[i+1]
        top[i] += top[i+1]
    }
    
    var result = Array(repeating: 0, count: h+1)
    var minValue = n + 1
    var count = 0
    
    for i in 1...h {
        result[i] = top[i] + bottom[h-i+1]
        
        if result[i] == minValue {
            count += 1
        } else if result[i] < minValue {
            minValue = result[i]
            count = 1
        }
    }
    
    print(minValue, count)
}

//baekjoon3020()
