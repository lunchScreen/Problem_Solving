import Foundation

func baekjoon5582() {
    let s1 = readLine()!.map { String($0) }
    let s2 = readLine()!.map { String($0) }
    
    var dp = Array(repeating: Array(repeating: 0, count: 4001), count: 4001)
    var result = 0
    
    for i in 1...s1.count {
        for j in 1...s2.count {
            if s1[i-1] == s2[j-1] {
                dp[i][j] = dp[i-1][j-1] + 1
                result = max(result, dp[i][j])
            }
        }
    }
    
    print(result)
}

//baekjoon5582()
