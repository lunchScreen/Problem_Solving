import Foundation

func solution(_ k:Int, _ dungeons:[[Int]]) -> Int {
    var maxCount = 0
    
    func dfs(i: Int, k: Int, count: Int, visited: [Bool]) {
        var now = dungeons[i]
        var mutableK = k
        var mutableVisited = visited
        var mutableCount = count
        mutableVisited[i] = true
        
        if mutableK >= now[0] {
            mutableK -= now[1]
            mutableCount += 1
            for j in 0..<visited.count {
                if !mutableVisited[j] {
                    dfs(i: j, k: mutableK, count: mutableCount, visited: mutableVisited)
                }
            }
        }
        
        if mutableCount > maxCount {
            maxCount = mutableCount
        }
    }
    
    for i in 0..<dungeons.count {
        dfs(i: i, k: k, count: 0, visited: Array(repeating: false, count: dungeons.count))
    }
    
    return maxCount
}
