import Foundation

func solution(_ key:[[Int]], _ lock:[[Int]]) -> Bool {
    var key = key
    let n = lock.count
    let m = key.count
    
    func rotate() {
        var newKey = [[Int]]()
        for x in 0..<m {
            var temp = [Int]()
            for y in (0..<m).reversed() {
                temp.append(key[y][x])
            }
            newKey.append(temp)
        }
        key = newKey
    }
    
    func test() -> Bool {
        for sy in 1-n..<n {
            for sx in 1-n..<n {
                var mlock = lock
                for y in 0..<m {
                    for x in 0..<m {
                        if y-sy < 0 || x-sx < 0 { continue }
                        if y-sy >= n || x-sx >= n { continue }
                        mlock[y-sy][x-sx] += key[y][x]
                    }
                }
                if check(mlock) { 
                    return true 
                }
            }
        }
        return false
    }
    
    func check(_ lock: [[Int]]) -> Bool {
        for y in 0..<lock.count {
            for x in 0..<lock.count {
                if lock[y][x] != 1 {
                    return false
                }
            }   
        }
        return true
    }
    
    if check(lock) { return true }
    for _ in 0...3 {
        rotate()
        if test() { return true }
    }
    
    return false
}
