import Foundation

func baekjoon4673() {
    var result = Array(repeating: false, count: 10001)

    for i in 1...10000 {
        var cur = i
        var sum = i
        sum += cur/1000
        cur %= 1000
        sum += cur/100
        cur %= 100
        sum += cur/10
        sum += cur%10
        if sum > 10000 { continue }
        result[sum] = true
    }

    for i in 1...10000 {
        if !result[i] {
            print(i)
        }
    }
}

//baekjoon4673()
